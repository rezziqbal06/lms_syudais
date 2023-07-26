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


		$icons = [
			'ni ni-active-40',
			'ni ni-air-baloon',
			'ni ni-album-2',
			'ni ni-align-center',
			'ni ni-align-left-2',
			'ni ni-ambulance',
			'ni ni-app',
			'ni ni-archive-2',
			'ni ni-atom',
			'ni ni-badge',
			'ni ni-bag-17',
			'ni ni-basket',
			'ni ni-bell-55',
			'ni ni-bold-down',
			'ni ni-bold-left',
			'ni ni-bold-right',
			'ni ni-bold-up',
			'ni ni-bold',
			'ni ni-book-bookmark',
			'ni ni-books',
			'ni ni-box-2',
			'ni ni-briefcase-24',
			'ni ni-building',
			'ni ni-bulb-61',
			'ni ni-bullet-list-67',
			'ni ni-bus-front-12',
			'ni ni-button-pause',
			'ni ni-button-play',
			'ni ni-button-power',
			'ni ni-calendar-grid-58',
			'ni ni-camera-compact',
			'ni ni-caps-small',
			'ni ni-cart',
			'ni ni-chart-bar-32',
			'ni ni-chart-pie-35',
			'ni ni-chat-round',
			'ni ni-check-bold',
			'ni ni-circle-08',
			'ni ni-cloud-download-95',
			'ni ni-cloud-upload-96',
			'ni ni-compass-04',
			'ni ni-controller',
			'ni ni-credit-card',
			'ni ni-curved-next',
			'ni ni-delivery-fast',
			'ni ni-diamond',
			'ni ni-email-83',
			'ni ni-fat-add',
			'ni ni-fat-delete',
			'ni ni-fat-remove',
			'ni ni-favourite-28',
			'ni ni-folder-17',
			'ni ni-glasses-2',
			'ni ni-hat-3',
			'ni ni-headphones',
			'ni ni-html5',
			'ni ni-istanbul',
			'ni ni-key-25',
			'ni ni-laptop',
			'ni ni-like-2',
			'ni ni-lock-circle-open',
			'ni ni-map-big',
			'ni ni-mobile-button',
			'ni ni-money-coins',
			'ni ni-note-03',
			'ni ni-notification-70',
			'ni ni-palette',
			'ni ni-paper-diploma',
			'ni ni-pin-3',
			'ni ni-planet',
			'ni ni-ruler-pencil',
			'ni ni-satisfied',
			'ni ni-scissors',
			'ni ni-send',
			'ni ni-settings-gear-65',
			'ni ni-settings',
			'ni ni-single-02',
			'ni ni-single-copy-04',
			'ni ni-sound-wave',
			'ni ni-spaceship',
			'ni ni-square-pin',
			'ni ni-support-16',
			'ni ni-tablet-button',
			'ni ni-tag',
			'ni ni-tie-bow',
			'ni ni-time-alarm',
			'ni ni-trophy',
			'ni ni-tv-2',
			'ni ni-umbrella-13',
			'ni ni-user-run',
			'ni ni-vector',
			'ni ni-watch-time',
			'ni ni-world',
			'ni ni-zoom-split-in',
			'ni ni-collection',
			'ni ni-image',
			'ni ni-shop',
			'ni ni-ungroup',
			'ni ni-world-2',
			'ni ni-ui-04'
		];

		$data['icons'] = $icons;


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
