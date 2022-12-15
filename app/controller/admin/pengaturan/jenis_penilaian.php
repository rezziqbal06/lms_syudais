<?php

namespace Controller\Pengaturan;

register_namespace(__NAMESPACE__);

/**
 * Main Controller Class for User Modul
 *
 * Mostly for this controller will resulting HTTP Body Content in HTML format
 *
 * @version 1.0.0
 *
 * @package Partner\User
 * @since 1.0.0
 */
class Jenis_Penilaian extends \JI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->setTheme('admin');
		$this->lib("seme_purifier");
		$this->load("a_jpenilaian_concern");
		$this->load("a_ruangan_concern");
		$this->load("admin/a_jpenilaian_model", "ajm");
		$this->load("admin/a_ruangan_model", "arm");
		$this->current_parent = 'pengaturan';
		$this->current_page = 'jenis_penilaian';
	}
	public function index()
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}


		$data['ruangans'] = $this->arm->getAll();
		$this->setTitle('Jenis Penilaian ' . $this->config_semevar('site_suffix_admin', ''));

		$this->putThemeContent("pengaturan/jenis_penilaian/home_modal", $data);
		$this->putThemeContent("pengaturan/jenis_penilaian/home", $data);
		$this->putJsContent("pengaturan/jenis_penilaian/home_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
	public function indikator($id)
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}
		$id = (int) $id;
		if ($id <= 0) {
			redir(base_url_admin('pengaturan/jenis_penilaian'));
			die();
		}
		$pengguna = $data['sess']->admin;


		$this->setTitle('Jenis Penilaian - Indikator ' . $this->config_semevar('site_suffix', ''));

		$this->putThemeContent("pengaturan/indikator/home_modal", $data);
		$this->putThemeContent("pengaturan/indikator/home", $data);

		$this->putJsContent("pengaturan/indikator/home_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
	public function detail($id)
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}
		$id = (int) $id;
		if ($id <= 0) {
			redir(base_url_admin('akun/user/'));
			die();
		}
		$ajm = $this->ajm->id($id);
		if (!isset($ajm->id)) {
			redir(base_url_admin('akun/user/'));
			die();
		}
		$this->setTitle('Jenis Penilaian Detail #' . $ajm->id . ' ' . $this->config_semevar('site_suffix', ''));

		$ajm->fnama = htmlentities($ajm->fnama);
		$ajm->alamat = htmlentities($ajm->alamat);
		$data['ajm'] = $ajm;
		$data['ajm']->parent = $this->ajm->id($ajm->a_company_id);
		unset($ajm);

		$this->putThemeContent("akun/user/detail", $data);
		$this->putJsContent("akun/user/detail_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
}
