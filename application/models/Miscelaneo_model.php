<?php
class Miscelaneo_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('miscelaneo');
					return $query->result_array();
			}
			$query = $this->db->get_where('miscelaneo', array('id' => $id));
			return $query->row_array();
		}
		
		
		 public function insert_entry($model)
        {
                $this->db->set($model);
                $this->activa=1;
				
				$toReturn= $this->db->insert('miscelaneo', $this);
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
                
				
				$toReturn= $this->db->update('miscelaneo');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			
			$this->db->where('id', $id);
			$this->db->delete("miscelaneo");
		}
}