<?php
//front
class B_User_Module_Model extends \Model\B_User_Module_Concern
{
	var $tbl 	= 'b_user_module';
	var $tbl_as = 'bumod';
	var $tbl2 	= 'a_program';
	var $tbl2_as = 'ap';
	var $tbl3 	= 'a_jabatan';
	var $tbl3_as = 'aj';

	public function __construct()
	{
		parent::__construct();
		$this->db->from($this->tbl, $this->tbl_as);
	}

	public function getPermission($a_program_id = "", $type = "create", $a_jabatan_id = "", $b_user_id = "")
	{
		$this->db->where("a_program_id", $a_program_id);
		$this->db->where("type", $type);
		$this->db->where("a_jabatan_id", $a_jabatan_id, "OR", "=", 1, 0);
		$this->db->where("b_user_id", $b_user_id, "OR", "=", 0, 1);
		$this->db->group_by("type");
		$d = $this->db->get_first($this->tbl);
		if (isset($d->id)) {
			return 1;
		}
		return 0;
	}


	public function getAllPermission($a_program_id = "", $a_jabatan_id = "", $b_user_id = "")
	{
		$this->db->select("type");
		$this->db->where("a_program_id", $a_program_id);
		$this->db->where("a_jabatan_id", $a_jabatan_id, "OR", "=", 1, 0);
		$this->db->where("b_user_id", $b_user_id, "OR", "=", 0, 1);
		$this->db->group_by("type");
		$d = $this->db->get('object', 0);
		$res = [];
		if (isset($d[0])) {
			foreach ($d as $v) {
				$res[$v->type] = $v->type;
			}
		}
		return $res;
	}


	public function getMenu($type = "create", $a_jabatan_id = "", $b_user_id = "")
	{
		$this->db->select_as("$this->tbl2_as.nama", 'nama', 0);
		$this->db->select_as("$this->tbl2_as.slug", 'slug', 0);
		$this->db->select_as("$this->tbl2_as.icon", 'icon', 0);
		$this->db->select_as("$this->tbl2_as.warna", 'warna', 0);
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->join($this->tbl2, $this->tbl2_as, "id", $this->tbl_as, "a_program_id", "left");
		$this->db->where("type", $type, "AND", "LIKE%");
		$this->db->where("a_jabatan_id", $a_jabatan_id, "OR", "=");
		$this->db->where("b_user_id", $b_user_id, "OR", "=");
		$this->db->group_by("a_program_id");
		$d = $this->db->get($this->tbl, 0);
		return $d;
	}
}
