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
class B_Indikator_Pencapaian_Model extends \Model\B_Indikator_Pencapaian_Concern
{
  public $tbl2 = 'a_jabatan';
  public $tbl2_as = 'j';
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

  public function getByProgramId($id)
  {
    $this->db->where('a_program_id', $id);
    $this->db->limit(100000);
    return $this->db->get('', 0);
  }

  public function deleteByProgramId($id)
  {
    $this->db->where("a_program_id", $id);
    return $this->db->delete($this->tbl);
  }
}
