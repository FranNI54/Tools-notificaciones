<?php
class Store_model extends CI_Model {

	public function __construct()
        {
                $this->load->database();
			
        }
	
	public function all($id = FALSE)
	{
		if ($id === FALSE)
		{
				$query = $this->db->get('CAP_STORES');
				return $query->result_array();
		}
		$this->db->where('STORE_NO', $id);
		$this->db->order_by('NAME', "ASC");
		
		$query = $this->db->get('CAP_STORES');
		return $query->row_array();
	}
		
	
}

?>