<?php
class Suscripcion_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('CAP_SUBSCRIBERS');
					return $query->result_array();
			}
			$this->db->where('DEVICE_ID', $id);
			$this->db->where('ACTIVE', 1);
			$query = $this->db->get('CAP_SUBSCRIBERS');
			return $query->row_array();
		}
		
		
		public function update_entry($nData)
        {
                
				foreach($nData as $key=>$value){
					$this->db->set($key, $value);
				}
				$this->db->where('DEVICE_ID', $nData['DEVICE_ID']);
				
                $toReturn= $this->db->update('CAP_SUBSCRIBERS');;
				if($toReturn){
					$this->id= $nData['DEVICE_ID'];
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			
						
			$this->db->where('DEVICE_ID', $id);
			$this->db->delete("CAP_SUBSCRIBERS");
		}
		
		public function updateHash($id){
			$model=$this->all($id);
			//llamada service
			$model["hash"]=	"cu6ePENV_3Q:APA91bFUvKj0z8fmaxDZMGZhF0ZHuRM9IfKU_v5xlOgNzBIONj3vAKKuS_eHEUPUVklQDpc3t6X8ajGKZ_qZmXYMcjhhdbwKS3Y-fVgxQQCoUDkQMFbwf1PNmK32xlW9OI27Aqg6t3kn";
			$this->db->set("hash", "cu6ePENV_3Q:APA91bFUvKj0z8fmaxDZMGZhF0ZHuRM9IfKU_v5xlOgNzBIONj3vAKKuS_eHEUPUVklQDpc3t6X8ajGKZ_qZmXYMcjhhdbwKS3Y-fVgxQQCoUDkQMFbwf1PNmK32xlW9OI27Aqg6t3kn");
			$this->db->where('id', $id);
			
			$toReturn= $this->db->update('CAP_SUBSCRIBERS');;
			if($toReturn){
				$this->id= $this->db->insert_id();
			}
			
			return $model;
		}
		
		
		
}