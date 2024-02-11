<?php

namespace Model\Admin;


register_namespace(__NAMESPACE__);
/**
 * Scoped `front` model for `b_user` table
 *
 * @version 5.4.1
 *
 * @package Model\Front
 * @since 1.0.0
 */
class D_Penilaian_Model extends \Model\D_Penilaian_Concern
{
  public $tbl2 = 'b_user';
  public $tbl2_as = 'bu';
  public function __construct()
  {
    parent::__construct();
    $this->db->from($this->tbl, $this->tbl_as);
    $this->point_of_view = 'admin';
  }

  private function filters($keyword = '', $is_active = '')
  {
    // if (strlen($b_user_id)) {
    //   $this->db->where_as("$this->tbl_as.b_user_id", $this->db->esc($b_user_id));
    // }
    if (strlen($is_active)) {
      $this->db->where_as("$this->tbl_as.is_active", $this->db->esc($is_active));
    }
    if (strlen($keyword) > 0) {
      $this->db->where_as("$this->tbl_as.nama", $keyword, "OR", "%like%", 1, 0);
      $this->db->where_as("$this->tbl_as.deskripsi", $keyword, "AND", "%like%", 0, 0);
      $this->db->where_as("$this->tbl_as.kd_ruangan", $keyword, "AND", "%like%", 0, 0);
    }
    return $this;
  }


  public function data($b_user_id = "", $page = 0, $pagesize = 10, $sortCol = "id", $sortDir = "ASC", $keyword = '', $is_active = '')
  {
    $this->datatables[$this->point_of_view]->selections($this->db);
    $this->db->from($this->tbl, $this->tbl_as);
    $this->filters($b_user_id, $keyword, $is_active)->scoped();
    $this->db->order_by($sortCol, $sortDir)->limit($page, $pagesize);
    return $this->db->get("object", 0);
  }

  public function count($b_user_id = '', $keyword = '', $is_active = '')
  {
    $this->db->select_as("COUNT($this->tbl_as.id)", "jumlah", 0);
    $this->db->from($this->tbl, $this->tbl_as);
    $this->filters($b_user_id, $keyword, $is_active)->scoped();
    $d = $this->db->get_first("object", 0);
    if (isset($d->jumlah)) {
      return $d->jumlah;
    }
    return 0;
  }
  public function setMass($dis)
  {
    return $this->db->insert_multi($this->tbl, $dis);
  }

  public function getByJadwalId($id)
  {
    $this->db->select_as("AVG($this->tbl_as.nilai)", 'nilai', 0);
    $this->db->select_as("$this->tbl_as.b_jadwal_kegiatan_id", 'b_jadwal_kegiatan_id', 0);
    $this->db->select_as("COALESCE($this->tbl2_as.fnama,'')", 'nama', 0);
    $this->db->select_as("COALESCE($this->tbl2_as.email,'')", 'email', 0);
    $this->db->from($this->tbl, $this->tbl_as);
    $this->db->join($this->tbl2, $this->tbl2_as, 'id', $this->tbl_as, 'b_user_id');
    $this->db->where_as($this->tbl_as . '.b_jadwal_kegiatan_id', $this->db->esc($id));
    $this->db->order_by("AVG($this->tbl_as.nilai)", "desc")->group_by("$this->tbl_as.b_user_id");
    return $this->db->get('', 0);
  }

  public function deleteByJadwalId($id)
  {
    $this->db->where("b_jadwal_kegiatan_id", $id);
    return $this->db->delete($this->tbl);
  }

  public function getByUserId($id)
  {
    $this->db->where('b_user_id', $id);
    $this->db->limit(100000);
    return $this->db->get('', 0);
  }

  public function deleteByUserId($id)
  {
    $this->db->where("b_user_id", $id);
    return $this->db->delete($this->tbl);
  }

  public function getByUserIdAndJadwalId($id, $jadwal_id)
  {
    $this->db->where('b_user_id', $id);
    $this->db->where('b_jadwal_kegiatan_id', $jadwal_id);
    $this->db->limit(100000);
    return $this->db->get('', 0);
  }

  public function deleteByUserIdAndJadwalId($id, $jadwal_id)
  {
    $this->db->where("b_user_id", $id);
    $this->db->where("b_jadwal_kegiatan_id", $jadwal_id);
    return $this->db->delete($this->tbl);
  }
}
