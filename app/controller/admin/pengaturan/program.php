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
class Program extends \JI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->setTheme('admin');
		$this->lib("seme_purifier");
		$this->load("a_program_concern");
		$this->load("a_ruangan_concern");
		$this->load("admin/a_program_model", "apm");
		$this->load("admin/a_ruangan_model", "arm");
		$this->current_parent = 'pengaturan';
		$this->current_page = 'program';
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

		$this->putThemeContent("pengaturan/program/home_modal", $data);
		$this->putThemeContent("pengaturan/program/home", $data);
		$this->putJsContent("pengaturan/program/home_bottom", $data);
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
			redir(base_url_admin('pengaturan/program'));
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
		$apm = $this->apm->id($id);
		if (!isset($apm->id)) {
			redir(base_url_admin('akun/user/'));
			die();
		}
		$this->setTitle('Jenis Penilaian Detail #' . $apm->id . ' ' . $this->config_semevar('site_suffix', ''));

		$apm->fnama = htmlentities($apm->fnama);
		$apm->alamat = htmlentities($apm->alamat);
		$data['apm'] = $apm;
		$data['apm']->parent = $this->apm->id($apm->a_company_id);
		unset($apm);

		$this->putThemeContent("akun/user/detail", $data);
		$this->putJsContent("akun/user/detail_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
}
