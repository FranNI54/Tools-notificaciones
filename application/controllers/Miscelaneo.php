<?php
class Miscelaneo extends MY_Controller {

        public function __construct()
        {
                parent::__construct();
				
				$this->load->model('miscelaneo_model');
                $this->load->helper('url_helper');
        }

		public function index()
		{
		
        $data['marquesinas'] = $this->marquesina_model->all();
        $data['title'] = 'Marquesinas';

        $this->load->view('templates/header', $data);
        $this->load->view('categoria/index', $data);
        $this->load->view('templates/footer');
		} 
		
		
		
		public function json()
		{
			$this->require_min_level(9);
			$this->load->helper(array('form'));
			$this->load->library('form_validation');
			
			
			$data["title"]="Editar url JSON";
			$data["miscelaneo"]=$this->miscelaneo_model->all(1);
						
			$this->form_validation->set_rules('tag', 'Tag', 'required');
			
			if ($this->form_validation->run() == FALSE)
			{
				$this->load->view('templates/header', $data);
				$this->load->view('miscelaneo/update', $data);
				$this->load->view('templates/footer');
			}
			else
			{
				$_POST["id"]= 1;
				$_POST["tag"]= "JSON";
				unset($_POST["token"]);
				if($this->miscelaneo_model->update_entry($_POST)){
					$data["miscelaneo"]=$_POST;
					$this->load->view('templates/header', $data);
					$this->load->view('miscelaneo/update', $data);
					$this->load->view('templates/footer');
				}
				
			}
		
        
		}
		
		
}