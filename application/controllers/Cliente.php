<?php
class Cliente extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				$this->require_min_level(1);
                $this->load->model('cliente_model');
				
                $this->load->helper('url_helper');
        }
		
		public function index(){
			redirect('/cliente/admin');
		}

      
		/*
		public function create($id= FALSE)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
			$data["title"]="Crear Cliente";
			$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('numero', 'Numero de cliente', 'required');			
			
			if ($this->form_validation->run() == FALSE)
			{
				$data["cliente"]=$_POST;
				$this->load->view('templates/header', $data);
				$this->load->view('cliente/create', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				unset($_POST["token"]);
				if($this->cliente_model->insert_entry($_POST)){
					 redirect('/cliente/view/'.$this->cliente_model->id, 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('cliente/create', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}*/
		
		public function update($id)
		{
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
				$data["title"]="Editar Cliente";
				$data["cliente"]=$this->cliente_model->all($id);
				$data["sidebar"]="sidebar-n";
			$this->form_validation->set_rules('DEVICEID', 'Numero de cliente', 'required');	
			
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('cliente/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["CUST_NO"]= $id;
				unset($_POST["token"]);
				if($this->cliente_model->update_entry($_POST)){
					redirect('/cliente/view/'.$data["cliente"]["CUST_NO"], 'refresh');
				}else{
					$this->load->view('templates/header', $data);
					$this->load->view('marquesina/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		}

		public function view($slug = NULL)
		{
			
			$data['cliente'] = $this->cliente_model->all($slug);
			

			if (empty($data['cliente']))
			{
					show_404();
			}
			$this->load->model('relGrupo_model');
			$data["devices"]= $this->cliente_model->devices($slug);
			
			$data["grupos"]=$this->relGrupo_model->getModelsByCliente($slug);
			$data["suscripciones"]= $this->cliente_model->getHash($data["cliente"]["CUST_NO"]);
			$data["sidebar"]="sidebar-n";
			$data['title'] = "Cliente";

			$this->load->view('templates/header', $data);
			$this->load->view('cliente/view', $data);
			$this->load->view('grupo/admin', $data);
			$this->load->view('templates/footer');
		}
		
		public function delete($id){
			echo $this->cliente_model->delete($id);
		}
		
		public function admin(){
			$data["clientes"]= $this->cliente_model->all();
						
			
			$data["title"]= "Administrar Clientes";
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('cliente/admin', $data);
			$this->load->view('templates/footer');
		}
		
		public function cargar(){
			$data["title"]="Cargar clientes";
			$data["sidebar"]="sidebar-n";
			$this->load->model('grupo_model');
			$data["grupos"]= $this->grupo_model->all();
			
			$this->load->view('templates/header', $data);
			$this->load->view('cliente/cargar', $data);
			$this->load->view('templates/footer');
		}
		
		public function notificaciones($id){
			$this->load->model('notificacion_model');
			$data['cliente'] = $this->cliente_model->all($id);
			$data["notificaciones"]= $this->notificacion_model->allByCliente($id);
			
			$data["title"]= "Notificaciones a ".$data["cliente"]["CUST_NAME"];
			$data["sidebar"]="sidebar-n";
			$this->load->view('templates/header', $data);
			$this->load->view('cliente/notificaciones', $data);
			$this->load->view('templates/footer');
		}
		
		public function parse(){
			$this->load->model('suscripcion_model');
			$tmpName = $_FILES['file']['tmp_name'];
			$csvAsArray = array_map('str_getcsv', file($tmpName));
			//var_dump($csvAsArray);
			$clientes= array();
			$error= array();
			$success= array();
			/*$clientes[0]=array();
			$aux=0;
			foreach( $csvAsArray as $key=>$value){
				array_push($clientes[0],$aux++);
			}*/
			foreach( $csvAsArray as $key=>$value){
				$auxArray= array();
				foreach($value as $key2=>$value2){
					 array_push($auxArray,$value2);
					 break;
				}
				$auxCliente= $this->cliente_model->byPassport($auxArray[0]);
				if(!$auxCliente){
					$auxCliente= $this->cliente_model->all($auxArray[0]);
				}
				
				
				if($auxCliente){
					
					 array_push($auxArray,$auxCliente["CUST_NAME"]);
					 //array_push($auxArray,$auxCliente["STATUS_NO"]);
					 $suscripcion= $this->suscripcion_model->all($auxCliente["DEVICEID"]);
					 if($suscripcion){
						 array_push($success,$auxCliente["CUST_NO"]);
						array_push($auxArray,"Si");
					 }else{
						 array_push($error,$auxArray[0]);
						 array_push($auxArray,"<span>No</span>");
					 }
				}else{
					array_push($error,$auxArray[0]);
					array_push($auxArray,"Inexistente");
					//array_push($auxArray,"");
					array_push($auxArray,"");
				}
				array_push($clientes,$auxArray);
			}
			
			
			//echo json_encode($csvAsArray);
			//echo $this->build_table($csvAsArray);
			//echo json_encode(array("data"=>$csvAsArray,"table"=>$this->build_table($csvAsArray)));
			echo json_encode(array("data"=>$clientes,"table"=>$this->build_table($clientes),"error"=>$error,"success"=>$success));
			exit();
		}
		
		function build_table($array){
			// start table
			$html = '<table>';
			// header row
			$html .= '<thead><tr>';
			foreach($array[0] as $key=>$value){
					$key=$this->limpiarKey($key);
					$html .= '<th>' .$key . '</th>';
				}
			$html .= '</tr></thead>';

			// data rows
			$html.="<tbody>";
			
			foreach( $array as $key=>$value){
				if(in_array("<span>No</span>",$value)){
					$html .= '<tr class="marquesina-pendiente marquesina">';
				}else if(in_array("Inexistente",$value)){
					$html .= '<tr class="marquesina-vencida marquesina">';
				}else{
					$html .= '<tr class="marquesina-activa marquesina">';
				}
				
				foreach($value as $key2=>$value2){
					$html .= '<td class="row-'.$key2.'">' . $value2 . '</td>';					
				}
				$html .= '</tr>';
			}
			$html.="</tbody>";

			// finish table and return it

			$html .= '</table>';
			return $html;
		}
		
		public function limpiarKey($key){
			switch ($key) {
				case "CUST_NAME":
					return "Nombre";
					break;
				case "PASSPORT_NO":
					return "Pasaporte";
					break;
				case "PHONE":
					return "Teléfono";
					break;
				case "CUST_TYPE_DESCR":
					return "Tipo";
					break;
				case "TS":
					return "Fecha";
					break;
				case "STORE_NO":
					return "Sucursal";
					break;
			}
			return $key;
		}
		
		public function export($id=false){
			$data["title"]="Exportar clientes";
			$data["sidebar"]="sidebar-e";
			$this->load->model('store_model');
			$data["stores"]=$this->store_model->all();
			
			$this->load->view('templates/header', $data);
			$this->load->view('cliente/export', $data);
			$this->load->view('templates/footer');
		}
		
		public function filter(){
			$json= json_decode($_POST["json"]);
			
			$json=$this->cliente_model->filter($json);
			//var_dump($json);
			//exit();
			if(count($json)==0){
				echo "";
			}else{
			echo json_encode(array("data"=> json_decode(json_encode($json)),"table"=>$this->build_table($json)));
			}
			exit();
		}
		
		public function exportTable(){
		
			date_default_timezone_set('America/Argentina/Buenos_Aires');
			 
			$this->load->helper('download');
			

			$list = json_decode($_POST["table"]);
			if(isset($_POST["name"])){
				$name = $_POST["name"].'-'.date("d-m-Y H-i").'.csv';
				$fp = fopen(FCPATH.'exports/'.$name, 'w');
				
			}else{
				$name = 'errores-import-'.date("d-m-Y H-i").'.csv';
				$fp = fopen(FCPATH.'errors/'.$name, 'w');
			}
			
			if(isset($_POST["cabecera"])){
				
				fputcsv($fp, json_decode($_POST["cabecera"]));
				
			}
			foreach ($list as $fields) {
				if(!is_array($fields)){
					if(is_object($fields)){
						$auxArray= array();
						foreach($fields as $key=>$value){
							array_push($auxArray,$value);
						}
						$fields=$auxArray;
					}else{
					$fields=array($fields);
					}

				}
				fputcsv($fp, $fields);
				}

			$data = file_get_contents('php://output'); 
			
			
			
			if(isset($_POST["name"])){
				$name = $_POST["name"].'-'.date("d-m-Y H-i").'.csv';
					
			}else{
				$name = 'errores-import-'.date("d-m-Y H-i").'.csv';
			}
			// Build the headers to push out the file properly.
			
			if(isset($_POST["name"])){
				fclose($fp);
				header('Content-Type: application/csv');
				header('Content-Disposition: attachment; filename='.basename($name));
				header('Pragma: no-cache');
				readfile(FCPATH.'exports/'.$name);
			}else{
				fclose($fp);
				header('Content-Type: application/csv');
				header('Content-Disposition: attachment; filename='.basename($name));
				header('Pragma: no-cache');
				readfile(FCPATH.'errors/'.$name);
			}
			
			exit();
			
			force_download($name, $data);
			fclose($fp);
		}
		
		public function historial(){
			$historial=scandir(FCPATH.'exports/');
			
			$data["title"]="Historial reportes";
			$data["sidebar"]="sidebar-e";
			
			$data["historial"]=$historial;
			
			$this->load->view('templates/header', $data);
			$this->load->view('cliente/historial', $data);
			$this->load->view('templates/footer');
			
		}
		
		public function upload(){
			if(isset($_POST["json"])){
				$clientes=json_decode($_POST["json"]);
				
				//$index=0;
				//$ids= array();
				/*foreach($clientes as $cliente){
					$index++;
					$auxCliente;
					for($a=0;$a<count($cliente);$a++){
						$auxCliente[$orden[$a]]= $cliente[$a];
						if($orden[$a]=="tipo"){
							if(strtolower($cliente[$a])=="tienda"){
								$auxCliente[$orden[$a]]=1;
							}else{
								$auxCliente[$orden[$a]]=0;
							}
						}
					}
					if(!$this->cliente_model->insert_entry($auxCliente)){
						echo "Error al ingresar fila ".$index." del csv.<br>";
					}else{
						array_push($ids,$this->cliente_model->id);
					}
				}*/
				if(isset($_POST["grupo"])&&$_POST["grupo"]>0){
					
					$this->load->model('relGrupo_model');
					$hashs= array();
					foreach($clientes as $cliente){
						
						$auxCliente= $this->cliente_model->all($cliente);
						//$auxCliente['hash']=$this->cliente_model->getHash($auxCliente["CUST_NO"]);
						$suscripciones=$this->cliente_model->getHash($auxCliente["CUST_NO"]);
						foreach($suscripciones as $suscripcion){
							if(isset($suscripcion["TOKEN_ID"])){
							array_push($hashs,$suscripcion["TOKEN_ID"]);
							}
						}
						
						$this->relGrupo_model->insert_entry(['grupo'=>$_POST["grupo"],"cliente"=>$auxCliente["CUST_NO"]]);
					}
					$this->load->model('grupo_model');
					$this->grupo_model->addHashs($_POST["grupo"],$hashs);
				}else{
					echo "fail";
				}
			}
		}

		
}