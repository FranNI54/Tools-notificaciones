<?php
class RelGrupo_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
			$this->load->model('notificacion_model');
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('relGrupo');
					return $query->result_array();
			}
			$query = $this->db->get_where('relGrupo', array('id' => $id));
			return $query->row_array();
		}
	
				
		public function insert_entry($model)
        {
				$this->db->where('grupo', $model['grupo']);
				$this->db->where('cliente', $model['cliente']);
				$query=$this->db->get('relGrupo');
				if($query->row_array()){
					return;
				}
			
				$this->db->set($model);
				
				
                $toReturn= $this->db->insert('relGrupo');
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
				
                $toReturn= $this->db->update('relGrupo');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			
			$model= $this->all($id);
			
			$this->load->model('cliente_model');
			$this->load->model('grupo_model');

			$cliente= $this->cliente_model->all($model["cliente"]);
			
			$grupo= $this->grupo_model->all($model["grupo"]);
			$suscripciones= $this->cliente_model->getHash($cliente["CUST_NO"]);
			$tokens= array();
			foreach($suscripciones as $suscripcion){
				if(isset($suscripcion["TOKEN_ID"])&&$suscripcion["TOKEN_ID"]!=""){
					array_push($tokens,$suscripcion["TOKEN_ID"]);
				}
			}
			$this->removeHashs($grupo["keyname"],$tokens);
			
			
			$this->db->where('id', $id);
			$this->db->delete("relGrupo");
		}
		
		public function removeHashs($keyname,$hashs){
			
			$fields = array
			(
				"to"=> "/topics/makro-".$keyname,
				"registration_tokens"=> $hashs
			);
			$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json',
				"project_id: ". PROJECT_ID
			);
			var_dump($fields);
			echo "<br>";
			var_dump($headers);
			$ch = curl_init();
			
			curl_setopt( $ch,CURLOPT_URL, 'https://iid.googleapis.com/iid/v1:batchRemove' );
			curl_setopt( $ch,CURLOPT_POST, true );
			curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
			curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
			curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
			curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
			$result = curl_exec($ch );
			curl_close( $ch );
			return $result;
		}
		
		public function deleteByGrupo($id){
			$this->load->model('grupo_model');
			$clientes= $this->getModelsByGrupo($id);;
			
			$grupo= $this->grupo_model->all($id);
			$hashs= array();
			foreach($clientes as $cliente){
				$suscripciones= $this->cliente_model->getHash($cliente["CUST_NO"]);
				foreach($suscripciones as $suscripcion){
					if(isset($suscripcion["TOKEN_ID"])&&$suscripcion["TOKEN_ID"]!=""){
					array_push($hashs,$suscripcion["TOKEN_ID"]);
					}
				}
			}
			$result= $this->removeHashs($grupo["keyname"],$hashs);
			$this->db->where('grupo' ,$id);
			$this->db->delete("relGrupo");
			return $result;
		}
		
		public function deleteByCliente($id){
			$this->db->where('cliente' ,$id);
			$query = $this->db->get('relGrupo');
			$rels=$query->result_array();
			foreach($rels as $rel){
				$this->delete($rel["id"]);
			}
		}
		
		public function getModelsByGrupo($id){
			$this->db->where('grupo' ,$id);
			$query = $this->db->get('relGrupo');
			$models= array();
			$this->load->model('cliente_model');
			foreach($query->result_array() as $rel){
				$cliente=	$this->cliente_model->all($rel["cliente"]);
				$cliente["rel"]= $rel["id"];
				array_push($models,$cliente);
			}
			return $models;
		}
		
		public function getModelsByCliente($id){
			$this->db->where('cliente' ,$id);
			$query = $this->db->get('relGrupo');
			$models= array();
			$this->load->model('grupo_model');
			foreach($query->result_array() as $rel){
				$grupo=	$this->grupo_model->all($rel["grupo"]);
				$grupo["rel"]= $rel["id"];
				array_push($models,$grupo);
			}
			return $models;
		}
		public function getIdsByGrupo($id){
			$this->db->where('grupo' ,$id);
			$this->db->select("cliente");
			$query = $this->db->get('relGrupo');
			$rels=$query->result_array();
			$ids= array();
			foreach($rels as $rel){
				array_push($ids,$rel["cliente"]);
			}
			return $ids;
		}
}