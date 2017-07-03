<?php
class Notificacion_model extends CI_Model {

        public function __construct()
        {
            $this->load->database();
			##test
			define( 'API_ACCESS_KEY', 'AIzaSyAwhRVO9O-Ck5_Ks3VEg2OLVbowVD7j-Aw' );	
			define( 'PROJECT_ID', '609592838656' );	
			
			##makro
			//define( 'API_ACCESS_KEY', 'AIzaSyBz0_ZMswQ__yTMWcn2wYy86uvetHPGWGY' );		
			//define( 'PROJECT_ID', '728133731319' );	
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('notificacion');
					return $query->result_array();
			}
			$query = $this->db->get_where('notificacion', array('id' => $id));
			return $query->row_array();
		}
		
		public function allByGrupo($id)
		{
			$this->db->where('destinatario' ,$id);
			$this->db->where('grupo' ,"1");
			$query = $this->db->get('notificacion');
			return $query->result_array();
		}
		public function allByCliente($id)
		{
			$this->db->where('destinatario' ,$id);
			$this->db->where('grupo' ,"2");
			$query = $this->db->get('notificacion');
			return $query->result_array();
		}
		
		public function pendientes()
		{
			date_default_timezone_set('America/Argentina/Buenos_Aires');
			$this->db->where('fecha <=',  date('Y-m-d H:i:s', time()));
			$this->db->where('response =',  null);
			$query = $this->db->get('notificacion');
			return $query->result_array();
			
		}
				
		public function insert_entry($model)
        {
				$this->db->set($model);
				
                $toReturn= $this->db->insert('notificacion');
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function update_entry($nData)
        {
                
				foreach($nData as $key=>$value){
					$this->db->set($key, $value);
				}
				$this->db->where('id', $nData['id']);
				
                $toReturn= $this->db->update('notificacion');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			
			$this->db->where('id', $id);
			$this->db->delete("notificacion");
		}
		
		public function send($id){
			$this->load->model('relNotificacion_model');
			$query = $this->db->get_where('notificacion', array('id' => $id));
			$notificacion= $query->row_array();
			if($notificacion["grupo"]==1){
				$this->load->model('grupo_model');
				$modelDestino=$this->grupo_model->all($notificacion["destinatario"]);
				$destino= "/topics/makro-".$modelDestino["keyname"];
			}else{
				$this->load->model('cliente_model');
				$modelDestino= $this->cliente_model->all($notificacion["destinatario"]);
				$suscripciones= $this->cliente_model->getHash($modelDestino["CUST_NO"]);
				$destinos=array();
				foreach($suscripciones as $suscripcion){
					array_push($destinos, $suscripcion["TOKEN_ID"]);
				}
				if(count($destinos)==0){
					return;
				}
				if(count($destinos)>1){
					$destino= $this->userHash($modelDestino["CUST_NO"],$destinos);
				}else{
					$destino= $destinos[0];
				}
			}
			#API access key from Google API's Console
			
			//RelNotificacion_model
			
			#prep the bundle
			
			$msg = array
				  (
				
				'title'	=> $notificacion["titulo"],
				"body"=> $notificacion["texto"],
				"sound" => "default"
				  );
			$fields = array
					(
						'to'		=> $destino,
						'notification'	=> $msg,
						"data" => array("url"=>$notificacion["link"])
					);
			
			
			$headers = array
					(
						'Authorization: key=' . API_ACCESS_KEY,
						'Content-Type: application/json'
					);
			#Send Reponse To FireBase Server	
				$ch = curl_init();
				curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
				curl_setopt( $ch,CURLOPT_POST, true );
				curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
				curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
				curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
				curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
				$result = curl_exec($ch );
				curl_close( $ch );
			#Echo Result Of FireBase Server
			
			if($notificacion["grupo"]==1){
				$this->load->model('relGrupo_model');
				$relGrupo= $this->relGrupo_model->getModelsByGrupo($modelDestino["id"]);
				foreach($relGrupo as $rel){
					$this->relNotificacion_model->insert_entry(array("cliente"=>$rel["CUST_NO"],"device"=>$rel["DEVICEID"],"notificacion"=>$id));
				}
			}else{
				$this->relNotificacion_model->insert_entry(array("cliente"=>$modelDestino["CUST_NO"],"device"=>$modelDestino["DEVICEID"],"notificacion"=>$id));
				
			}
			
			
			return $result;
		}
		
		public function userHash($id,$hashs){
			$this->load->model('clienteHash_model');
			$hash= $this->clienteHash_model->all($id,$hashs);
			return $hash;
		}
		
		public function sendAll(){
			$notificaciones= $this->pendientes();
			$response="";
			
			foreach($notificaciones as $notificacion){
					$auxR=$this->send($notificacion["id"]);
					if($auxR==""){
						$auxR='{"failure": 1,"details":"Error de envío. Destinatarios inexistentes. Vuelva a crear el envío nuevamente"}';
					}
					$notificacion["response"]=$auxR;
					date_default_timezone_set('America/Argentina/Buenos_Aires');
					$notificacion["envio"]=date('Y-m-d H:i:s', time());
					$this->update_entry($notificacion);
					
					$json= json_decode($auxR);
					$response.="<h4>Notificación id".$notificacion["id"].": ".$notificacion['titulo']."</h4>";
					$response.="<h5>";
					if(isset($json->success)&&$json->success>=1){
						$response.= "Recibido con éxito.";
					}
					if(isset($json->failure)&&$json->failure>=1){
						$response.= "Error al enviar";
					}
					if(isset($json->message_id)){
						$response.= 'Enviado. ID de envío: '. str_replace('}',"", str_replace('{"message_id":',"",$auxR));
					}
					$response.="</h5>";
					
					//$response.=$auxR;
					$response.="<br>";
					
					
			}
			return $response;
		}
		
		
}