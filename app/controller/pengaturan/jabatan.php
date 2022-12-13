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
class Jabatan extends \JI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->setTheme('admin');
		$this->lib("seme_purifier");
		$this->load("a_jabatan_concern");
		$this->load("admin/a_jabatan_model", "ajm");
		$this->current_parent = 'pengaturan';
		$this->current_page = 'jabatan';
	}
	public function index()
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}


		$this->setTitle('Member ' . $this->config_semevar('site_suffix_admin', ''));

		$this->putThemeContent("pengaturan/jabatan/home_modal", $data);
		$this->putThemeContent("pengaturan/jabatan/home", $data);
		$this->putJsContent("pengaturan/jabatan/home_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
	public function baru()
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}
		$pengguna = $data['sess']->admin;


		$this->setTitle('Member Baru ' . $this->config_semevar('site_suffix', ''));

		$this->putThemeContent("pengaturan/jabatan/baru_modal", $data);
		$this->putThemeContent("pengaturan/jabatan/baru", $data);

		$this->putJsContent("pengaturan/jabatan/baru_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
	public function edit($id)
	{
		$data = $this->__init();
		if (!$this->admin_login) {
			redir(base_url_admin('login'));
			die();
		}
		$id = (int) $id;
		if ($id <= 0) {
			redir(base_url_admin('pengaturan/jabatan/'));
			die();
		}
		$arm = $this->arm->id($id);
		if (!isset($arm->id)) {
			redir(base_url_admin('pengaturan/jabatan/'));
			die();
		}

		// if (!isset($buam->id)) {
		// 	redir(base_url_admin('pengaturan/jabatan/'));
		// 	die();
		// }

		$data['arm'] = $arm;


		$this->setTitle('Member Edit #' . $arm->id . ' ' . $this->config_semevar('site_suffix', ''));
		$this->putThemeContent("pengaturan/jabatan/edit_modal", $data);
		$this->putThemeContent("pengaturan/jabatan/edit", $data);
		$this->putJsContent("pengaturan/jabatan/edit_bottom", $data);
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
			redir(base_url_admin('pengaturan/jabatan/'));
			die();
		}
		$arm = $this->arm->id($id);
		if (!isset($arm->id)) {
			redir(base_url_admin('pengaturan/jabatan/'));
			die();
		}
		$this->setTitle('Member Detail #' . $arm->id . ' ' . $this->config_semevar('site_suffix', ''));

		$arm->fnama = htmlentities($arm->fnama);
		$arm->alamat = htmlentities($arm->alamat);
		$data['arm'] = $arm;
		$data['arm']->parent = $this->arm->id($arm->a_company_id);
		unset($arm);

		$this->putThemeContent("pengaturan/jabatan/detail", $data);
		$this->putJsContent("pengaturan/jabatan/detail_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
}
