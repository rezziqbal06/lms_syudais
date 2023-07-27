<?php
class Home extends JI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->setTheme('front');
		$this->current_parent = 'dashboard';
		$this->current_page = 'dashboard';

		$this->load('a_ruangan_concern');
		$this->load('a_program_concern');
		$this->load('b_user_concern');

		// $this->load('front/a_program_model', 'apm');
		// $this->load('front/a_ruangan_model', 'arm');
		$this->load('front/b_user_model', 'bum');
	}

	public function index()
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'), 0);
			die();
		}
		$this->setTitle('Dashboard ' . $this->config->semevar->site_suffix);

		// $apm = $this->apm->getAll();
		// if (isset($apm[0]->id)) $data['apm'] = $apm;

		// $data['apm'] = $apm;
		// unset($apm);

		$bum = $this->bum->getAll();
		if (isset($bum[0]->id)) $data['bum'] = $bum;

		$data['bum'] = $bum;
		unset($bum);


		// $arm = $this->arm->getAll();
		// if (isset($arm[0]->id)) $data['arm'] = $arm;

		// $data['arm'] = $arm;
		// unset($arm);

		$data['jp'] = $this->input->request('jp', 2);

		$this->putThemeContent("home/home", $data);
		$this->putJsContent("home/home_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}

	public function edit()
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url_admin('login'), 0);
			die();
		}
		$this->current_parent = '';
		$this->current_page = 'edit';

		$this->setTitle('Edit Profil ' . $this->config->semevar->site_suffix);

		$this->putJsFooter($this->cdn_url('skin/admin/') . 'js/pages/index');

		$this->putThemeContent("akun/user/edit", $data);
		$this->putJsContent("akun/user/edit_bottom", $data);
		$this->loadLayout('col-2-left', $data);
		$this->render();
	}
}
