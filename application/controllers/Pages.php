<?php
class Pages extends MY_Controller {
		
		public function __construct()
        {
                parent::__construct();
				$this->require_min_level(1);
                $this->load->helper('url_helper');
        }
		
		public function index($page="home"){
			echo "asd";
		}
		
		 public function view($page="home"){
			redirect('/marquesina/admin' );
		 }
		 
		/* function _remap($method_name = 'index'){

             if(!method_exists($this, $method_name)){
                $this->index($method_name);
             }
             else{
                $this->{$method_name}();
             }
         }*/


}