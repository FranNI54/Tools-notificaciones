<?php
class ClienteHash_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
				$this->load->model('notificacion_model');
        }
		
		public function all($id,$hashs)
		{
			
			$this->db->where('nombre', $id);
			$query = $this->db->get('cliente');
			$model=$query->row_array();
			if(!isset($model)||$model==null){
				return $this->createHash($id,$hashs);
			}else{
				
				return $this->updateHash($id,$model["hash"],$hashs);
			}
		}
		
		public function createHash($id,$hashs){
			$fields = array
				(
					
					   "operation"=> "create",
					   "notification_key_name"=> "makro-group-".$id,
					   "registration_ids"=> $hashs
					
				);
				$headers = array
				(
					'Authorization: key=' . API_ACCESS_KEY,
					'Content-Type: application/json',
					"project_id: ". PROJECT_ID
				);
				$ch = curl_init();
				curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/notification' );
				curl_setopt( $ch,CURLOPT_POST, true );
				curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
				curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
				curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
				curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
				$result = curl_exec($ch );
				curl_close( $ch );
				$result= json_decode($result);
				if(isset($result->notification_key)){
					$auxModel= array("nombre"=>$id,"hash"=>$result->notification_key);
					$this->insert_entry($auxModel);
					return $result->notification_key;
				}else{
					
					exit("Error no contemplado, key de notificación ya existente");
				}
		}
		
		public function updateHash($id,$hash,$hashs){
			$fields = array
				(
					
					   "operation"=> "add",
				   "notification_key_name"=> "makro-group-".$id,
				   "notification_key"=> $hash,
				   "registration_ids"=> $hashs
					
				);
				$headers = array
				(
					'Authorization: key=' . API_ACCESS_KEY,
					'Content-Type: application/json',
					"project_id: ". PROJECT_ID
				);
				$ch = curl_init();
				curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/notification' );
				curl_setopt( $ch,CURLOPT_POST, true );
				curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
				curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
				curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
				curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
				$result = curl_exec($ch );
				curl_close( $ch );
				$result= json_decode($result);
				if(isset($result->notification_key)){
					return $result->notification_key;
				}else{
					exit("Error no contemplado, key de notificación ya existente");
				}
		}
		
		
		public function insert_entry($nData)
        {
                
				
			$this->db->set($nData);
			
			$toReturn= $this->db->insert('cliente');
			if($toReturn){
				$this->id= $this->db->insert_id();
			}
			
			return $toReturn;
        }
		
		public function delete($id){
			
						
			$this->db->where('DEVICE_ID', $id);
			$this->db->delete("cap_subscribers");
		}
		
		
}