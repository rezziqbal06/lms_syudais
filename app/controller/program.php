<?php

namespace Controller;

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
		$this->setTheme('front');
		$this->lib("seme_purifier");
		$this->load("a_program_concern");
		$this->load("b_user_module_concern");
		$this->load("b_jadwal_kegiatan_concern");
		$this->load("front/a_program_model", "apm");
		$this->load("front/b_user_module_model", "bumm");
		$this->load("front/b_jadwal_kegiatan_model", "bjkm");
		$this->current_parent = 'program';
		$this->current_page = 'daftar';
	}
	public function index()
	{
		redir(base_url(''));
		die();

		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'));
			die();
		}

		$this->setTitle('Program ' . $this->config_semevar('site_suffix', ''));

		$this->putThemeContent("program/home_modal", $data);
		$this->putThemeContent("program/home", $data);
		$this->putJsContent("program/home_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}

	public function detail($slug)
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'));
			die();
		}

		$apm = $this->apm->getBySlug($slug);
		if (!isset($apm->id)) {
			redir(base_url(''));
			die();
		}

		$this->setTitle($apm->nama . ' ' . $this->config_semevar('site_suffix', ''));



		$permissions = $this->bumm->getAllPermission($apm->id,  $data['sess']->user->a_jabatan_id, $data['sess']->user->id);

		$data['apm'] = $apm;
		unset($apm);

		$data['permissions'] = $permissions;
		unset($permissions);

		$this->putThemeContent("program/detail", $data);
		$this->putJsContent("program/detail_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
}
