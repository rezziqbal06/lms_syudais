<?php

class Asesmen extends JI_Controller
{
	var $media_pengguna = 'media/pengguna';

	public function __construct()
	{
		parent::__construct();
		$this->load('a_jpenilaian_concern');
		$this->load('a_indikator_concern');
		$this->load('b_user_concern');
		$this->load('c_asesmen_concern');

		$this->load("api_front/a_jpenilaian_model", 'ajm');
		$this->load("api_front/a_indikator_model", 'aim');
		$this->load("api_front/b_user_model", 'bum');
		$this->load("api_front/c_asesmen_model", 'cam');
	}

	/**
	 * Give json data set result on datatable format
	 *
	 * @api
	 *
	 * @return void
	 */
	public function index()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'admin');

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];

		/** advanced filter is_active */
		$a_unit_id = $this->input->request('a_unit_id', '');
		if (strlen($a_unit_id)) {
			$a_unit_id = intval($a_unit_id);
		}
		$is_active = $this->input->request('is_active', '');
		if (strlen($is_active)) {
			$is_active = intval($is_active);
		}

		$admin_login = $d['sess']->user;
		$b_user_id = '';
		// Jika user adalah reseller, maka mengambil kustomernya
		// if (isset($admin_login->utype) && $admin_login->utype == 'agen') {
		// 	$b_user_id = $admin_login->id;
		// }

		$datatable = $this->cam->datatable()->initialize();
		$dcount = $this->cam->count($b_user_id, $datatable->keyword(), $is_active, $a_unit_id);
		$ddata = $this->cam->data(
			$b_user_id,
			$datatable->page(),
			$datatable->pagesize(),
			$datatable->sort_column(),
			$datatable->sort_direction(),
			$datatable->keyword(),
			$is_active,
			$a_unit_id
		);

		foreach ($ddata as &$gd) {
			if (isset($gd->fnama)) {
				$gd->fnama = htmlentities(rtrim($gd->fnama, ' - '));
			}
			if (isset($gd->utype)) {
				$gd->utype = ($gd->utype == 'agen' || $gd->utype == 'reseller') ? '<span class="label label-warning">Reseller</span>' : '<span class="label label-primary">Member</span>';
			}
			if (isset($gd->is_active)) {
				$gd->is_active = $this->cam->label('is_active', $gd->is_active);
			}
		}

		$this->__jsonDataTable($ddata, $dcount);
	}

	/**
	 * Create new data
	 *
	 * @api
	 *
	 * @return void
	 */
	public function baru()
	{
		$d = $this->__init();
		$data = [];
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		if (!$this->cam->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->cam->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}

		$ajm = $this->ajm->id($this->input->post('a_jpenilaian_id'));
		if (!isset($ajm->id)) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$b_user_id = !empty((int) $this->input->request('b_user_id')) ? $this->input->request('b_user_id') : '';
		if (!isset($b_user_id) || !strlen($b_user_id)) {
			$bum = $this->bum->getByName($this->input->request('user'));
			if (isset($bum->id)) {
				$this->cam->columns['b_user_id']->value = $bum->id;
			} else {
				$bu = [];
				$bu['fnama'] = $this->input->request('user');
				$bu['a_unit_id'] = $this->input->request('a_ruangan_id');
				$bu['a_jabatan_id'] = $this->input->request('a_jabatan_id');
				$bu['cdate'] = 'now()';
				$resUser = $this->bum->set($bu);
				if ($resUser) {
					$this->cam->columns['b_user_id']->value = $resUser;
				}
			}
		}

		date_default_timezone_set('Asia/Jakarta');
		$stime = $this->input->request('stime');
		$etime = date('H:i:s');
		$time1 = new DateTime(date('Y-m-d') . ' ' . $stime);
		$time2 = new DateTime();
		$timediff = $time1->diff($time2);

		$this->cam->columns['etime']->value = $etime;
		$this->cam->columns['cdate']->value = date('Y-m-d H:i:s');
		$this->cam->columns['b_user_id_penilai']->value = isset($d['sess']->user->id) ? $d['sess']->user->id : 0;

		$this->cam->columns['durasi']->value = $timediff->h . '.' . $timediff->i;

		$value = [];
		if ($ajm->slug == 'audit-hand-hygiene') {
			$nilai = 0;
			$value = [];
			$indikator = $this->input->request('a_indikator_id');
			if (is_array($indikator) && count($indikator)) {
				foreach ($indikator as $k => $v) {
					$value[$k]['indikator'] = $v;
					$value[$k]['aksi'] = $this->input->request('a_aksi_id_' . $k) ?? null;
					$aksi = $this->aim->id($value[$k]['aksi']);
					if (isset($aksi->nama) && ($aksi->nama == 'HW' || $aksi->nama == 'HR')) {
						$nilai++;
					}
				}

				$this->cam->columns['nilai']->value = $nilai;
			}


			$value = json_encode($value);
		} else if ($ajm->slug == 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi') {
			$value = [];
			$aksi = $this->input->request("aksi");
			foreach ($aksi as $k => $v) {
				$value[] = [
					"indikator" => "$k",
					"aksi" => $v
				];
			}
			$value = json_encode($value);
		}
		$this->cam->columns['value']->value = $value;

		$res = $this->cam->save();
		if ($res) {
			$this->status = 200;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		} else {
			$this->status = 110;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		}
		$this->__json_out($data);
	}

	/**
	 * Get detailed information by idea
	 *
	 * @param  int   $id               ID value from a_fasilitas table
	 *
	 * @api
	 * @return void
	 */
	public function detail($id)
	{
		$d = $this->__init();
		$data = array();
		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$id = (int) $id;

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];
		$data = $this->cam->id($id);
		if (!isset($data->id)) {
			$data = [];
			$this->status = 441;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		$this->__json_out($data);
	}

	/**
	 * Update data by supplied ID
	 *
	 * @param  int   $id               ID value from a_fasilitas table
	 *
	 * @api
	 *
	 * @return void
	 */
	public function edit($id = "")
	{
		$d = $this->__init();
		$data = array();
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$du = $_POST;


		$id = (int)$id;


		$id = (int) $id;
		if ($id <= 0) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$cam = $this->cam->id($id);
		if (!isset($cam->id)) {
			$this->status = 445;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		if (!$this->cam->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->cam->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}

		$ajm = $this->ajm->id($this->input->post('a_jpenilaian_id'));
		if (!isset($ajm->id)) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$b_user_id = !empty((int) $this->input->request('b_user_id')) ? $this->input->request('b_user_id') : '';
		if (!isset($b_user_id) || !strlen($b_user_id)) {
			$bum = $this->bum->getByName($this->input->request('user'));
			if (isset($bum->id)) {
				$this->cam->columns['b_user_id']->value = $bum->id;
			} else {
				$bu = [];
				$bu['fnama'] = $this->input->request('user');
				$bu['a_unit_id'] = $this->input->request('a_ruangan_id');
				$bu['a_jabatan_id'] = $this->input->request('a_jabatan_id');
				$bu['cdate'] = 'now()';
				$resUser = $this->bum->set($bu);
				if ($resUser) {
					$this->cam->columns['b_user_id']->value = $resUser;
				}
			}
		}

		date_default_timezone_set('Asia/Jakarta');
		$stime = $this->input->request('stime');
		$etime = date('H:i:s');
		$time1 = new DateTime(date('Y-m-d') . ' ' . $stime);
		$time2 = new DateTime();
		$timediff = $time1->diff($time2);

		$this->cam->columns['etime']->value = $etime;
		$this->cam->columns['cdate']->value = date('Y-m-d H:i:s');
		$this->cam->columns['b_user_id_penilai']->value = isset($d['sess']->user->id) ? $d['sess']->user->id : 0;

		$this->cam->columns['durasi']->value = $timediff->h . '.' . $timediff->i;

		$value = [];
		if ($ajm->slug == 'audit-hand-hygiene') {
			$nilai = 0;
			$value = [];
			$indikator = $this->input->request('a_indikator_id');
			if (is_array($indikator) && count($indikator)) {
				foreach ($indikator as $k => $v) {
					$value[$k]['indikator'] = $v;
					$value[$k]['aksi'] = $this->input->request('a_aksi_id_' . $k) ?? null;
					$aksi = $this->aim->id($value[$k]['aksi']);
					if (isset($aksi->nama) && ($aksi->nama == 'HW' || $aksi->nama == 'HR')) {
						$nilai++;
					}
				}

				$this->cam->columns['nilai']->value = $nilai;
			}


			$value = json_encode($value);
		} else if ($ajm->slug == 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi') {
			$value = [];
			$aksi = $this->input->request("aksi");
			foreach ($aksi as $k => $v) {
				$value[] = [
					"indikator" => "$k",
					"aksi" => $v
				];
			}
			$value = json_encode($value);
		}
		$this->cam->columns['value']->value = $value;

		if ($id > 0) {
			unset($du['id']);
			$res = $this->cam->save($id);
			if ($res) {
				$this->status = 200;
				$this->message = API_ADMIN_ERROR_CODES[$this->status];
			} else {
				$this->status = 901;
				$this->message = API_ADMIN_ERROR_CODES[$this->status];
			}
		} else {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$this->__json_out($data);
	}

	/**
	 * Delete data by supplied ID
	 *
	 * @param  int   $id               ID value from a_fasilitas table
	 *
	 * @api
	 *
	 * @return void
	 */
	public function hapus($id)
	{
		$d = $this->__init();

		$data = array();
		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}

		$id = (int) $id;
		if ($id <= 0) {
			$this->status = 520;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		$pengguna = $d['sess']->admin;

		$cam = $this->cam->id($id);
		if (!isset($cam->id)) {
			$this->status = 521;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		if (!empty($cam->is_deleted)) {
			$this->status = 522;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$res = $this->cam->update($id, array('is_deleted' => 1));
		if ($res) {
			$this->status = 200;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		} else {
			$this->status = 902;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		}
		$this->__json_out($data);
	}

	/**
	 * Give json data set result on datatable format
	 *
	 * @api
	 *
	 * @return void
	 */
	public function list()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];

		/** advanced filter is_active */
		$a_jpenilaian_id = $this->input->request('a_jpenilaian_id', '');
		$a_ruangan_id = $this->input->request('a_ruangan_id', '');
		$b_user_id = $this->input->request('b_user_id', '');
		$b_user_id_penilai = $this->input->request('b_user_id_penilai', '');
		$is_active = $this->input->request('is_active', '');
		$sdate = $this->input->request('sdate', '');
		$edate = $this->input->request('edate', '');
		$page = $this->input->request('page', 0);
		$pagesize = $this->input->request('pagesize', 10);
		$sort_column = $this->input->request('sort_column', 'id');
		$sort_direction = $this->input->request('sort_direction', 'desc');
		$keyword = $this->input->request('keyword', '');


		$dcount = $this->cam->count($b_user_id, $b_user_id_penilai, $a_jpenilaian_id, $a_ruangan_id, $sdate, $edate, $keyword, $is_active);
		$ddata = $this->cam->data(
			$page,
			$pagesize,
			$sort_column,
			$sort_direction,
			$b_user_id,
			$b_user_id_penilai,
			$a_jpenilaian_id,
			$a_ruangan_id,
			$sdate,
			$edate,
			$keyword,
			$is_active
		);

		foreach ($ddata as &$gd) {
			if (isset($gd->is_active)) {
				$gd->is_active = $this->cam->label('is_active', $gd->is_active);
			}

			if (isset($gd->cdate)) {
				$gd->cdate = $this->__dateIndonesia($gd->cdate);
			}

			if (isset($gd->durasi)) {
				$durasis = explode('.', $gd->durasi);

				$gd->durasi = '';
				if ((int) $durasis[0]) $gd->durasi .= $durasis[0] . ' jam ';
				if ((int) $durasis[1]) $gd->durasi .= $durasis[1] . ' menit';
			}
		}

		$datasets = $this->cam->datasets($b_user_id, $b_user_id_penilai, $a_jpenilaian_id, $a_ruangan_id, $sdate, $edate, $keyword, $is_active);
		foreach ($datasets as $k => $v) {
			$percent = ($v->nilai / $v->jumlah) * 100;
			$v->percent = $percent;
			unset($v->nilai);
			unset($v->jumlah);
		}

		$data['datasets'] = $datasets;
		$data['list'] = $ddata;
		$data['count'] = $dcount;

		$this->__json_out($data);
	}

	public function indicatorLists($slug = "", $a_ruangan_id = 0)
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];

		/** advanced filter is_active */

		if (!strlen($slug)) {
			redir(base_url('asesmen'));
			die();
		}

		$ajm = $this->ajm->getBySlug($slug);
		if (!isset($ajm->id)) {
			redir(base_url('asesmen'));
			die();
		}
		$data['ajm'] = $ajm;

		$aim = $this->aim->getByIndikator($a_ruangan_id, $ajm->id);
		if (!isset($aim[0]->id)) {
			$aim = [];
		} else {
			$group_by_kategori = [];
			foreach ($aim as $key) {
				$group_by_kategori[$key->kategori][] = $key;
			}
			$aim = $group_by_kategori;
		}
		$data['aim'] = $aim;






		// $type_form = 1;
		// if (in_array($ajm->slug, ['audit-hand-hygiene'])) {
		// 	$type_form = 1;
		// }else if(in_array($ajm->slug, ['monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi'])){
		// 	$type_form = 2;
		// 	$group_by_kategori = [];
		// 	if($a_ruangan_id > 0){
		// 		dd($aim);
		// 		foreach ($aim as $k => $v) {
		// 			if(!in_array($a_ruangan_id,$v->a_ruangan_ids)){
		// 				array_pop($aim[$k]);
		// 			}
		// 		}
		// 	}
		// 	foreach ($aim as $key ) {
		// 		$group_by_kategori[$key->kategori][] = $key;
		// 	}
		// 	$data['aim'] = $group_by_kategori;
		// }

		// $data['type_form'] = $type_form;

		// unset($type_form);
		// unset($ajm);
		// unset($aim);
		// unset($aim);

		// date_default_timezone_set('Asia/Jakarta');
		// $data['stime'] = date('H:i:s');

		$this->__json_out($data);
	}
}
