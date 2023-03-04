<?php
//front
class B_User_Module_Model extends \Model\B_User_Module_Concern
{
	var $tbl 	= 'b_user_module';
	var $tbl_as = 'bumod';

	public function __construct()
	{
		parent::__construct();
		$this->db->from($this->tbl, $this->tbl_as);
	}
}
