<?php
date_default_timezone_set('Asia/Jakarta');

class Program extends JI_Controller
{
	var $media_pengguna = 'media/pengguna';

	public function __construct()
	{
		parent::__construct();
		$this->load('a_program_concern');
		$this->load('b_jadwal_kegiatan_concern');
		$this->load("api_front/a_program_model", 'apm');
		$this->load("api_front/b_jadwal_kegiatan_model", 'bjkm');
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


		$is_active = $this->input->request('is_active', 1);
		if (strlen($is_active)) {
			$is_active = intval($is_active);
		}

		$admin_login = $d['sess']->user;
		$b_user_id = '';
		// Jika user adalah reseller, maka mengambil kustomernya
		// if (isset($admin_login->utype) && $admin_login->utype == 'agen') {
		// 	$b_user_id = $admin_login->id;
		// }

		$datatable = $this->apm->datatable()->initialize();
		$dcount = $this->apm->count($datatable->keyword(), $is_active);
		$ddata = $this->apm->data(
			$datatable->page(),
			$datatable->pagesize(),
			$datatable->sort_column(),
			$datatable->sort_direction(),
			$datatable->keyword(),
			$is_active
		);

		foreach ($ddata as &$gd) {
			if (isset($gd->fnama)) {
				$gd->fnama = htmlentities(rtrim($gd->fnama, ' - '));
			}
			if (isset($gd->is_active)) {
				$gd->is_active = $this->apm->label('is_active', $gd->is_active);
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

		$data = new \stdClass();
		if (!$this->apm->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->apm->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}
		$this->apm->columns['cdate']->value = 'NOW()';


		$res = $this->apm->save();
		if ($res) {
			$this->status = 200;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$nama_indikator = $this->input->request('nama_indikator') ?? null;
			// if (isset($nama_indikator) && is_array($nama_indikator) && count($nama_indikator)) {
			// 	$dai = [];
			// 	foreach ($nama_indikator as $k => $v) {
			// 		$dai[$k]['nama'] = $v;
			// 		$dai[$k]['a_ruangan_ids'] = isset($_POST['a_ruangan_ids_' . $k]) ? json_encode($_POST['a_ruangan_ids_' . $k]) : '';
			// 		$dai[$k]['kategori'] = $_POST['kategori'][$k] ?? '';
			// 		$dai[$k]['subkategori'] = $_POST['subkategori'][$k] ?? '';
			// 		$dai[$k]['is_optional'] = $_POST['is_optional'][$k] ?? 0;
			// 		$dai[$k]['type'] = $_POST['type'][$k] ?? '';
			// 		$dai[$k]['a_program_id'] = $res;
			// 		$dai[$k]['cdate'] = 'NOW()';
			// 	}
			// 	$res = $this->aim->setMass($dai);
			// 	if ($res) {
			// 		$this->status = 200;
			// 		$this->message = API_ADMIN_ERROR_CODES[$this->status];
			// 	} else {
			// 		$this->status = 110;
			// 		$this->message = API_ADMIN_ERROR_CODES[$this->status];
			// 	}
			// }
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
		$data = $this->apm->id($id);
		if (!isset($data->id)) {
			$data = new \stdClass();
			$this->status = 441;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		// $data->indikator = $this->aim->getByPenilaianId($id);
		// dd(count($data->indikator));
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

		$du = $_POST;


		$id = (int)$id;
		$id = isset($du['id']) ? $du['id'] : 0;
		$du = [];
		$du['nama'] = $_POST['nama'];
		$du['deskripsi'] = $_POST['deskripsi'];
		$du['slug'] = $_POST['slug'] ?? null;
		$du['warna'] = $_POST['warna'] ?? null;
		$du['icon'] = $_POST['icon'] ?? null;
		// $du['kategori'] = $_POST['kategori'] ?? null;

		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}

		$id = (int) $id;
		if ($id <= 0) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$apm = $this->apm->id($id);
		if (!isset($apm->id)) {
			$this->status = 445;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		if (!$this->apm->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->apm->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}
		if ($id > 0) {
			unset($du['id']);
			$res = $this->apm->update($id, $du);
			if ($res) {
				$nama_indikator = $this->input->request('nama_indikator') ?? null;
				if (isset($nama_indikator) && is_array($nama_indikator) && count($nama_indikator)) {
					// $resDelete = $this->aim->deleteByPenilaianId($id);
					// if (!$resDelete) {
					// 	$this->status = 200;
					// 	$this->message = API_ADMIN_ERROR_CODES[$this->status];
					// 	$this->__json_out($data);
					// 	die();
					// }

					// $dai = [];
					// foreach ($nama_indikator as $k => $v) {
					// 	$dai[$k]['nama'] = $v;
					// 	$dai[$k]['a_ruangan_ids'] = isset($_POST['a_ruangan_ids_' . $k]) ? json_encode($_POST['a_ruangan_ids_' . $k]) : '';
					// 	$dai[$k]['kategori'] = $_POST['kategori'][$k] ?? '';
					// 	$dai[$k]['subkategori'] = $_POST['subkategori'][$k] ?? '';
					// 	$dai[$k]['is_optional'] = $_POST['is_optional'][$k] ?? '';
					// 	$dai[$k]['type'] = $_POST['type'][$k] ?? '';
					// 	$dai[$k]['a_program_id'] = $id;
					// 	$dai[$k]['cdate'] = 'NOW()';
					// }
					// $res = $this->aim->setMass($dai);
					// if ($res) {
					// 	$this->status = 200;
					// 	$this->message = API_ADMIN_ERROR_CODES[$this->status];
					// } else {
					// 	$this->status = 110;
					// 	$this->message = API_ADMIN_ERROR_CODES[$this->status];
					// }
				}
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

		$apm = $this->apm->id($id);
		if (!isset($apm->id)) {
			$this->status = 521;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		if (!empty($apm->is_deleted)) {
			$this->status = 522;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$res = $this->apm->update($id, array('is_deleted' => 1));
		if ($res) {
			$this->status = 200;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		} else {
			$this->status = 902;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		}
		$this->__json_out($data);
	}
	public function editpass($id = "")
	{
		$d = $this->__init();
		$data = array();
		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$id = (int) $id;
		$du = $_POST;
		if (!isset($du['id'])) $du['id'] = 0;
		unset($du['id']);
		if ($id > 0) {
			if (strlen($du['password'])) {
				$du['password'] = md5($du['password']);
				$res = $this->apm->update($id, $du);
				$this->status = 200;
				$this->message = 'Perubahan berhasil diterapkan';
			} else {
				$this->status = 901;
				$this->message = 'Password terlalu pendek';
			}
		} else {
			$this->status = 447;
			$this->message = 'ID Pengguna tidak valid';
		}
		$this->__json_out($data);
	}


	public function edit_foto($id)
	{
		$d = $this->__init();
		$data = array();
		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$id = (int) $id;
		$du = $_POST;
		if (!isset($du['id'])) $du['id'] = 0;
		if (empty($id)) {
			$id = (int) $du['id'];
			unset($du['id']);
		}
		$pengguna = $this->apm->getById($id);
		if ($id > 0 && isset($pengguna->id)) {
			if (!empty($penguna_foto)) {
				if (strlen($pengguna->foto) > 4) {
					$foto = SEMEROOT . DIRECTORY_SEPARATOR . $pengguna->foto;
					if (file_exists($foto)) unlink($foto);
				}
				$du = array();
				$du['foto'] = $penguna_foto;
				$res = $this->apm->update($id, $du);
				if ($res) {
					$this->status = 200;
					$this->message = 'Upload foto berhasil';
				} else {
					$this->status = 901;
					$this->message = 'Upload foto gagal';
				}
			} else {
				$this->status = 459;
				$this->message = 'Tidak ada file gambar yang terupload';
			}
		} else {
			$this->status = 550;
			$this->message = 'Dont hack this :P';
		}
		$this->__json_out($data);
	}

	//Temporary Select2 di Pengguna API
	public function select2()
	{
		$this->load("api_admin/b_user_model", 'apm');
		$d = $this->__init();
		$keyword = $this->input->request('q');
		$ddata = $this->apm->select2($keyword);
		$datares = array();
		$i = 0;
		foreach ($ddata as $key => $value) {
			$datares["results"][$i++] = array("id" => $value->id, "text" => $value->kode . " - " . $value->fnama);
		}
		header('Content-Type: application/json');
		echo json_encode($datares);
	}

	public function hak_akses()
	{
		$d = $this->__init();
		$data = array();
		if (!$this->admin_login) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$this->load('api_admin/a_pengguna_module_model', 'apmm');
		$a_pengguna_id			= $_POST['a_pengguna_id'];
		$a_modules_identifier	= $_POST['a_modules_identifier'];

		$this->apmm->updateModule(array('tmp_active' => 'N'), $a_pengguna_id);

		foreach ($a_modules_identifier as $ami) {
			$arr							= array();
			$arr['a_pengguna_id']			= $a_pengguna_id;
			$arr['a_modules_identifier']	= $ami;
			$arr['rule']					= 'allowed';
			$arr['tmp_active']				= 'Y';

			$check_ami = $this->apmm->check_access($a_pengguna_id, $ami);
			if ($check_ami == 0) {
				$this->apmm->set($arr);
			} else {
				$this->apmm->updateModule($arr, $a_pengguna_id, $ami);
			}
		}

		$res = $this->apmm->delModule($a_pengguna_id);

		if ($res) {
			$this->status 	= 200;
			$this->message 	= 'Berhasil disimpan';
		} else {
			$this->status 	= 901;
			$this->message 	= 'Terjadi kesalahan dalam proses';
		}

		$this->__json_out($data);
	}
	public function pengguna_module()
	{
		$this->load('api_admin/a_pengguna_module_model', 'apmm');
		$d 			= $this->__init();
		$id			= $this->input->post('id');
		$ddata 		= $this->apmm->pengguna_module($id);
		$datares 	= array();
		$i 			= 0;
		foreach ($ddata as $key => $value) {
			$datares[$i++] = $value->a_modules_identifier;
		}
		header('Content-Type: application/json');
		echo json_encode($datares);
	}
	public function cari()
	{
		$keyword = $this->input->request("keyword");
		if (empty($keyword)) $keyword = "";
		$p = new stdClass();
		$p->id = 'NULL';
		$p->text = '-';
		$data = $this->apm->cari($keyword);
		array_unshift($data, $p);
		$this->__json_select2($data);
	}

	/**
	 * Create new data
	 *
	 * @api
	 *
	 * @return void
	 */
	public function tambah_jadwal()
	{
		$d = $this->__init();
		$data = array();
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$data = new \stdClass();
		if (!$this->bjkm->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->bjkm->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}
		$this->bjkm->columns['cdate']->value = 'NOW()';
		$this->bjkm->columns['b_user_id']->value = $d['sess']->user->id;


		$res = $this->bjkm->save();
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
	 * Create new data
	 *
	 * @api
	 *
	 * @return void
	 */
	public function edit_jadwal($id)
	{
		$d = $this->__init();
		$data = array();
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$bjkm = $this->bjkm->id($id);
		if (!isset($bjkm->id)) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		$data = new \stdClass();
		if (!$this->bjkm->validates()) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$validation_message = $this->bjkm->validation_message();
			if (strlen($validation_message)) {
				$this->message = $validation_message;
			}
			$this->__json_out($data);
			die();
		}

		$du = $_POST;
		$res = $this->bjkm->update($id, $du);
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
	 * Delete data by supplied ID
	 *
	 * @param  int   $id               ID value from a_fasilitas table
	 *
	 * @api
	 *
	 * @return void
	 */
	public function hapus_jadwal($id)
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

		$bjkm = $this->bjkm->id($id);
		if (!isset($bjkm->id)) {
			$this->status = 521;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		if (!empty($bjkm->is_deleted)) {
			$this->status = 522;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$res = $this->bjkm->update($id, array('is_deleted' => 1));
		if ($res) {
			$this->status = 200;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		} else {
			$this->status = 902;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
		}
		$this->__json_out($data);
	}

	function __convertDayToDateString($dayNumber)
	{
		$today = new DateTime();
		$currentDayOfWeek = (int)$today->format('N'); // 1 for Monday, 2 for Tuesday, ..., 7 for Sunday
		$difference = $dayNumber - $currentDayOfWeek;
		$date = $today->add(new DateInterval("P{$difference}D"));
		return $date->format('Y-m-d');
	}

	public function get_jadwal($id)
	{
		$d = $this->__init();
		$data = array();
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$type = $this->input->request('type', 'today');
		$apm = $this->apm->id($id);
		if (!isset($apm->id)) {
			$this->status = 445;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		if ($type == 'today') {
			$hari = date('N');
			$sdate = date('Y-m-d');
			$jadwal = $this->bjkm->getAll($apm->id, $hari, $sdate, '');
		} else {
			$today = new DateTime();
			$startOfWeek = clone $today;
			$startOfWeek->modify('Monday this week');

			$endOfWeek = clone $startOfWeek;
			$endOfWeek->modify('Sunday this week');

			$sdate = $startOfWeek->format('Y-m-d');
			$edate = $endOfWeek->format('Y-m-d');
			$jadwal = $this->bjkm->getAll($apm->id, 0, $sdate, $edate);
		}
		foreach ($jadwal as $j) {
			if (!isset($j->sdate) || $j->sdate == '0000-00-00 00:00:00') $j->sdate = "";
			if (!isset($j->edate) || $j->edate == '0000-00-00 00:00:00') $j->edate = "";
			if ($j->is_rutin) {
				if ($type == 'today') {
					$j->sdate = $this->__dateIndonesia(date("Y-m-d"));
				} else {
					$j->sdate = $this->__convertDayToDateString($j->hari);
					if (strlen($j->sdate)) $j->sdate = $this->__dateIndonesia($j->sdate);
				}
			} else {

				if (strlen($j->sdate)) $j->sdate = $this->__dateIndonesia($j->sdate);
				if (strlen($j->edate)) $j->edate = $this->__dateIndonesia($j->edate);
			}
			if (isset($j->stime)) $j->stime = date('H:i', strtotime($j->stime));
			if (isset($j->etime)) $j->etime = date('H:i', strtotime($j->etime));
		}
		$data = $jadwal;

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];
		$this->__json_out($data);
	}

	public function get_jadwal_detail($id)
	{
		$d = $this->__init();
		$data = array();
		if (!$this->user_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$type = $this->input->request('type', 'today');
		$bjkm = $this->bjkm->id($id);
		if (!isset($bjkm->id)) {
			$this->status = 445;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		if (!isset($bjkm->sdate) || $bjkm->sdate == '0000-00-00 00:00:00') $bjkm->sdate = "";
		if (!isset($bjkm->edate) || $bjkm->edate == '0000-00-00 00:00:00') $bjkm->edate = "";
		if ($bjkm->is_rutin) {
			if ($type == 'today') {
				$bjkm->sdate_text = $this->__dateIndonesia(date("Y-m-d"));
			} else {
				$bjkm->sdate_text = $this->__convertDayToDateString($bjkm->hari);
				if (strlen($bjkm->sdate)) $bjkm->sdate_text = $this->__dateIndonesia($bjkm->sdate);
			}
		} else {
			if (strlen($bjkm->sdate)) $bjkm->sdate_text = $this->__dateIndonesia($bjkm->sdate);
			if (strlen($bjkm->edate)) $bjkm->edate_text = $this->__dateIndonesia($bjkm->edate);
		}
		if (isset($bjkm->stime)) $bjkm->stime = date('H:i', strtotime($bjkm->stime));
		if (isset($bjkm->etime)) $bjkm->etime = date('H:i', strtotime($bjkm->etime));
		$data['detail'] = $bjkm;

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];
		$this->__json_out($data);
	}
}
