<?php
class Notificacion extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				
                $this->load->model('notificacion_model');
				
                $this->load->helper('url_helper');
				if(!defined("API_ACCESS_KEY")){
				define( 'API_ACCESS_KEY', 'AIzaSyAwhRVO9O-Ck5_Ks3VEg2OLVbowVD7j-Aw' );
				}
				if(!defined("PROJECT_ID")){
					define( 'PROJECT_ID', 609592838656);
				}
        }

      
		
		public function create($id= FALSE)
		{
			$this->require_min_level(1);
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
			$data["title"]="Crear Notificación";
			$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('fecha', 'Fecha', 'required');			
			$this->form_validation->set_rules('destinatario', 'Destinatario', 'required');

			date_default_timezone_set('America/Argentina/Buenos_Aires');
			if(isset($_POST["fecha"])&&$_POST["fecha"]<date('Y-m-d H:i', time())){
				$fecha=1;
				$data["fecha"]=1;
			}else{
				$fecha=0;
				$data["fecha"]=0;
			}
			if(isset($_POST["link"])&&$_POST["link"]!=""){
				$link= !$this->validate_url($_POST["link"]);
				
				$data["link"]=$link;
			}else{
				$link=0;
				$data["link"]=0;
			}
			
			
			if($_POST["grupo"]&&$_POST["destinatario"]){
				if($_POST["grupo"]==1){
					$this->load->model('grupo_model');
					$destinatario= $this->grupo_model->all($_POST["destinatario"])["nombre"];
				}else{
					$this->load->model('cliente_model');
					$destinatario= $this->cliente_model->all($_POST["destinatario"])["CUST_NAME"];
				}
			}
			$data["destinatario"]=$destinatario;
			if ($this->form_validation->run() == FALSE||$fecha||$link)
			{
				$data["notificacion"]=$_POST;
				
				$this->load->view('templates/header', $data);
				$this->load->view('notificacion/create', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				unset($_POST["token"]);
			
				if($this->notificacion_model->insert_entry($_POST)){
					redirect('/notificacion/view/'.$this->notificacion_model->id);
				}else{
					$data["notificacion"]= $_POST;
					$this->load->view('templates/header', $data);
					$this->load->view('notificacion/create', $data);
					$this->load->view('templates/footer');
				}
				
				
				
			}
		}
		
		public function validate_url($url) {
			$data = trim($url);
			$data = stripslashes($url);
			$data = htmlspecialchars($url);
		


		 
			if (!preg_match("/\b(?:(?:https?|ftp))[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$url)) {
				return FALSE;
				} else {
			return TRUE;
			}
		} 
		
		public function update($id)
		{
			$this->require_min_level(1);
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
				$data["title"]="Editar Notificación";
				$data["notificacion"]=$this->notificacion_model->all($id);
				$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('fecha', 'Fecha', 'required');			
			$this->form_validation->set_rules('destinatario', 'Destinatario', 'required');		
			
			if($data["notificacion"]["grupo"]&&$data["notificacion"]["destinatario"]){
				if($data["notificacion"]["grupo"]==1){
					$this->load->model('grupo_model');
					$destinatario= $this->grupo_model->all($data["notificacion"]["destinatario"])["nombre"];
				}else{
					$this->load->model('cliente_model');
					$destinatario= $this->cliente_model->all($data["notificacion"]["destinatario"])["CUST_NAME"];
				}
			}
			$data["destinatario"]=$destinatario;
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('notificacion/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["id"]= $id;
				unset($_POST["token"]);
				if($this->notificacion_model->update_entry($_POST)){
					redirect('/notificacion/view/'.$data["notificacion"]["id"], 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('marquesina/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}

		public function view($slug = NULL)
		{
			$this->require_min_level(1);
			$data['notificacion'] = $this->notificacion_model->all($slug);
			

			if (empty($data['notificacion']))
			{
					show_404();
			}
			$this->load->model('relGrupo_model');
			$this->load->model('relNotificacion_model');
			if($data["notificacion"]["grupo"]&&$data["notificacion"]["destinatario"]){
				if($data["notificacion"]["grupo"]==1){
					$this->load->model('grupo_model');
					$destinatario= $this->grupo_model->all($data["notificacion"]["destinatario"]);
					if(isset($destinatario)&&isset($destinatario["nombre"])){
						$destinatario= $destinatario["nombre"];
					}else{
						$destinatario= "Destinatario inexistente";
					}
					$clientes= $this->relNotificacion_model->modelsByNotificacion($slug);
				}else{
					$this->load->model('cliente_model');
					$destinatario= $this->cliente_model->all($data["notificacion"]["destinatario"])["CUST_NAME"];
					$clientes= array($this->cliente_model->all($data["notificacion"]["destinatario"]));
				}
			}
			$data["clientes"]=$clientes;
			$data["destinatario"]=$destinatario;
			$data["sidebar"]="sidebar-n";
			$data['title'] = "Notificación";

			$this->load->view('templates/header', $data);
			$this->load->view('notificacion/view', $data);
			$this->load->view('templates/footer');
		}
		
		/*public function delete($id){
			$this->require_min_level(1);
			echo $this->notificacion_model->delete($id);
		}*/
		
		public function admin(){
			$this->require_min_level(1);
			$this->load->model('cliente_model');
			$notificaciones= $this->notificacion_model->all();
			foreach($notificaciones as &$notificacion){
				
				if($notificacion["grupo"]&&$notificacion["destinatario"]){
					if($notificacion["grupo"]==1){
						$this->load->model('grupo_model');
						$destinatario= $this->grupo_model->all($notificacion["destinatario"]);
						if(isset($destinatario)&&isset($destinatario["nombre"])){
							$destinatario= $destinatario["nombre"];
						}else{
							$destinatario= "Destinatario inexistente";
						}
						
					}else{
						$this->load->model('cliente_model');
						$destinatario= $this->cliente_model->all($notificacion["destinatario"]);
						if(isset($destinatario)&&isset($destinatario["CUST_NAME"])){
							$destinatario= $destinatario["CUST_NAME"];
						}else{
							$destinatario= "Destinatario inexistente";
						}
					}
				}else{
					$destinatario= "Destinatario inexistente";
				}
				$notificacion["nombre_destinatario"]=$destinatario;
				
			}
			
			$data["notificaciones"]= $notificaciones;
		
			$data["title"]= "Registro de Notificaciones Enviadas";
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('notificacion/admin', $data);
			$this->load->view('templates/footer');
		}
		
		public function send($id){
			$this->require_min_level(1);
			$model= $this->notificacion_model->all($id);
			$data["sidebar"]="sidebar-n";
			if(isset($model["response"])&&$model["response"]!=""){
				$data["message"]="Imposible de enviar, esta notificación ya fue enviada con anterioridad.";
			}else{
				
				$result=$this->notificacion_model->send($id);
				$json= json_decode($result);
				if((isset($json->error)&&$json->error)||isset($json->failure)&&$json->failure){
					$data["message"]="Problemas para enviar la notificación. Contacte a sistemas o intentelo nuevamente más tarde.";
				}else{
					$data["message"]="Enviado con éxito";
				}
				$data["debug"]= $result;
				
				$toUpdate["id"]=$id;
				$toUpdate["response"]=$result;
				date_default_timezone_set('America/Argentina/Buenos_Aires');
				$toUpdate["envio"]=date('Y-m-d H:i:s', time());
				$this->notificacion_model->update_entry($toUpdate);
			}
			
			$this->load->view('templates/header', $data);
			$this->load->view('templates/message', $data);
			$this->load->view('templates/footer');
			
		}
		
		public function sendAll($app=false){
			if($app){
				$this->require_min_level(1);
			}
			$result=$this->notificacion_model->sendAll();
			$data["sidebar"]="sidebar-n";
			if($result==""){
				$result= "No hay ningún envío pendiente en vigencia.";
			}
			$data["message"]=$result;
				if($app){
				$this->load->view('templates/header', $data);
				}
				$this->load->view('templates/message', $data);
				if($app){
				$this->load->view('templates/footer');
				}
			
		}
		
		
		
}