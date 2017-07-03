<?php
class Categoria extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				
				$this->load->model('categoria_model');
                $this->load->helper('url_helper');
        }

		public function index()
		{
		redirect('/categoria/admin');
		} 
		
		public function create()
		{
			$this->require_min_level(9);
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
			$data["title"]="Crear Categoría Marquesina";
			
			$this->form_validation->set_rules('nombre', 'Nombre', 'required');
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('categoria/create', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				unset($_POST["token"]);
				if($this->categoria_model->insert_entry($_POST)){
					 redirect('/categoria/view/'.$this->categoria_model->id, 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('categoria/create', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}
		
		public function update($id)
		{
			$this->require_min_level(9);
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
			
				$data["title"]="Editar Categoría Marquesina";
				$data["categoria"]=$this->categoria_model->all($id);
			
			
			
			$this->form_validation->set_rules('nombre', 'Nombre', 'required');
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('categoria/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["id"]= $id;
				unset($_POST["token"]);
				if($this->categoria_model->update_entry($_POST)){
					 redirect('/categoria/view/'.$data["categoria"]["id"], 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('categoria/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		
        
		}
		
		public function admin(){
			/*if($this->auth_level==9){
				redirect('/categoria/admin' );
			}else{
				redirect('/marquesina/admin' );
			}*/
			$this->require_min_level(9);
			$data["categorias"]= $this->categoria_model->all();
			$data["title"]= "Administrar Categorías";
			$this->load->view('templates/header', $data);
			$this->load->view('categoria/admin', $data);
			$this->load->view('templates/footer');
		}

		public function view($slug = NULL)
		{
			$this->require_min_level(9);
        $data['categoria'] = $this->categoria_model->all($slug);

        if (empty($data['categoria']))
        {
                show_404();
        }
		$this->load->model('marquesina_model');
        $data['title'] = $data['categoria']['nombre'];
		$data["marquesinas"]= $this->marquesina_model->allByCategoria($data["categoria"]["id"]);
		
        $this->load->view('templates/header', $data);
        $this->load->view('categoria/view', $data);
        $this->load->view('templates/footer');
		}
		
		public function delete($id){
			$this->require_min_level(9);
			echo $this->categoria_model->delete($id);
		}
		
		public function setVigente($app= FALSE){
			//date_default_timezone_set('America/Argentina/Buenos_Aires');
			//echo date('Y-m-d H:i:s', time());
			//echo "<hr>";
			if($app){
				$this->require_min_level(1);
			}
			$categorias= $this->categoria_model->active();
			$this->load->model('marquesina_model');
			$trace=false;
			if(isset($_GET["trace"])){
				$trace=$_GET["trace"];
			}
			if($trace){
				$html="";
				
			}
			$json= array();
			$this->load->model('miscelaneo_model');
			$url= $this->miscelaneo_model->all(1)["data"];
			if($url==""){
				$url=base_url();
			}
			foreach($categorias as $categoria){
				$marquesina=$this->marquesina_model->getNearer($categoria["id"]);
				if($trace){
				$html.= "<h4>".$categoria["nombre"].": ";
				}
				if($marquesina==null){
					if($trace){
					$html.= "vacia</h4>";
					$html.= "<hr>";
					}
				}else {
					if($marquesina["id"]!=$categoria["actual"]){
						if($trace){
						$html.= "Pasa a ".$marquesina["id"]."</h4>";
						$html.= "<br>";
						$html.= "<hr>";
						}
						$categoria["actual"]= $marquesina["id"];
						$this->categoria_model->update_entry($categoria);
					}else{
						if($trace){
						$html.= "Mantiene actual ".$categoria["actual"]."</h4>";
						$html.= '<hr>';
						}
					}
					if($marquesina["json"]!=null &&$marquesina["json"]!=""){
						if(strpos($marquesina["json"],$url)){
							$json[$categoria["nombre"]]=json_decode($marquesina["json"]);
						}else{
							$this->marquesina_model->setJson($marquesina["id"]);
							$marquesina=$this->marquesina_model->all($marquesina["id"]);
							$json[$categoria["nombre"]]=json_decode($marquesina["json"]);
						}
					}
				}
			}
			if($trace){
				$html.= "<h4>Json</h4>";
				$html.= "<div style='font-family: monospace; white-space:pre;'>".json_encode($json,JSON_PRETTY_PRINT)."</div>";
			}
			if($trace){
				$data["title"]= "Marquesinas actualizadas";
				$data["message"]= $html;
				if($app){
				$this->load->view('templates/header', $data);
				$this->load->view('templates/message', $data);
				$this->load->view('templates/footer');
				}else{
					echo $data["message"];
				}
			}
			file_put_contents (FCPATH."marquesinas.json",json_encode($json));
		}
		
}