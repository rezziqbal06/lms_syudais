<?php
class D_Kehadiran_Model extends SENE_Model
{
	var $tbl = 'd_kehadiran';
	var $tbl_as = 'dk';

	public function __construct()
	{
		parent::__construct();
		$this->db->from($this->tbl, $this->tbl_as);
	}

	public function trans_start()
	{
		$r = $this->db->autocommit(0);
		if ($r) return $this->db->begin();
		return false;
	}

	public function trans_commit()
	{
		return $this->db->commit();
	}

	public function trans_rollback()
	{
		return $this->db->rollback();
	}

	public function trans_end()
	{
		return $this->db->autocommit(1);
	}

	public function getLastId()
	{
		$this->db->select_as("COALESCE(MAX($this->tbl_as.id),0)+1", "last_id", 0);
		$this->db->from($this->tbl, $this->tbl_as);
		$d = $this->db->get_first('', 0);
		if (isset($d->last_id)) return $d->last_id;
		return 0;
	}

	public function update($user_id, $tgl, $du, $id_kegiatan, $utype_kegiatan)
	{
		if (!is_array($du)) return 0;
		$this->db->where("b_user_id", $user_id);
		$this->db->where("tgl", $tgl);
		if ($utype_kegiatan == "kegiatan") {
			$this->db->where("e_kegiatan_id", $id_kegiatan);
		} else {
			$this->db->where("e_kajian_id", $id_kegiatan);
		}
		return $this->db->update($this->tbl, $du, 0);
	}

	public function set($d)
	{
		return $this->db->insert($this->tbl, $d);
	}

	public function getById($id)
	{
		$this->db->select_as("$this->tbl_as.*, $this->tbl_as.id", "id", 0);
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->where("id", $id);
		return $this->db->get_first();
	}

	public function getByUser($user_id, $tgl, $id, $utype)
	{
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->where("b_user_id", $user_id);
		$this->db->where("tgl", $tgl);
		if ($utype == "kegiatan") {
			$this->db->where("e_kegiatan_id", $id);
		} else {
			$this->db->where("e_kajian_id", $id);
		}
		return $this->db->get_first("", 0);
	}

	public function getAllByDate($date)
	{
		$this->db->flushQuery();
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->where_as("DATE(" . $this->tbl_as . ".tgl)", 'DATE("' . $date . '")');
		return $this->db->get('', 0);
	}

	public function countHadir($date, $id, $utype)
	{
		$this->db->flushQuery();
		$this->db->select_as("COUNT(*)", 'total', 0);
		$this->db->from($this->tbl, $this->tbl_as);
		if ($utype == "kegiatan") {
			$this->db->where("e_kegiatan_id", $id);
		} else {
			$this->db->where("e_kajian_id", $id);
		}
		$this->db->where("sia", "hadir");
		$this->db->where_as("DATE(" . $this->tbl_as . ".tgl)", 'DATE("' . $date . '")');
		$d = $this->db->get_first('', 0);
		if (isset($d->total)) return $d->total;
		return 0;
	}

	public function countBerhalangan($date, $id, $utype)
	{
		$this->db->flushQuery();
		$this->db->select_as("COUNT(*)", 'total', 0);
		$this->db->from($this->tbl, $this->tbl_as);
		if ($utype == "kegiatan") {
			$this->db->where("e_kegiatan_id", $id);
		} else {
			$this->db->where("e_kajian_id", $id);
		}
		$this->db->where_as("sia", $this->db->esc("hadir"), "AND", "!=");
		$this->db->where_as("DATE(" . $this->tbl_as . ".tgl)", 'DATE("' . $date . '")');
		$d = $this->db->get_first('', 0);
		if (isset($d->total)) return $d->total;
		return 0;
	}

	public function getByMapel($user_id, $pengabsen_id, $tgl)
	{
		$this->db->select_as("$this->tbl_as.*, $this->tbl_as.id", "id", 0);
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->where("b_user_id", $user_id);
		$this->db->where("b_user_pengabsen_id", $pengabsen_id);
		$this->db->where("tgl", $tgl);
		return $this->db->get_first();
	}

	public function getChart($user_id, $utype = 'hadir')
	{
		$this->db->select_as("$this->tbl_as.tgl", 'bulan', 0);
		$this->db->select_as("COUNT($this->tbl_as.b_user_id)", 'total', 0);
		$this->db->from($this->tbl, $this->tbl_as);
		//$this->db->where_as("YEAR($this->tbl_as.tgl)", 'YEAR(NOW())');
		if ($utype == 'hadir') {
			$this->db->where("$this->tbl_as.sia", "hadir");
		} else {
			$this->db->where_as("$this->tbl_as.sia", $this->db->esc("hadir"), "AND", "<>", 0);
		}
		$this->db->group_by("CONCAT(YEAR($this->tbl_as.tgl),'-',MONTH($this->tbl_as.tgl))");
		$this->db->order_by("CONCAT(YEAR($this->tbl_as.tgl),'-',MONTH($this->tbl_as.tgl))", 'desc');
		$this->db->where("b_user_id", $user_id)->limit(12);
		return $this->db->get('', 0);
	}
	public function getResume($user_id)
	{
		$this->db->select_as("$this->tbl_as.sia", 'label', 0);
		$this->db->select_as("COUNT($this->tbl_as.b_user_id)", 'total', 0);
		$this->db->from($this->tbl, $this->tbl_as);
		$this->db->where("b_user_id", $user_id);
		$this->db->where_as("MONTH($this->tbl_as.tgl)", 'MONTH(NOW())');
		$this->db->group_by("$this->tbl_as.sia");
		return $this->db->get('', 0);
	}
}
