<?php
class Marquesina extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				$this->require_min_level(1);
                $this->load->model('marquesina_model');
				
                $this->load->helper('url_helper');
        }

		public function index()
		{
		redirect('/marquesina/admin');
		}
		
		public function create($id= FALSE)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			$this->load->model('categoria_model');
			
			$data["title"]="Crear Marquesina";
	
			$data["categorias"]= $this->categoria_model->all();
		
			
			$this->form_validation->set_rules('categoria', 'Categoría', 'integer|required');
			$this->form_validation->set_rules('inicio', 'Inicio', 'required');
			
			
			
			if ($this->form_validation->run() == FALSE)
			{
				$data["marquesina"]=$_POST;
				$this->load->view('templates/header', $data);
				$this->load->view('marquesina/create', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				unset($_POST["token"]);
				$insert=$this->marquesina_model->insert_entry($_POST);
				
				if($insert==1){
					 redirect('/marquesina/view/'.$this->marquesina_model->id);
				}else{
					
					if($insert=="duplicado"){
						
						
						$data["error"]="Marquesina duplicada. Contiene la misma fecha de inicio y categoria que otra marquesina ya creada.";
					}
					
					$this->load->view('templates/header', $data);
					$this->load->view('marquesina/create', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}
		
		public function update($id)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			$this->load->model('categoria_model');
			
				$data["title"]="Editar Marquesina";
				$data["marquesina"]=$this->marquesina_model->all($id);
			
			$data["categorias"]= $this->categoria_model->all();
			//if(isset($_POST["nombre"])){
				//$this->marquesina_model->insert_entry($_POST);
			//}
			//$this->form_validation->set_rules('nombre', 'Nombre', 'required');
			$this->form_validation->set_rules('categoria', 'Categoría', 'integer|required');
			$this->form_validation->set_rules('inicio', 'Inicio', 'required');
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('marquesina/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["id"]= $id;
				unset($_POST["token"]);
				if($this->marquesina_model->update_entry($_POST)){
					redirect('/marquesina/view/'.$data["marquesina"]["id"], 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('marquesina/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		
        
		}

		public function view($slug = NULL)
		{
			
			$data['marquesina'] = $this->marquesina_model->all($slug);
			

			if (empty($data['marquesina']))
			{
					show_404();
			}
			$this->load->model('categoria_model');
			 $data['marquesina']['categoria_nombre']=$this->categoria_model->all($data['marquesina']['categoria'])["nombre"];
			 
			 $this->load->model('imagen_model');
			 $data["marquesina"]["imagenes"]= $this->imagen_model->allMarquesina($slug);

			$data['title'] = "Marquesina";

			$this->load->view('templates/header', $data);
			$this->load->view('marquesina/view', $data);
			$this->load->view('templates/footer');
		}
		
		public function upload(){
			$ds          = DIRECTORY_SEPARATOR;  //1

			//$storeFolder = base_url().'uploads';   //2

			if (!empty($_FILES)) {
				 
				$this->load->model('imagen_model');
				 
				$formato=  substr($_FILES['file']['name'],strrpos($_FILES['file']['name'],"."));
				$model=array("formato"=>$formato,"marquesina"=>$_POST["marquesina"],"orden"=>$_POST["orden"]);
				$this->imagen_model->insert_entry($model);
				
				$tempFile = $_FILES['file']['tmp_name'];          //3             
				
				//$targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;  //4
				$targetPath =  FCPATH.'uploads/'.$_POST["marquesina"]."/";   //2;  //4
				
				if(!is_dir($targetPath)){
					mkdir ($targetPath);
				}
				
				
				$targetFile =  $targetPath. $this->imagen_model->id.$formato;  //5
				
				move_uploaded_file($tempFile,$targetFile); //6
				echo json_encode(array("id"=>$this->imagen_model->id,"orden"=>$this->imagen_model->orden));
				$this->marquesina_model->setJson($_POST["marquesina"]);
			}
		}
		
		public function orden()
		{
			
			if(isset($_POST["json"])){
				$this->load->model('imagen_model');
				$json= json_decode( $_POST["json"]);
				$imagenes= $json->ids;
				
				foreach($imagenes as $key=>$value){
					
					$this->imagen_model->updateOrden($key,$value);
					
				}
				$this->marquesina_model->setJson($json->marquesina);
			}
			echo "fin";
		}
		
		public function delete($id){
			$this->load->model('categoria_model');
			$categoria=$this->categoria_model->all($this->marquesina_model->all($id)["categoria"]);
			echo $this->marquesina_model->delete($id);
			
			$marquesina=$this->marquesina_model->getNearer($categoria["id"]);
				
				if($marquesina==null){
					$categoria["actual"]= null;
					$this->categoria_model->update_entry($categoria);
				}else {
					if($marquesina["id"]!=$categoria["actual"]){
						
						$categoria["actual"]= $marquesina["id"];
						$this->categoria_model->update_entry($categoria);
					}
				}
		}
		
		public function deleteImagen($id){
			$this->load->model('imagen_model');
			$marquesina= $this->imagen_model->all($id)["marquesina"];
			$this->imagen_model->delete($id);
			$this->marquesina_model->setJson($marquesina);
		}
		
		public function admin(){
			$data["marquesinas"]= $this->marquesina_model->all();
			$this->load->model('categoria_model');
			 $aux=$this->categoria_model->all();
			foreach($aux as $categoria){
				
				$categorias[$categoria["id"]]=$categoria["nombre"];
				$vigentes[$categoria["id"]]=$categoria["actual"];
			}
			$data["categorias"]=$categorias;
			$data["vigentes"]=$vigentes;
			$data["title"]= "Administrar Marquesinas";
			$this->load->view('templates/header', $data);
			$this->load->view('marquesina/admin', $data);
			$this->load->view('templates/footer');
		}
		
}