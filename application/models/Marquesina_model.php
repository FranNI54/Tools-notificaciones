<?php
class Marquesina_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
				
        }
		
		public function all($id = FALSE)
		{
			if ($id === FALSE)
			{
					$query = $this->db->get('marquesina');
					return $query->result_array();
			}
			$query = $this->db->get_where('marquesina', array('id' => $id));
			return $query->row_array();
		}
		
		public function allByCategoria($id = FALSE)
		{
			if ($id === FALSE)
			{
					
					return null;
			}
			$query = $this->db->get_where('marquesina', array('categoria' => $id));
			return $query->result_array();
		}
		
		public function getNearer($id = FALSE)
		{
			if ($id === FALSE)
			{
					
					return null;
			}
			$this->db->where('categoria' , $id);
			date_default_timezone_set('America/Argentina/Buenos_Aires');
			$this->db->where('inicio <=',  date('Y-m-d H:i:s', time()));
			$this->db->where('estado =', 0);
			$this->db->order_by("inicio","DESC");
			$query= $this->db->get("marquesina",1);
			return $query->row_array();
		}
		
		public function insert_entry($model)
        {
				
				if($this->exist($model)){
					return "duplicado";
				}
				
				$this->db->set($model);
                $toReturn= $this->db->insert('marquesina');
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function exist($model){
			$this->db->where('categoria' , $model["categoria"]);
			date_default_timezone_set('America/Argentina/Buenos_Aires');
			$this->db->where('inicio',  $model["inicio"]);
			return $this->db->count_all_results("marquesina");
			
		}
		
		public function update_entry($nData)
        {
                
				foreach($nData as $key=>$value){
					$this->db->set($key, $value);
				}
				$this->db->where('id', $nData['id']);
				
                $toReturn= $this->db->update('marquesina');;
				if($toReturn){
					$this->id= $this->db->insert_id();
				}
				
				return $toReturn;
        }
		
		public function setJson($id){
			$this->load->model('imagen_model');
			$this->load->model('miscelaneo_model');
			$url= $this->miscelaneo_model->all(1)["data"];
			if($url==""){
				$url=base_url();
			}
			$imagenes= $this->imagen_model->allMarquesina($id);
			$arrayImagen= array();
			foreach($imagenes as $imagen){
				array_push($arrayImagen,$url.'uploads/'.$imagen['marquesina'].'/'.$imagen['id'].$imagen['formato']);
			}
			$this->db->set("json", json_encode($arrayImagen));
			$this->db->where('id', $id);
			 $toReturn= $this->db->update('marquesina');;
		}
		
		public function delete($id){
			$this->load->model('imagen_model');
			$this->imagen_model->deleteByMarquesina($id);
			$dir=FCPATH.'uploads/'.$id."/";
			$files = array_diff(scandir($dir), array('.','..')); 
			foreach ($files as $file) { 
			  (is_dir("$dir/$file")) ? delTree("$dir/$file") : unlink("$dir/$file"); 
			} 
			rmdir($dir);
			$this->db->where('id', $id);
			$this->db->delete("marquesina");
		}
		
		public function deleteByCategoria($id){
			$marquesinas= $this->allByCategoria($id);
			foreach($marquesinas as $marquesina){
				$this->delete($marquesina["id"]);
			}
		}
		
}