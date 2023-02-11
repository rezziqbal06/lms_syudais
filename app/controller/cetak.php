<?php



class Cetak extends JI_Controller
{
	var $media_pengguna = 'media/';

	public function __construct()
	{
		parent::__construct();
		$this->setTheme('front');
		$this->current_parent = 'print';
		$this->current_page = 'print';
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

		$this->lib('seme_dompdf', 'dompdf');
		$this->lib('seme_spreadsheet', 'ss');
	}

	public function index()
	{
		$data = $this->__init();

		echo 'Page for printing';
		die();
	}

	public function hh()
	{
		$html = $_SESSION['content'];
		$_SESSION['content'] = null;
		$data = $this->dompdf->download([
			'filename' => 'Hygiene.pdf',
			'html' => $html,
			'ukuran' => 'F4',
			'rotasi' => 'Potrait'
		]);

		if (isset($data['status']) && $data['status'] != 200) {
			echo $data['message'];
		}
	}

	public function monev()
	{
		$content = $_SESSION['content'];
		// $_SESSION['content'] = null;
		$ajm = $content['data']['ajm'];
		$aim = $content['data']['aim'];
		$list = $content['data']['list'];
		dd($list);

		$ssheet = $this->ss->newSpreadSheet();
		$ssheet->setActiveSheetIndex(0);
		$sheet = $ssheet->getActiveSheet();
		$sheet->setTitle("MONITORING KEGIATAN HARIAN PENCEGAHAN PENGENDALIAN INFEKSI DI RUMAH SAKIT UMUM BINA SEHAT");

		$rowIdx = 1;
		$colIdx = 0;
	}
}
