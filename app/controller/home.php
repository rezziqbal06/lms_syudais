<?php
class Home extends JI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->setTheme('front');
		$this->current_parent = 'dashboard';
		$this->current_page = 'dashboard';
	}

	public function index()
	{
		$data = $this->__init();
		// if (!$this->user_login) {
		// 	redir(base_url('login'), 0);
		// 	die();
		// }
		$this->setTitle('Dashboard ' . $this->config->semevar->site_suffix);

		//$this->putJsFooter($this->cdn_url('skin/admin/').'js/helpers/gmaps.min',0);
		$this->putJsFooter($this->cdn_url('skin/admin/') . 'js/pages/index');

		$this->putThemeContent("home/home", $data);
		$this->putJsContent("home/home_bottom", $data);
		$this->loadLayout('col-1', $data);
		$this->render();
	}
}
