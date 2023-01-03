<?php
class Asesmen extends JI_Controller
{
	var $media_pengguna = 'media/';

	public function __construct()
	{
		parent::__construct();
		$this->setTheme('front');
		$this->current_parent = 'asesmen';
		$this->current_page = 'asesmen';
		// $this->load('a_company_concern');
		$this->load('a_jpenilaian_concern');
		$this->load('a_indikator_concern');
		$this->load('a_ruangan_concern');
		$this->load('a_jabatan_concern');
		$this->load('b_user_concern');
		$this->load('c_asesmen_concern');

		$this->load('front/a_jpenilaian_model', 'ajm');
		$this->load('front/a_indikator_model', 'aim');
		$this->load('front/a_ruangan_model', 'arm');
		$this->load('front/a_jabatan_model', 'ajbm');
		$this->load('front/b_user_model', 'bum');
		$this->load('front/c_asesmen_model', 'cam');
	}

	public function index()
	{
		$data = $this->__init();

		if (!$this->user_login) {
			redir(base_url('login'));
			die();
		}

		$ajm = $this->ajm->getAll();
		if (isset($ajm[0]->id)) $data['ajm'] = $ajm;
		unset($ajm);

		$this->setTitle('Asesmen ' . $this->config->semevar->site_suffix);
		$this->putThemeContent("asesmen/home_modal", $data);
		$this->putThemeContent("asesmen/home", $data);

		$this->putJsReady("asesmen/home_bottom", $data);
		$this->loadLayout('col-1-bar', $data);
		$this->render();
	}
	public function detail($slug = '')
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'));
			die();
		}

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

		$aim = $this->aim->getByPenilaianId($ajm->id);
		if (!isset($aim[0]->id)) {
			redir(base_url('asesmen'));
			die();
		}
		$data['aim'] = $aim;

		$arm = $this->arm->getAll();
		if (!isset($arm[0]->id)) {
			redir(base_url('asesmen'));
			die();
		}
		$data['arm'] = $arm;

		$ajbm = $this->ajbm->getAll();
		if (!isset($ajbm[0]->id)) {
			redir(base_url('asesmen'));
			die();
		}
		$data['ajbm'] = $ajbm;

		$type_form = 1;
		if (in_array($ajm->slug, ['audit-hand-hygiene'])) {
			$type_form = 1;
		} else if (in_array($ajm->slug, ['monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi'])) {
			$type_form = 2;
			$group_by_kategori = [];
			foreach ($aim as $key) {
				$group_by_kategori[$key->kategori][] = $key;
			}
			$data['aim'] = $group_by_kategori;
		}

		$data['type_form'] = $type_form;
		$data['slug'] = $ajm->slug;

		unset($type_form);
		unset($ajm);
		unset($aim);
		unset($aim);

		date_default_timezone_set('Asia/Jakarta');
		$data['stime'] = date('H:i:s');

		$this->setTitle('Asesmen' . $this->config->semevar->site_suffix);
		$this->putThemeContent("asesmen/detail_modal", $data);
		$this->putThemeContent("asesmen/detail", $data);

		$this->putJsReady("asesmen/detail_bottom", $data);
		$this->loadLayout('col-1', $data);
		$this->render();
	}

	public function edit($slug = '', $id = '')
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'));
			die();
		}

		if (!strlen($slug)) {
			redir(base_url(''));
			die();
		}

		$ajm = $this->ajm->getBySlug($slug);
		if (!isset($ajm->id)) {
			redir(base_url(''));
			die();
		}
		$data['ajm'] = $ajm;

		$aim = $this->aim->getByPenilaianId($ajm->id);
		if (!isset($aim[0]->id)) {
			redir(base_url(''));
			die();
		}
		$data['aim'] = $aim;

		$arm = $this->arm->getAll();
		if (!isset($arm[0]->id)) {
			redir(base_url(''));
			die();
		}
		$data['arm'] = $arm;

		$ajbm = $this->ajbm->getAll();
		if (!isset($ajbm[0]->id)) {
			redir(base_url(''));
			die();
		}
		$data['ajbm'] = $ajbm;

		$cam = $this->cam->id($id);
		if (!isset($cam)) {
			redir(base_url(''));
			die();
		}

		$user = $this->bum->id($cam->b_user_id);
		if (!isset($user)) {
			redir(base_url(''));
			die();
		}
		$cam->b_user_name = $user->fnama;

		$value = json_decode($cam->value);
		$type_form = 1;
		if (in_array($ajm->slug, ['audit-hand-hygiene'])) {
			$type_form = 1;
		} else if (in_array($ajm->slug, ['monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi'])) {
			$type_form = 2;
			$group_by_kategori = [];
			foreach ($aim as $key) {
				$group_by_kategori[$key->kategori][] = $key;
			}
			$data['aim'] = $group_by_kategori;
		}

		$data['type_form'] = $type_form;
		$data['slug'] = $ajm->slug;
		$data['cam'] = $cam;
		$data['value'] = $value;
		$data['id'] = $id;
		unset($value);
		unset($type_form);
		unset($ajm);
		unset($aim);
		unset($cam);

		date_default_timezone_set('Asia/Jakarta');
		$data['stime'] = date('H:i:s');

		$this->setTitle('Asesmen' . $this->config->semevar->site_suffix);
		$this->putThemeContent("asesmen/detail_modal", $data);
		$this->putThemeContent("asesmen/detail", $data);

		$this->putJsReady("asesmen/detail_bottom", $data);
		$this->loadLayout('col-1', $data);
		$this->render();
	}
}
