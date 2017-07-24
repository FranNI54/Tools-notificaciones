<?php
class Pages extends MY_Controller {
		
		public function __construct()
        {
                parent::__construct();
				$this->require_min_level(1);
                $this->load->helper('url_helper');
        }
		
		public function index($page="home"){
			
		}
		
		 public function view($page="home"){
			redirect('/marquesina/admin' );
		 }
		 

}