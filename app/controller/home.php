<?php
class Home extends JI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->setTheme('front');
		$this->current_parent = 'dashboard';
		$this->current_page = 'dashboard';

		$this->load('a_jpenilaian_concern');

		$this->load('front/a_jpenilaian_model', 'ajm');
	}

	public function index()
	{
		$data = $this->__init();
		if (!$this->user_login) {
			redir(base_url('login'), 0);
			die();
		}
		$this->setTitle('Dashboard ' . $this->config->semevar->site_suffix);


		$ajm = $this->ajm->getAll();
		if (isset($ajm[0]->id)) $data['ajm'] = $ajm;

		$data['ajm'] = $ajm;
		unset($ajm);

		$this->putThemeContent("home/home", $data);
		$this->putJsContent("home/home_bottom", $data);
		$this->loadLayout('col-1-bar', $data);
		$this->render();
	}
}
