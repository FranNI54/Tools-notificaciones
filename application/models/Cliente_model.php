<?php
class Cliente_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
			$this->load->model('notificacion_model');
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('CAP_CUSTOMERS');
					return $query->result_array();
			}
			$this->db->where('CUST_NO', $id);

			$query = $this->db->get('CAP_CUSTOMERS');
			return $query->row_array();
		}
		
		public function filter($filter){


			if(count($filter->tipo)>0){
				$tipos= array();
				foreach($filter->tipo as $tipo){
					array_push($tipos,strtolower($tipo));
				}
				$this->db->where_in("CUST_TYPE_DESCR", $tipos);
			}
			if(count($filter->sucursal)>0){
				
				$this->db->where_in("STORE_NO", $filter->sucursal);
			}
			if(count($filter->columna)>0){
				
				$this->db->select($filter->columna);
			}

			
			$this->db->select("date_format(CAP_SUBSCRIBERS.TS, '%d/%m/%Y %k:%i') TS");
			
			$this->db->join('CAP_CUSTOMERS', "CAP_CUSTOMERS ON CAP_SUBSCRIBERS.DEVICE_ID = CAP_CUSTOMERS.DEVICEID", 'inner');
			$this->db->where('CAP_SUBSCRIBERS.TS >',  $filter->fecha);

			$query = $this->db->get('CAP_SUBSCRIBERS');
			return $query->result_array();

		}
		
		public function byPassport($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('CAP_CUSTOMERS');
					return $query->result_array();
			}
			$this->db->where('PASSPORT_NO', $id);
			
			$query = $this->db->get('CAP_CUSTOMERS');
			return $query->row_array();
		}
		
		public function devices($id )
		{
			
			$this->db->where('CUST_NO', $id);
			
			$query = $this->db->get('CAP_CUSTOMERS');
			return $query->result_array();
		}
		
		
		public function byDevice($id )
		{
			
			$query = $this->db->get_where('CAP_CUSTOMERS', array('DEVICEID' => $id));
			return $query->row_array();
		}
	
		
		public function update_entry($nData)
        {
                
				foreach($nData as $key=>$value){
					$this->db->set($key, $value);
				}
				$this->db->where('CUST_NO', $nData['CUST_NO']);
				
                $toReturn= $this->db->update('CAP_CUSTOMERS');;
				if($toReturn){
					$this->CUST_NO= $nData['CUST_NO'];
				}
				
				return $toReturn;
        }
		
		public function delete($id){
			
			$this->load->model('relGrupo_model');
			$this->relGrupo_model->deleteByCliente($id);
			
			$this->db->where('CUST_NO', $id);
			$this->db->delete("CAP_CUSTOMERS");
		}
		
		public function getHash($id){
			$devices=$this->devices($id);
			$this->load->model('suscripcion_model');
			$suscripciones= array();
			foreach($devices as $device){
				$suscripcion= $this->suscripcion_model->all($device["DEVICEID"]);
				$suscripcion["DEVICE_ID"]= $device["DEVICEID"];
				array_push($suscripciones,$suscripcion);
			}
			return $suscripciones;
		}
		
		
		
}