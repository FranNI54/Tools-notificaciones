<?php
class Grupo_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
			$this->load->model('notificacion_model');
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('grupo');
					return $query->result_array();
			}
			$query = $this->db->get_where('grupo', array('id' => $id));
			return $query->row_array();
		}
	
				
		public function insert_entry($model)
        {
			$model["keyname"]= $this->hyphenize($model["nombre"]);
			
			$this->db->set($model);
			
			$toReturn= $this->db->insert('grupo');
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
				
                $toReturn= $this->db->update('grupo');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			$this->load->model('relGrupo_model');
			$this->relGrupo_model->deleteByGrupo($id);
			
			
			$this->db->where('id', $id);
			$this->db->delete("grupo");
		}
		
		public function hyphenize($string) {
			$dict = array(
				"I'm"      => "I am",
				"thier"    => "their",
			);
			return strtolower(
				preg_replace(
				  array( '#[\\s-]+#', '#[^A-Za-z0-9\. -]+#' ),
				  array( '-', '' ),
		
				  $this->cleanString(
					  str_replace(
						  array_keys($dict),
						  array_values($dict),
						  urldecode($string)
					  )
				  )
				)
			);
		}

		public function cleanString($text) {
			$utf8 = array(
				'/[áàâãªä]/u'   =>   'a',
				'/[ÁÀÂÃÄ]/u'    =>   'A',
				'/[ÍÌÎÏ]/u'     =>   'I',
				'/[íìîï]/u'     =>   'i',
				'/[éèêë]/u'     =>   'e',
				'/[ÉÈÊË]/u'     =>   'E',
				'/[óòôõºö]/u'   =>   'o',
				'/[ÓÒÔÕÖ]/u'    =>   'O',
				'/[úùûü]/u'     =>   'u',
				'/[ÚÙÛÜ]/u'     =>   'U',
				'/ç/'           =>   'c',
				'/Ç/'           =>   'C',
				'/ñ/'           =>   'n',
				'/Ñ/'           =>   'N',
				'/–/'           =>   '-', 
				'/[’‘‹›‚]/u'    =>   ' ', 
				'/[“”«»„]/u'    =>   ' ', 
				'/ /'           =>   ' ', 
			);
			return preg_replace(array_keys($utf8), array_values($utf8), $text);
		}
		
		public function addHashs($id,$hashs){
			
			$model= $this->all($id);
			$fields = array
			(
				"to"=> "/topics/makro-".$model["keyname"],
				"registration_tokens"=> $hashs
				
			);
			$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json',
				"project_id: ". PROJECT_ID
			);
			
			$ch = curl_init();
			curl_setopt( $ch,CURLOPT_URL, 'https://iid.googleapis.com/iid/v1:batchAdd' );
			
			curl_setopt( $ch,CURLOPT_POST, true );
			curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
			curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
			curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
			curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
			$result = curl_exec($ch );
			curl_close( $ch );
			return $result;
		}
		
}