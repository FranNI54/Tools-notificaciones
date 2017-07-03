<?php
class Grupo extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				$this->require_min_level(1);
                $this->load->model('grupo_model');
				
                $this->load->helper('url_helper');
        }

      
		
		public function create($id= FALSE)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			$this->load->model('notificacion_model');
			
			$data["title"]="Crear grupo";
			$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('nombre', 'Nombre de grupo', 'required');			
			
			if ($this->form_validation->run() == FALSE)
			{
				$data["grupo"]=$_POST;
				$this->load->view('templates/header', $data);
				$this->load->view('grupo/create', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				unset($_POST["token"]);
				if($this->grupo_model->insert_entry($_POST)){
					 redirect('/grupo/view/'.$this->grupo_model->id, 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('grupo/create', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}
		
		public function update($id)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
				$data["title"]="Editar grupo";
				$data["grupo"]=$this->grupo_model->all($id);
				$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('nombre', 'Nombre de grupo', 'required');	
			
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('grupo/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["id"]= $id;
				unset($_POST["token"]);
				if($this->grupo_model->update_entry($_POST)){
					redirect('/grupo/view/'.$data["grupo"]["id"], 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('marquesina/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}

		public function view($slug = NULL)
		{
			
			$data['grupo'] = $this->grupo_model->all($slug);
			

			if (empty($data['grupo']))
			{
					show_404();
			}
			$data["sidebar"]="sidebar-n";
			$data['title'] = "Grupo";
			$this->load->model('relGrupo_model');
			$data["clientes"]= $this->relGrupo_model->getModelsByGrupo($slug);
			
			$this->load->model('notificacion_model');
			$data["notificaciones"]= $this->notificacion_model->allByGrupo($slug);
			
			$this->load->view('templates/header', $data);
			$this->load->view('grupo/view', $data);
			$this->load->view('templates/footer');
		}
		
		public function delete($id){
			echo $this->grupo_model->delete($id);
		}
		
		public function admin(){
			$data["grupos"]= $this->grupo_model->all();
						
			
			$data["title"]= "Administrar grupos";
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('grupo/admin', $data);
			$this->load->view('templates/footer');
		}
		
		public function asignar($id){
			$this->load->model('cliente_model');
			$this->load->model('relGrupo_model');
			$data["clientes"]= $this->cliente_model->all();
			
			
			$data["title"]= "Asignar clientes";
			$data['grupo'] = $this->grupo_model->all($id);
			$data["asignados"]= $this->relGrupo_model->getIdsByGrupo($id);

			if (empty($data['grupo']))
			{
					show_404();
			}
			
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('grupo/asignar', $data);
			$this->load->view('templates/footer');
		}
		
		public function notificaciones($id){
			$this->load->model('notificacion_model');
			$data['grupo'] = $this->grupo_model->all($id);
			$data["notificaciones"]= $this->notificacion_model->allByGrupo($id);
			
			$data["title"]= "Notificaciones a ".$data["grupo"]["nombre"];
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('grupo/notificaciones', $data);
			$this->load->view('templates/footer');
		}
		
		public function asignarClientes($id){
			if(isset($_POST["json"])){
				$clientes= json_decode($_POST["json"]);
				$this->load->model('cliente_model');
				$this->load->model('relGrupo_model');
				$hashs= array();
				foreach($clientes as $cliente){
					
					$auxCliente= $this->cliente_model->all($cliente);
					$suscripciones=$this->cliente_model->getHash($auxCliente["CUST_NO"]);
					foreach($suscripciones as $suscripcion){
						if(isset($suscripcion["TOKEN_ID"])&&$suscripcion["TOKEN_ID"]!=""){
						array_push($hashs,$suscripcion["TOKEN_ID"]);
						}
					}
					$this->relGrupo_model->insert_entry(['grupo'=>$id,"cliente"=>$auxCliente["CUST_NO"]]);
				}
				$this->grupo_model->addHashs($id,$hashs);
			}
			var_dump($hashs);
		}
		
		public function quitar($rel){
			$this->load->model('relGrupo_model');
			$this->relGrupo_model->delete($rel);
		}
		
}