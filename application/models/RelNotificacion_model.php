<?php
class RelNotificacion_model extends CI_Model {

        public function __construct()
        {
            $this->load->database();
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('rel_notificacion');
					return $query->result_array();
			}
			$query = $this->db->get_where('rel_notificacion', array('id' => $id));
			return $query->row_array();
		}
		
		public function modelsByNotificacion($id){
			$this->db->where('notificacion' ,$id);
			$query = $this->db->get('rel_notificacion');
			$models= array();
			$this->load->model('cliente_model');
			foreach($query->result_array() as $rel){
				$cliente=	$this->cliente_model->all($rel["cliente"]);
				if(isset($cliente)){
					$cliente["rel"]= $rel["id"];
					array_push($models,$cliente);
				}
			}
			return $models;
		}
	
				
		public function insert_entry($model)
        {
			
				$this->db->set($model);
				
                $toReturn= $this->db->insert('rel_notificacion');
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
				
                $toReturn= $this->db->update('rel_notificacion');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		
}