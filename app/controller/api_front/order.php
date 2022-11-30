<?php
//loading library
$vendorDirPath = (SEMEROOT . 'kero/lib/phpoffice/vendor/');
$vendorDirPath = realpath($vendorDirPath);
require_once $vendorDirPath . '/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

class Order extends JI_Controller
{
	var $media_pengguna = 'media/pengguna';

	public function __construct()
	{
		parent::__construct();
		$this->load("a_branch_concern");
		$this->load("a_company_concern");
		$this->load("a_destination_concern");
		$this->load("a_origin_concern");
		$this->load("b_user_concern");
		$this->load("b_user_alamat_concern");
		$this->load("c_order_concern");
		$this->load("api_front/a_branch_model", 'abm');
		$this->load("api_front/a_origin_model", 'aom');
		$this->load("api_front/a_company_model", 'acm');
		$this->load("api_front/a_destination_model", 'adm');
		$this->load("api_front/b_user_model", 'bum');
		$this->load("api_front/b_user_alamat_model", 'buam');
		$this->load("api_front/c_order_model", 'com');
		$this->load("api_front/d_barang_model", 'dbm');
		$this->lib("jne");
		$this->lib("seme_upload", 'su');
	}

	/**
	 * Give json data set result on datatable format
	 *
	 * @api
	 *
	 * @return void
	 */
	public function index()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$this->status = 200;
		$this->message = API_ADMIN_ERROR_CODES[$this->status];

		/** advanced filter is_active */
		$is_active = $this->input->request('is_active', '');
		if (strlen($is_active)) {
			$is_active = intval($is_active);
		}

		$sdate = $this->input->request('sdate', '');
		$edate = $this->input->request('edate', '');
		$service = $this->input->request('service', '');

		$b_user_id = $d['sess']->user->id;

		$datatable = $this->com->datatable()->initialize();
		$dcount = $this->com->count($b_user_id, $datatable->keyword(), $is_active, $sdate, $edate, $service);
		$ddata = $this->com->data(
			$b_user_id,
			$datatable->page(),
			$datatable->pagesize(),
			$datatable->sort_column(),
			$datatable->sort_direction(),
			$datatable->keyword(),
			$is_active,
			$sdate,
			$edate,
			$service
		);
		$key = 'stats';
		$another['stats'] = [];

		$in_shipper = [''];
		$in_sorting = ['CR5', 'OP1', 'OP2'];
		$in_shipping = ['OP3', 'TP1', 'TP2', 'TP3', 'TP4', 'TP5', 'IP1', 'IP2', 'IP3', 'OP3', 'BI1', 'BI2', 'BI3', 'OP4', ''];
		$pickup_process = ['PU0', 'RC1', 'RC2', 'PU1', 'PU2', 'S01', 'F01', 'F02', 'F03', 'F04', 'F05', 'F06'];
		$in_warehouse = ['WH1', 'WH2', 'WH3', 'WH4', 'WH5'];
		$delivered = ['DB1', 'DB2', 'D01', 'D02', 'D03', 'D04', 'D05', 'D06', 'D07', 'D08', 'D09', 'D10', 'D11', 'D12', 'R24', 'R25', 'R26'];
		$return = ['CR1', 'R01', 'R02', 'R03', 'R04', 'R05', 'R06', 'R07', 'R08', 'R09', 'R10', 'R11', 'R12', 'CR7'];
		$undelivered = ['CR2', 'CR4', 'U01', 'U02', 'U03', 'U04', 'U05', 'U06', 'U07', 'U08', 'U09', 'U10', 'U11', 'U12', 'U13', 'U14', 'U21', 'U22', 'U23', 'U24', 'U25', 'UB1', 'UB2', 'KRK', 'KRP', 'KRT', 'FOM'];
		$cancel = ['F05'];
		foreach ($ddata as &$gd) {
			if (isset($gd->is_active)) {
				$gd->is_active = $this->com->label('is_active', $gd->is_active);
			}

			if (isset($gd->service)) {
				$type = 'info';
				if (stripos($gd->service, 'OKE') !== false) {
					$type = 'info';
				} else if (stripos($gd->service, 'REG') !== false) {
					$type = 'warning';
				} else if (stripos($gd->service, 'YES') !== false) {
					$type = 'success';
				} else if (stripos($gd->service, 'JTR') !== false) {
					$type = 'danger';
				}
				$gd->service = '<span class="pill pill-' . $type . '">' . $gd->service . '</span>';
			}
			if (isset($gd->cdate)) {
				$gd->cdate = $this->__dateIndonesia($gd->cdate);
			}

			if (isset($gd->no_resi) && strlen($gd->no_resi)) {
				$gd->no_resi = '<a href="#" class="detail_resi pill pill-warning">' . $gd->no_resi . '</a>';
			}

			if (isset($gd->no_tiket) && strlen($gd->no_tiket)) {
				$gd->no_tiket = '<a href="#" class="detail_tiket pill pill-info">' . $gd->no_tiket . '</a>';
			}




			if (!isset($another[$key]['all'])) $another[$key]['all'] = 0;
			$another[$key]['all']++;

			if (in_array($gd->kode_tracking, $in_shipper)) {
				if (!isset($another[$key]['in_shipper'])) $another[$key]['in_shipper'] = 0;
				$another[$key]['in_shipper']++;
			} elseif (in_array($gd->kode_tracking, $in_sorting)) {
				if (!isset($another[$key]['in_sorting'])) $another[$key]['in_sorting'] = 0;
				$another[$key]['in_sorting']++;
			} elseif (in_array($gd->kode_tracking, $in_shipping)) {
				if (!isset($another[$key]['in_shipping'])) $another[$key]['in_shipping'] = 0;
				$another[$key]['in_shipping']++;
			} elseif (in_array($gd->kode_tracking, $in_warehouse)) {
				if (!isset($another[$key]['in_warehouse'])) $another[$key]['in_warehouse'] = 0;
				$another[$key]['in_warehouse']++;
			} elseif (in_array($gd->kode_tracking, $delivered)) {
				if (!isset($another[$key]['delivered'])) $another[$key]['delivered'] = 0;
				$another[$key]['delivered']++;
			} elseif (in_array($gd->kode_tracking, $return)) {
				if (!isset($another[$key]['return'])) $another[$key]['return'] = 0;
				$another[$key]['return']++;
			} elseif (in_array($gd->kode_tracking, $undelivered)) {
				if (!isset($another[$key]['undelivered'])) $another[$key]['undelivered'] = 0;
				$another[$key]['undelivered']++;
			} elseif (in_array($gd->kode_tracking, $pickup_process)) {
				if (!isset($another[$key]['pickup_process'])) $another[$key]['pickup_process'] = 0;
				$another[$key]['pickup_process']++;
			} elseif (in_array($gd->kode_tracking, $cancel)) {
				if (!isset($another[$key]['cancel'])) $another[$key]['cancel'] = 0;
				$another[$key]['cancel']++;
			}
		}

		$this->__jsonDataTable($ddata, $dcount, $another);
	}

	public function cek_tarif()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$request = $_POST;
		if (!isset($request['SHIPPER_CITY']) || !isset($request['RECEIVER_CITY']) || !isset($request['weight'])) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$from = $request['SHIPPER_CITY'];
		$thru = $request['RECEIVER_CITY'];
		$weight = $request['weight'];
		$res = $this->jne->calculate_tarif($from, $thru, $weight);
		if ($res['status'] == 200) {
			$body = json_decode($res['data']);
			if (isset($body->price)) {
				$data['destinasi_code'] = "$from => $thru";
				foreach ($body->price as $k => $v) {
					if (isset($v->service_code) && $v->service_code == $request['SERVICE_CODE']) {
						$data['ongkir'] = $v->price;
					}
				}
				if (!isset($data['ongkir'])) {
					$this->message = "Ongkir tidak ditemukan";
					$this->status = 402;
					$this->__json_out($data);
					die();
				}
			} else {
				$this->message = "Tarif gagal dihitung";
				$this->status = 402;
				$this->__json_out($data);
				die();
			}
			$this->status = $res['status'];
			$this->message = $res['message'];
		} else {
			$this->status = $res['status'];
			$this->message = $res['message'];
		}

		$this->__json_out($data);
	}
	public function tambah()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$di = $_POST;
		if (!isset($di['is_drop_shipper'])) $di['is_drop_shipper'] = 0;
		if (!isset($di['is_packing_kayu'])) $di['is_packing_kayu'] = 0;
		if (!isset($di['is_asuransi'])) $di['is_asuransi'] = 0;

		if (
			!isset($di['nama_registrasi']) ||
			!isset($di['telp_registrasi']) ||
			!isset($di['nama_penerima']) ||
			!isset($di['telp_penerima'])
		) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		if (!isset($di['b_user_id'])) {
			$pengirim = $this->bum->getByNameAndTelp(strtolower($di['nama_registrasi']), $di['telp_registrasi']);
			if (!isset($pengirim->id)) {
				$this->status = 522;
				$this->message = 'Data pengirim tidak ditemukan atau sudah dihapus';
				$this->__json_out($data);
				die();
			}
		}

		// $company = $this->acm->id($pengirim->a_company_id);
		// if (!isset($company->id)) {
		//  $this->status = 522;
		//  $this->message = API_ADMIN_ERROR_CODES[$this->status];
		//  $this->__json_out($data);
		//  die();
		// }

		// Create OLSHOP_ORDERID
		$acronim = '';
		foreach (explode(' ', $di['nama_registrasi']) as $nm) {
			$acronim .= $nm[0];
		}
		$lastId = $this->com->getLastId();
		$kode_order = strtoupper($acronim) . date('dmY') . $lastId;

		// Cek apakah penerima sudah masuk db
		$penerima = $this->bum->getByNameAndTelp($di['nama_penerima'], $di['telp_penerima']);
		if (!isset($penerima->id)) {
			$dip = [];
			$dip['fnama'] = $di['nama_penerima'];
			$dip['telp'] = $di['telp_penerima'];
			$dip['utype'] = 'kustomer';
			$dip['b_user_id'] = $di['b_user_id'] ?? null;
			$di['b_user_id_penerima'] = $this->bum->set($dip);

			$origin = $this->aom->getByKabkota($di['kabkota']);
			$destination = $this->adm->getByCode($di['kode_destination']);
			$dipa = [];
			$dipa['b_user_id'] = $di['b_user_id_penerima'];
			$dipa['provinsi'] = $destination->provinsi;
			$dipa['kabkota'] = $destination->kabkota;
			$dipa['kecamatan'] = $destination->kecamatan;
			$dipa['kelurahan'] = $destination->kelurahan;
			$dipa['alamat'] = $di['alamat_penerima'];
			$dipa['kodepos'] = $destination->kodepos;
			$dipa['kode_destination'] = $destination->code;
			$dipa['kode_origin'] = $origin->code;
			$res_alamat_pengirim = $this->buam->set($dipa);
		} else {
			$di['b_user_penerima'] = $penerima->id;
		}

		$order = $this->com->getByKode($kode_order);
		if (!isset($order->id)) {
			$dio = [];
			$dio['b_user_id'] = $di['b_user_id'];
			$dio['cdate'] = "now()";
			$dio['b_user_id_penerima'] = $di['b_user_id_penerima'];
			$dio['telp'] = $di['telp_penerima'];
			$dio['kode'] = $kode_order;
			$dio['layanan'] = $di['layanan'];
			$dio['service'] = $di['service'];
			$dio['is_drop_shipper'] = $di['is_drop_shipper'];
			$dio['kode_branch'] = $di['kode_branch'];
			$dio['is_cod'] = $di['layanan'] == 'COD' ? 1 : 0;
			$dio['json_value'] = json_encode($di);
			$order_id = $this->com->set($dio);
		} else {
			$order_id = $order->id;
		}

		if ($order_id) {
			$fd = [];
			$fd['OLSHOP_BRANCH'] = $di['kode_branch'];
			$fd['OLSHOP_CUST'] = $di['nomor_akun'];
			$fd['OLSHOP_ORDERID'] = $kode_order;
			$fd['OLSHOP_SHIPPER_NAME'] = $di['nama_registrasi'];
			$fd['OLSHOP_SHIPPER_ADDR1'] = $di['alamat_registrasi'];
			$fd['OLSHOP_SHIPPER_ADDR2'] = '';
			$fd['OLSHOP_SHIPPER_CITY'] = $di['kabkota_registrasi'];
			$fd['OLSHOP_SHIPPER_ZIP'] = $di['kodepos_registrasi'];
			$fd['OLSHOP_SHIPPER_PHONE'] = $di['telp_registrasi'];
			$fd['OLSHOP_RECEIVER_NAME'] = $di['nama_penerima'];
			$fd['OLSHOP_RECEIVER_ADDR1'] = $di['alamat_penerima'];
			$fd['OLSHOP_RECEIVER_ADDR2'] = '';
			$fd['OLSHOP_RECEIVER_CITY'] = $di['kabkota'];
			$fd['OLSHOP_RECEIVER_ZIP'] = $di['kodepos'];
			$fd['OLSHOP_RECEIVER_PHONE'] = $di['telp_penerima'];
			$fd['OLSHOP_QTY'] = $di['jumlah_packing'];
			$fd['OLSHOP_WEIGHT'] = $di['berat'];
			$fd['OLSHOP_GOODSDESC'] = $di['deskripsi_barang'];
			$fd['OLSHOP_GOODSTYPE'] = 2;
			$fd['OLSHOP_INS_FLAG'] = $di['is_asuransi'] ? 'Y' : 'N';
			$fd['OLSHOP_ORIG'] = $di['kode_origin'];
			$fd['OLSHOP_DEST'] = $di['kode_destination'];
			$fd['OLSHOP_SERVICE'] = $di['service'];
			$fd['OLSHOP_COD_FLAG'] = $di['layanan'] == 'COD' ? 'YES' : 'N';
			$fd['OLSHOP_COD_AMOUNT'] = isset($di['harga_cod']) ? (int) $di['harga_cod'] : 0;
			$fd['OLSHOP_GOODSVALUE'] = isset($di['harga_barang']) ? (int) $di['harga_barang'] : 0;
			$res = $this->jne->create_airwaybill($fd);
			if ($res['status'] == 200) {
				$body = json_decode($res['data']);
				//
				if (isset($body->detail)) {
					$detail = $body->detail[0];
					if (strtolower($detail->status) == "sukses") {
						$this->status = 200;
						$this->message = "Berhasil";
						$du = array();
						$du['layanan'] = $di['service'];
						$du['no_resi'] = $detail->cnote_no;

						$res2 = $this->com->update($order_id, $du);
					} else {
						$this->status = 901;
						$this->message = $detail->reason;
					}
				} else {
					$this->status = 900;
					$this->message = 'Tidak dapat membuat no resi, silakan coba beberapa saat lagi';
				}
			} else {
				$this->status = $res['status'];
				$this->message = $res['message'];
			}
		}
		$this->__json_out($data);
	}

	private function __create_order($di)
	{
		$data = [];
		if (!isset($di['is_drop_shipper'])) $di['is_drop_shipper'] = 0;
		if (!isset($di['is_packing_kayu'])) $di['is_packing_kayu'] = 'N';
		if (!isset($di['is_asuransi'])) $di['is_asuransi'] = 'N';

		if (
			!isset($di['nama_registrasi']) ||
			!isset($di['telp_registrasi']) ||
			!isset($di['nama_penerima']) ||
			!isset($di['telp_penerima'])
		) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$pengirim = $this->bum->id($di['b_user_id']);
		$pengirim = $this->bum->getByNameAndTelp($di['nama_registrasi'], $di['telp_registrasi']);
		if (!isset($pengirim->id)) {
			$this->status = 522;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		// $company = $this->acm->id($pengirim->a_company_id);
		// if (!isset($company->id)) {
		//  $this->status = 522;
		//  $this->message = API_ADMIN_ERROR_CODES[$this->status];
		//  $this->__json_out($data);
		//  die();
		// }

		// Create OLSHOP_ORDERID
		// $acronim = '';
		// foreach (explode(' ', $di['nama_registrasi']) as $nm) {
		//  $acronim .= $nm[0];
		// }
		// $lastId = $this->com->getLastId();
		// $kode_order = strtoupper($acronim) . date('dmY') . $lastId;

		// Cek apakah penerima sudah masuk db
		$penerima = $this->bum->getByNameAndTelp($di['nama_penerima'], $di['telp_penerima']);
		if (!isset($penerima->id)) {
			$dip = [];
			$dip['fnama'] = $di['nama_penerima'];
			$dip['telp'] = $di['telp_penerima'];
			$dip['utype'] = 'kustomer';
			$dip['b_user_id'] = $di['b_user_id'] ?? null;
			$di['b_user_id_penerima'] = $this->bum->set($dip);

			$origin = $this->aom->getByKabkota($di['kabkota']);
			$destination = $this->adm->getByCode($di['kode_destination']);
			$dipa = [];
			$dipa['b_user_id'] = $di['b_user_id_penerima'];
			$dipa['provinsi'] = $destination->provinsi;
			$dipa['kabkota'] = $destination->kabkota;
			$dipa['kecamatan'] = $destination->kecamatan;
			$dipa['kelurahan'] = $destination->kelurahan;
			$dipa['alamat'] = $di['alamat_penerima'];
			$dipa['kodepos'] = $destination->kodepos;
			$dipa['kode_destination'] = $destination->code;
			$dipa['kode_origin'] = $origin->code;
			$res_alamat_pengirim = $this->buam->set($dipa);
		} else {
			$di['b_user_penerima'] = $penerima->id;
		}

		$order = $this->com->getByKode($di['kode_order']);
		if (!isset($order->id)) {
			$dio = [];
			$dio['b_user_id'] = $di['b_user_id'];
			$dio['b_user_id_penerima'] = $di['b_user_id_penerima'];
			$dio['telp'] = $di['telp_penerima'];
			$dio['kode'] = $di['kode_order'];
			$dio['layanan'] = $di['layanan'];
			$dio['service'] = $di['service'];
			$dio['is_drop_shipper'] = $di['is_drop_shipper'];
			$dio['json_value'] = json_encode($di);
			$order_id = $this->com->set($dio);
		} else {
			$order_id = $order->id;
		}

		if ($order_id) {
			$fd = [];
			$fd['OLSHOP_BRANCH'] = $di['kode_destination'];
			$fd['OLSHOP_CUST'] = $di['nomor_akun'];
			$fd['OLSHOP_ORDERID'] = $di['kode_order'];
			$fd['OLSHOP_SHIPPER_NAME'] = $di['nama_registrasi'];
			$fd['OLSHOP_SHIPPER_ADDR1'] = $di['alamat_registrasi'];
			$fd['OLSHOP_SHIPPER_ADDR2'] = '';
			$fd['OLSHOP_SHIPPER_CITY'] = $di['kabkota_registrasi'];
			$fd['OLSHOP_SHIPPER_ZIP'] = $di['kodepos_registrasi'];
			$fd['OLSHOP_SHIPPER_PHONE'] = $di['telp_registrasi'];
			$fd['OLSHOP_RECEIVER_NAME'] = $di['nama_penerima'];
			$fd['OLSHOP_RECEIVER_ADDR1'] = $di['alamat_penerima'];
			$fd['OLSHOP_RECEIVER_ADDR2'] = '';
			$fd['OLSHOP_RECEIVER_CITY'] = $di['kabkota'];
			$fd['OLSHOP_RECEIVER_ZIP'] = $di['kodepos'];
			$fd['OLSHOP_RECEIVER_PHONE'] = $di['telp_penerima'];
			$fd['OLSHOP_QTY'] = $di['jumlah_packing'];
			$fd['OLSHOP_WEIGHT'] = $di['berat'];
			$fd['OLSHOP_GOODSDESC'] = $di['deskripsi_barang'];
			$fd['OLSHOP_GOODSTYPE'] = 2;
			$fd['OLSHOP_INS_FLAG'] = $di['is_asuransi'];
			$fd['OLSHOP_ORIG'] = $di['kode_origin'];
			$fd['OLSHOP_DEST'] = $di['kode_destination'];
			$fd['OLSHOP_SERVICE'] = $di['service'];
			if (isset($di['layanan'])) {
				$fd['OLSHOP_COD_FLAG'] = $di['layanan'] == 'COD' ? 'Y' : 'N';
			} else {
				$fd['OLSHOP_COD_FLAG'] = $di['is_cod'];
			}
			$fd['OLSHOP_COD_AMOUNT'] = isset($di['harga_cod']) ? (int) $di['harga_cod'] : 0;
			$fd['OLSHOP_GOODSVALUE'] = isset($di['harga_barang']) ? (int) $di['harga_barang'] : 0;
			$res = $this->jne->create_airwaybill($fd);
			if ($res['status'] == 200) {
				$body = json_decode($res['data']);
				//
				if (isset($body->detail)) {
					$detail = $body->detail[0];
					if (strtolower($detail->status) == "sukses") {
						$this->status = 200;
						$this->message = "Berhasil";
						$du = array();
						$du['layanan'] = $di['service'];
						$du['no_resi'] = $detail->cnote_no;

						$res2 = $this->com->update($order_id, $du);
					} else {
						$this->status = 901;
						$this->message = $detail->reason;
					}
				} else {
					$this->status = 900;
					$this->message = 'Tidak dapat membuat no resi, silakan coba beberapa saat lagi';
				}
			} else {
				$this->status = $res['status'];
				$this->message = $res['message'];
			}
		}
	}

	private function __booking($d, $di)
	{
		$data = [];
		$data['status'] = 200;
		$data['message'] = 'Berhasil';

		if (!isset($di['is_drop_shipper'])) $di['is_drop_shipper'] = 0;
		if (!isset($di['is_packing_kayu'])) $di['is_packing_kayu'] = 'N';
		if (!isset($di['is_asuransi'])) $di['is_asuransi'] = 'N';

		if (
			!isset($di['nama_registrasi']) ||
			!isset($di['telp_registrasi']) ||
			!isset($di['nama_penerima']) ||
			!isset($di['telp_penerima'])
		) {
			$data['status'] = 444;
			$data['message'] = API_ADMIN_ERROR_CODES[$data['status']];
			return $data;
		}


		if (
			!isset($di['alamat_registrasi']) ||
			!isset($di['alamat_penerima'])
		) {
			$data['status'] = 444;
			$data['message'] = API_ADMIN_ERROR_CODES[$this->status];
			return $data;
		}

		$alamat_registrasi = $di['alamat_registrasi'];
		$di['alamat_registrasi'] = substr($alamat_registrasi, 0, 30);
		$di['alamat_registrasi2'] = substr($alamat_registrasi, 30, 30);
		$di['alamat_registrasi3'] = substr($alamat_registrasi, 60, 30);

		$alamat_penerima = $di['alamat_penerima'];
		$di['alamat_penerima'] = substr($alamat_penerima, 0, 30);
		$di['alamat_penerima2'] = substr($alamat_penerima, 30, 30);
		$di['alamat_penerima3'] = substr($alamat_penerima, 60, 30);

		$pengirim_origin = $this->aom->getByKabkota($di['kabkota_registrasi']);
		$pengirim_destination = $this->adm->getByKabkota($di['kabkota_registrasi']);
		$penerima_origin = $this->aom->getByKabkota($di['kabkota']);
		$penerima_destination = $this->adm->getByKabkota($di['kabkota']);
		$branch = $this->abm->getByKabkota($di['kabkota_registrasi']);

		if (!isset($penerima_origin->code) || !isset($penerima_destination->code) || !isset($branch->code)) {
			$data['status'] = 444;
			$data['message'] = 'Tidak ada origin/destination/branch penerima';
			return $data;
		}

		if (!isset($di['service'])) {
			$data['status'] = 444;
			$data['message'] = 'Tidak ada service';
			return $data;
		}

		if (
			$di['service'] != "OKE19" &&
			$di['service'] != "REG19" &&
			$di['service'] != "YES19"
		) {
			if (stripos($di['service'], 'REG') !== false) {
				$di['service'] = "REG19";
			} else if (stripos($di['service'], 'OKE') !== false) {
				$di['service'] = "OKE19";
			} else if (stripos($di['service'], 'YES') !== false) {
				$di['service'] = "YES19";
			}
		}

		//Cari Ongkir
		$from = $pengirim_origin->code;
		$thru = $penerima_destination->code;
		$weight = $di['berat'];
		$statusOngkir = 402;
		$try = 0;
		while (!in_array($statusOngkir, [200, 403]) && $try < 3) {
			$resOngkir = $this->jne->calculate_tarif($from, $thru, $weight);
			if ($resOngkir['status'] == 200) {
				$body = json_decode($resOngkir['data']);
				if (isset($body->price)) {
					$data['destinasi_code'] = "$from => $thru";
					foreach ($body->price as $k => $v) {
						if (isset($v->service_code) && $v->service_code == $di['service']) {
							$ongkir = $v->price;
						}
					}
					if (!isset($ongkir)) {
						$data['message'] = "Ongkir tidak ditemukan";
						$data['status'] = 403;
						// return $data;
					}
				} else {
					$data['message'] = "Tarif gagal dihitung";
					$data['status'] = 402;
					// return $data;
				}
			} else {
				$data['status'] = $resOngkir['status'];
				$data['message'] = 'Gagal cari ongkir';
				// return $data;
			}
			$statusOngkir = $data['status'];
			$try++;
		}

		if ($statusOngkir != 200) {
			return $data;
		}

		$di['ongkir'] = $ongkir ?? '0';

		$pengirim = $this->bum->getByNameAndTelp($di['nama_registrasi'], $di['telp_registrasi']);
		if (!isset($pengirim->id)) {
			$dip = [];
			$dip['fnama'] = $di['nama_registrasi'];
			$dip['telp'] = $di['telp_registrasi'];
			$dip['utype'] = 'kustomer';
			$dip['b_user_id'] = $d['sess']->user->login ?? $d['sess']->reseller->login ?? null;
			$di['b_user_id'] = $this->bum->set($dip);

			$dipa = [];
			$dipa['b_user_id'] = $di['b_user_id'];
			$dipa['provinsi'] = $pengirim_destination->provinsi;
			$dipa['kabkota'] = $pengirim_destination->kabkota;
			$dipa['kecamatan'] = $pengirim_destination->kecamatan;
			$dipa['kelurahan'] = $pengirim_destination->kelurahan;
			$dipa['alamat'] = $di['alamat_registrasi'];
			$dipa['alamat2'] = $di['alamat_registrasi2'] ?? "";
			$dipa['kodepos'] = ['kodepos_registrasi'];
			$dipa['kode_destination'] = $pengirim_destination->code;
			$dipa['kode_origin'] = $pengirim_origin->code;
			$res_alamat_pengirim = $this->buam->set($dipa);
		} else {
			$di['b_user_id'] = $pengirim->id;
		}

		// Cek apakah penerima sudah masuk db
		$penerima = $this->bum->getByNameAndTelp($di['nama_penerima'], $di['telp_penerima']);
		if (!isset($penerima->id)) {
			$dip = [];
			$dip['fnama'] = $di['nama_penerima'];
			$dip['telp'] = $di['telp_penerima'];
			$dip['utype'] = 'kustomer';
			$dip['b_user_id'] = $d['sess']->user->login ?? $d['sess']->reseller->login ?? null;
			$di['b_user_id_penerima'] = $this->bum->set($dip);


			$dipa = [];
			$dipa['b_user_id'] = $di['b_user_id_penerima'];
			$dipa['provinsi'] = $penerima_destination->provinsi;
			$dipa['kabkota'] = $penerima_destination->kabkota;
			$dipa['kecamatan'] = $penerima_destination->kecamatan;
			$dipa['kelurahan'] = $penerima_destination->kelurahan;
			$dipa['alamat'] = $di['alamat_penerima'];
			$dipa['alamat2'] = $di['alamat_penerima2'] ?? "";
			$dipa['kodepos'] = $di['kodepos'];
			$dipa['kode_destination'] = $penerima_destination->code;
			$dipa['kode_origin'] = $penerima_origin->code;
			$res_alamat_pengirim = $this->buam->set($dipa);
		} else {
			$di['b_user_id_penerima'] = $penerima->id;
		}

		$order = $this->com->getByBookingKode($di['kode_booking']);
		if (isset($order->id)) {
			$data['status'] = 502;
			$data['message'] = 'Kode Booking sudah ada';
			return $data;
		}
		$dio = [];
		$dio['b_user_id'] = $di['b_user_id'];
		$dio['b_user_id_penerima'] = $di['b_user_id_penerima'];
		$dio['telp'] = $di['telp_penerima'];
		$dio['service'] = $di['service'];
		$dio['cdate'] = 'now()';
		$dio['is_drop_shipper'] = $di['is_drop_shipper'];
		$dio['is_cod'] = $di['is_cod'] == 'Y' || $di['is_cod'] == 'YES' ? 1 : 0;
		$dio['harga_cod'] = $di['harga_cod'] ?? 0;
		$dio['harga_paket'] = $di['harga_barang'] ?? 0;
		$dio['json_value'] = json_encode($di);
		$order_id = $this->com->set($dio);

		if ($order_id) {
			$fd = [];
			$fd['SHIPPER_NAME'] = $di['nama_registrasi'];
			$fd['SHIPPER_ADDR1'] = $di['alamat_registrasi'];
			$fd['SHIPPER_ADDR2'] = $di['alamat_registrasi2'] ?? "";
			$fd['SHIPPER_ADDR3'] = $di['alamat_registrasi3'] ?? "";
			$fd['SHIPPER_CITY'] = $di['kabkota_registrasi'];
			$fd['SHIPPER_ZIP'] = $di['kodepos_registrasi'];
			$fd['SHIPPER_REGION'] = $di['provinsi_registrasi'];
			$fd['SHIPPER_COUNTRY'] = 'ID';
			$fd['SHIPPER_CONTACT'] = $di['kontak_registrasi'];
			$fd['SHIPPER_PHONE'] = $di['telp_registrasi'];
			$fd['RECEIVER_NAME'] = $di['nama_penerima'];
			$fd['RECEIVER_ADDR1'] = $di['alamat_penerima'];
			$fd['RECEIVER_ADDR2'] = $di['alamat_penerima2'] ?? "";
			$fd['RECEIVER_ADDR3'] = $di['alamat_penerima3'] ?? "";
			$fd['RECEIVER_ZIP'] = $di['kodepos'];
			$fd['RECEIVER_CITY'] = $di['kabkota'];
			$fd['RECEIVER_REGION'] = $di['provinsi'];
			$fd['RECEIVER_COUNTRY'] = 'ID';
			$fd['RECEIVER_CONTACT'] = $di['kontak_penerima'];
			$fd['RECEIVER_PHONE'] = $di['telp_penerima'];
			$fd['ORIGIN_CODE'] = $pengirim_origin->code;
			$fd['ORIGIN_DESC'] = $di['kabkota_registrasi'];
			$fd['DESTINATION_CODE'] = $penerima_destination->code;
			$fd['DESTINATION_DESC'] = $di['kabkota'];
			$fd['SERVICE_CODE'] = $di['service'];
			$fd['WEIGHT'] = floatval($di['berat']);
			$fd['QTY'] = floatval($di['jumlah_packing']);
			$fd['GOODS_DESC'] = $di['deskripsi_barang'];
			$fd['GOODS_AMOUNT'] = isset($di['harga_barang']) ? (int) $di['harga_barang'] : 0;
			$fd['INSURANCE_FLAG'] = $di['is_asuransi'] == 'Y' ? 1 : '';
			$fd['INSURANCE_AMOUNT'] = !empty($di['harga_asuransi']) ? (int) $di['harga_asuransi'] : "";
			$fd['DELIVERY_PRICE'] = $ongkir;
			$fd['BOOK_CODE'] = $di['kode_booking'];
			$fd['AWB_TYPE'] = 'FREE';
			$fd['CUST_ID'] = $di['nomor_akun'];
			$fd['BRANCH'] = $branch->code;
			$fd['COD_FLAG'] = $di['is_cod'] == 'Y' ? 'YES' : 'NO';
			$fd['COD_AMOUNT'] = (int) $di['harga_cod'];
			$fd['SPECIAL_INS'] = $di['instruksi_khusus'];
			foreach ($fd as $k => $v) {
				$fd[$k] = ltrim($v, ' ');
			}

			$res = $this->jne->create_job($fd);
			if ($res['status'] == 200) {
				$body = json_decode($res['data']);

				if (isset($body->status)) {
					if (strtolower($body->status) == "sukses") {
						$data['status'] = 200;
						$data['message'] = "Berhasil";
						$du = array();
						if (isset($body->no_tiket)) {
							$du['layanan'] = $di['service'];
							$du['no_tiket'] = $body->no_tiket;
							$res2 = $this->com->update($order_id, $du);
						} else {
							if (isset($order_id)) $delete = $this->com->del($order_id);
							$data['status'] = 901;
							$data['message'] = 'Tidak ada no tiket';
						}
					} else {
						if (isset($order_id)) $delete = $this->com->del($order_id);
						$data['status'] = 901;
						$data['message'] = $body ?? 'Gagal, coba beberapa saat lagi';
					}
				} else {
					if (isset($order_id)) $delete = $this->com->del($order_id);
					$data['status'] = 900;
					$data['message'] = 'Tidak dapat membuat no resi, silakan coba beberapa saat lagi';
				}
			} else {
				if (isset($order_id)) $delete = $this->com->del($order_id);
				$data['status'] = 902;
				$data['message'] = 'Gagal Booking';
			}
		} else {
			$data['status'] = 900;
			$data['message'] = "Order gagal dibuat";
		}
		return $data;
	}

	public function tambah_multi()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$upload = $this->su->upload_file('paket');
		if ($upload->status != 200) {
			$this->status = $upload->status;
			$this->message = $this->message;
			$this->__json_out($data);
			die();
		}

		$Reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadSheet = $Reader->load($upload->file);
		$excelSheet = $spreadSheet->getActiveSheet();
		$spreadSheetAry = $excelSheet->toArray();
		unlink($upload->file);

		$keys = [
			//identitas penerima
			'nama_penerima',
			'alamat',
			'kabkota',
			'kodepos',
			'provinsi',
			'kontak_penerima',
			'telp_penerima',
			//data paket
			'jumlah_packing',
			'berat',
			'deskripsi_barang',
			'harga_barang',
			'keterangan',
			'service',
			'kode_order',
			'is_packing_kayu',
			'is_asuransi',
			'is_cod',
			'harga_cod',
			//identitas pengirim
			'nama_registrasi',
			'alamat_registrasi',
			'kabkota_registrasi',
			'kodepos_registrasi',
			'provinsi_registrasi',
			'kontak_registrasi',
			'telp_registrasi',
			'nomor_akun'
		];

		$request = [];
		foreach ($spreadSheetAry as $k => $v) {
			if ($k > 0) {
				$dt = [];
				foreach ($v as $kdata => $vdata) {
					$dt[$keys[$kdata]] = $vdata;
				}
				$request[] = $dt;
			}
		}

		$data['hasil'] = [];
		foreach ($request as $di) {
			$res = $this->__create_order($di);
			$data['hasil'][] = $res;
		}

		$this->__json_out($data);
	}

	public function booking_multi()
	{
		$d = $this->__init();
		$data = array();
		$sukses = 0;
		$gagal = 0;
		$message = [];
		$this->_api_auth_required($data, 'user');

		$upload = $this->su->upload_file('paket');
		if ($upload->status != 200) {
			$this->status = $upload->status;
			$this->message = $this->message;
			$this->__json_out($data);
			die();
		}

		$Reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadSheet = $Reader->load($upload->file);
		$excelSheet = $spreadSheet->getActiveSheet();
		$spreadSheetAry = $excelSheet->toArray();
		unlink($upload->file);

		$keys = [
			//identitas penerima
			'nama_penerima',
			'alamat_penerima',
			'kabkota',
			'kodepos',
			'provinsi',
			'kontak_penerima',
			'telp_penerima',
			//data paket
			'jumlah_packing',
			'berat',
			'deskripsi_barang',
			'harga_barang',
			'keterangan',
			'service',
			'kode_booking',
			'is_packing_kayu',
			'is_asuransi',
			'is_cod',
			'harga_cod',
			//identitas pengirim
			'nama_registrasi',
			'alamat_registrasi',
			'kabkota_registrasi',
			'kodepos_registrasi',
			'provinsi_registrasi',
			'kontak_registrasi',
			'telp_registrasi',
			'nomor_akun',
			'instruksi_khusus'
		];

		$request = [];
		foreach ($spreadSheetAry as $k => $v) {
			if ($k > 0) {
				$dt = [];
				foreach ($v as $kdata => $vdata) {
					$dt[$keys[$kdata]] = $vdata;
				}
				$request[] = $dt;
			}
		}
		$data['hasil'] = [];
		foreach ($request as $di) {
			$res = $this->__booking($d, $di);
			if ($res['status'] == 200) {
				$sukses++;
			} else {
				$gagal++;
			}
			$message[] = $res['message'];
		}

		$this->status = 200;
		$this->message = "Berhasil";
		$data['sukses'] = $sukses;
		$data['gagal'] = $gagal;
		$data['pesan'] = $message;

		$this->__json_out($data);
	}

	public function detail($id)
	{
		$id = (int) $id;
		$d = $this->__init();
		$data = array();
		if (!$this->user_login && empty($id)) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$this->status = 200;
		$this->message = 'Berhasil';
		$data = $this->com->id($id);
		if (isset($data->b_user_id_penerima)) {
			$penerima = $this->bum->id($data->b_user_id_penerima);
			$alamat_penerima = $this->buam->getByUserId($data->b_user_id_penerima);
			$data->penerima = $penerima ?? [];
			$data->alamat_penerima = $alamat_penerima ?? [];
		}

		if (isset($data->b_user_id)) {
			$pengirim = $this->bum->id($data->b_user_id);
			$alamat_pengirim = $this->buam->getByUserId($data->b_user_id);
			$data->pengirim = $pengirim ?? [];
			$data->alamat_pengirim = $alamat_pengirim ?? [];
		}
		$this->__json_out($data);
	}
	public function edit()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$du = $_POST;
		if (!isset($du['id'])) $du['id'] = 0;
		$id = (int) $du['id'];
		unset($du['id']);
		if ($id > 0) {
			$check = 0;
			if (isset($du['telp'])) {
				$check = $this->com->checktelp($du['telp'], $id); //1 = sudah digunakan
			}

			if (empty($check)) {
				$res = $this->com->update($id, $du);
				if ($res) {
					$this->status = 200;
					$this->message = 'Perubahan berhasil diterapkan';
				} else {
					$this->status = 901;
					$this->message = 'Tidak dapat melakukan perubahan ke basis data';
				}
			} else {
				$this->status = 104;
				$this->message = 'Nomor Telpon sudah digunakan, silakan coba yang lain';
			}
		} else {
			$this->status = 448;
			$this->message = 'ID Tidak ditemukan';
		}
		$this->__json_out($data);
	}
	public function editpass($id = "")
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$id = (int) $id;
		$du = $_POST;
		if (!isset($du['id'])) $du['id'] = 0;
		unset($du['id']);
		if ($id > 0) {
			if (strlen($du['password'])) {
				$du['password'] = md5($du['password']);
				$res = $this->com->update($id, $du);
				$this->status = 200;
				$this->message = 'Perubahan berhasil diterapkan';
			} else {
				$this->status = 901;
				$this->message = 'Password terlalu pendek';
			}
		} else {
			$this->status = 447;
			$this->message = 'ID Pengguna tidak valid';
		}
		$this->__json_out($data);
	}

	public function hapus($id)
	{
		$id = (int) $id;
		$d = $this->__init();
		$data = array();
		if (!$this->user_login && empty($id)) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}
		$this->status = 200;
		$this->message = 'Berhasil';
		$res = $this->com->del($id);
		if (!$res) {
			$this->status = 902;
			$this->message = 'Data gagal dihapus';
		}
		$this->__json_out($data);
	}
	public function edit_foto($id)
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$id = (int) $id;
		$du = $_POST;
		if (!isset($du['id'])) $du['id'] = 0;
		if (empty($id)) {
			$id = (int) $du['id'];
			unset($du['id']);
		}
		$pengguna = $this->com->getById($id);
		if ($id > 0 && isset($pengguna->id)) {
			if (!empty($penguna_foto)) {
				if (strlen($pengguna->foto) > 4) {
					$foto = SEMEROOT . DIRECTORY_SEPARATOR . $pengguna->foto;
					if (file_exists($foto)) unlink($foto);
				}
				$du = array();
				$du['foto'] = $penguna_foto;
				$res = $this->com->update($id, $du);
				if ($res) {
					$this->status = 200;
					$this->message = 'Upload foto berhasil';
				} else {
					$this->status = 901;
					$this->message = 'Upload foto gagal';
				}
			} else {
				$this->status = 459;
				$this->message = 'Tidak ada file gambar yang terupload';
			}
		} else {
			$this->status = 550;
			$this->message = 'Dont hack this :P';
		}
		$this->__json_out($data);
	}

	//Temporary Select2 di Pengguna API
	public function select2()
	{
		$this->load("api_admin/b_user_model", 'com');
		$d = $this->__init();
		$keyword = $this->input->request('q');
		$ddata = $this->com->select2($keyword);
		$datares = array();
		$i = 0;
		foreach ($ddata as $key => $value) {
			$datares["results"][$i++] = array("id" => $value->id, "text" => $value->kode . " - " . $value->fnama);
		}
		header('Content-Type: application/json');
		echo json_encode($datares);
	}

	public function hak_akses()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$this->load('api_admin/a_pengguna_module_model', 'comm');
		$a_pengguna_id          = $_POST['a_pengguna_id'];
		$a_modules_identifier   = $_POST['a_modules_identifier'];

		$this->comm->updateModule(array('tmp_active' => 'N'), $a_pengguna_id);

		foreach ($a_modules_identifier as $ami) {
			$arr                            = array();
			$arr['a_pengguna_id']           = $a_pengguna_id;
			$arr['a_modules_identifier']    = $ami;
			$arr['rule']                    = 'allowed';
			$arr['tmp_active']              = 'Y';

			$check_ami = $this->comm->check_access($a_pengguna_id, $ami);
			if ($check_ami == 0) {
				$this->comm->set($arr);
			} else {
				$this->comm->updateModule($arr, $a_pengguna_id, $ami);
			}
		}

		$res = $this->comm->delModule($a_pengguna_id);

		if ($res) {
			$this->status   = 200;
			$this->message  = 'Berhasil disimpan';
		} else {
			$this->status   = 901;
			$this->message  = 'Terjadi kesalahan dalam proses';
		}

		$this->__json_out($data);
	}
	public function pengguna_module()
	{
		$this->load('api_admin/a_pengguna_module_model', 'comm');
		$d          = $this->__init();
		$id         = $this->input->post('id');
		$ddata      = $this->comm->pengguna_module($id);
		$datares    = array();
		$i          = 0;
		foreach ($ddata as $key => $value) {
			$datares[$i++] = $value->a_modules_identifier;
		}
		header('Content-Type: application/json');
		echo json_encode($datares);
	}
	public function cari()
	{
		$keyword = $this->input->request("keyword");
		if (empty($keyword)) $keyword = "";
		$p = new stdClass();
		$p->id = 'NULL';
		$p->text = '-';
		$data = $this->com->cari($keyword);
		array_unshift($data, $p);
		$this->__json_select2($data);
	}
	public function tracking($id)
	{
		$id = (int) $id;
		$d = $this->__init();
		$data = array();
		if (!$this->user_login && empty($id)) {
			$this->status = 400;
			$this->message = 'Harus login';
			header("HTTP/1.0 400 Harus login");
			$this->__json_out($data);
			die();
		}

		$order = $this->com->id($id);
		if (!isset($order->id)) {
			$this->status = 522;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$res = $this->jne->tracking($order->no_resi);
		if ($res['status'] == 200) {
			$body = json_decode($res['data']);
			if (isset($body->detail)) {
				$detail = $body->detail[0];
				if (strtolower($detail->status) == "sukses") {
					$this->status = 200;
					$this->message = "Berhasil";
				} else {
					$this->status = 901;
					$this->message = $detail->reason;
				}
			} else {
				$this->status = 900;
				$this->message = 'Tidak dapat membuat no resi, silakan coba beberapa saat lagi';
			}
		} else {
			$this->status = $res['status'];
			$this->message = $res['message'];
		}
		$this->__json_out($data);
	}

	public function booking()
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$di = $_POST;
		if (!isset($di['is_drop_shipper'])) $di['is_drop_shipper'] = 0;
		if (!isset($di['is_packing_kayu'])) $di['is_packing_kayu'] = 0;
		if (!isset($di['is_asuransi'])) $di['is_asuransi'] = 0;

		if (
			!isset($di['nama_registrasi']) ||
			!isset($di['telp_registrasi']) ||
			!isset($di['nama_penerima']) ||
			!isset($di['telp_penerima'])
		) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		if (!isset($di['b_user_id'])) {
			$pengirim = $this->bum->getByNameAndTelp(strtolower($di['nama_registrasi']), $di['telp_registrasi']);
			if (!isset($pengirim->id)) {
				$this->status = 522;
				$this->message = 'Data pengirim tidak ditemukan atau sudah dihapus';
				$this->__json_out($data);
				die();
			}

			$di['b_user_id'] = $pengirim->id;
		}

		$alamat_pengirim = $this->buam->getByUserId($di['b_user_id']);
		if (!isset($alamat_pengirim->id)) {
			$this->status = 522;
			$this->message = 'Data alamat pengirim tidak ditemukan atau sudah dihapus';
			$this->__json_out($data);
			die();
		}
		if (isset($pengirim->a_company_id)) {
			$company = $this->acm->id($pengirim->a_company_id);
			if (isset($company->nama)) {
				$di['contact_registrasi'] = substr($company->nama, 0, 20);
			}
		}


		// Create kode booking
		$acronim = '';
		foreach (explode(' ', $this->config->semevar->site_name) as $nm) {
			$acronim .= $nm[0];
		}
		$lastId = $this->com->getLastId();
		$kode_order = strtoupper($acronim) . date('dmY') . $lastId;
		$first_word = $acronim . '-';
		$additional = '';
		for ($i = strlen($first_word . $lastId); $i < 16; $i++) {
			$additional .= '0';
		}
		$booking_code = $first_word . $additional . $lastId;
		// dd($booking_code . ' | ' . strlen($booking_code));

		// Cek apakah penerima sudah masuk db
		$penerima = $this->bum->getByNameAndTelp($di['nama_penerima'], $di['telp_penerima']);
		if (!isset($penerima->id)) {
			$dip = [];
			$dip['fnama'] = $di['nama_penerima'];
			$dip['telp'] = $di['telp_penerima'];
			$dip['utype'] = 'kustomer';
			$dip['b_user_id'] = $d['sess']->user->login ?? $d['sess']->reseller->login ?? null;
			$di['b_user_id_penerima'] = $this->bum->set($dip);

			$origin = $this->aom->getByKabkota($di['kabkota']);
			$destination = $this->adm->getByCode($di['kode_destination']);
			$dipa = [];
			$dipa['b_user_id'] = $di['b_user_id_penerima'];
			$dipa['provinsi'] = $destination->provinsi;
			$dipa['kabkota'] = $destination->kabkota;
			$dipa['kecamatan'] = $destination->kecamatan;
			$dipa['kelurahan'] = $destination->kelurahan;
			$dipa['alamat'] = $di['alamat_penerima'];
			$dipa['alamat2'] = $di['alamat_penerima2'] ?? "";
			$dipa['kodepos'] = $destination->kodepos;
			$dipa['kode_destination'] = $destination->code;
			$dipa['kode_origin'] = $origin->code;
			$res_alamat_pengirim = $this->buam->set($dipa);
		} else {
			$di['b_user_id_penerima'] = $penerima->id;
			if (isset($penerima->a_company_id)) {
				$company_penerima = $this->acm->id($penerima->a_company_id);
				if (isset($company_penerima->nama)) {
					$di['contact_penerima'] = substr($company_penerima->nama, 0, 20);
				}
			}
		}

		$contact_pengirim = explode(' ', $di['nama_registrasi']);
		if (!isset($di['contact_registrasi'])) $di['contact_registrasi'] = $contact_pengirim[0];

		$contact_penerima = explode(' ', $di['nama_penerima']);
		if (!isset($di['contact_penerima'])) $di['contact_penerima'] = $contact_penerima[0];


		$order = $this->com->getByBookingKode($booking_code);
		if (!isset($order->id)) {
			$dio = [];
			$dio['b_user_id'] = $di['b_user_id'];
			$dio['cdate'] = "now()";
			$dio['b_user_id_penerima'] = $di['b_user_id_penerima'];
			$dio['telp'] = $di['telp_penerima'];
			$dio['kode'] = $kode_order;
			$dio['layanan'] = $di['layanan'];
			$dio['service'] = $di['service'];
			$dio['is_drop_shipper'] = $di['is_drop_shipper'];
			$dio['kode_branch'] = $di['kode_branch'];
			$dio['is_cod'] = $di['layanan'] == 'COD' ? 1 : 0;
			$dio['harga_cod'] = $di['harga_cod'] ?? 0;
			$dio['harga_paket'] = $di['harga_barang'] ?? 0;
			$dio['json_value'] = json_encode($di);
			$order_id = $this->com->set($dio);
		} else {
			$order_id = $order->id;
		}

		if ($order_id) {
			$fd = [];
			$fd['SHIPPER_NAME'] = $di['nama_registrasi'];
			$fd['SHIPPER_ADDR1'] = $di['alamat_registrasi'];
			$fd['SHIPPER_ADDR2'] = $di['alamat_registrasi2'] ?? "";
			$fd['SHIPPER_ADDR3'] = $di['alamat_registrasi3'] ?? "";
			$fd['SHIPPER_CITY'] = ltrim($di['kabkota_registrasi'], ' ');
			$fd['SHIPPER_ZIP'] = $di['kodepos_registrasi'];
			$fd['SHIPPER_REGION'] = $alamat_pengirim->provinsi ?? "";
			$fd['SHIPPER_COUNTRY'] = 'ID';
			$fd['SHIPPER_CONTACT'] = $di['contact_registrasi'];
			$fd['SHIPPER_PHONE'] = $di['telp_registrasi'];
			$fd['RECEIVER_NAME'] = $di['nama_penerima'];
			$fd['RECEIVER_ADDR1'] = $di['alamat_penerima'];
			$fd['RECEIVER_ADDR2'] = $di['alamat_penerima2'] ?? "";
			$fd['RECEIVER_ADDR3'] = $di['alamat_penerima3'] ?? "";
			$fd['RECEIVER_ZIP'] = $di['kodepos'];
			$fd['RECEIVER_CITY'] = $di['kabkota'];
			$fd['RECEIVER_REGION'] = $di['provinsi'];
			$fd['RECEIVER_COUNTRY'] = 'ID';
			$fd['RECEIVER_CONTACT'] = $di['contact_penerima'];
			$fd['RECEIVER_PHONE'] = $di['telp_penerima'];
			$fd['ORIGIN_DESC'] = $di['kabkota_registrasi'];
			$fd['ORIGIN_CODE'] = $di['kode_origin'];
			$fd['DESTINATION_CODE'] = $di['kode_destination'];
			$fd['DESTINATION_DESC'] = $di['kabkota'];
			$fd['SERVICE_CODE'] = $di['service'];
			$fd['WEIGHT'] = floatval($di['berat']);
			$fd['QTY'] = floatval($di['jumlah_packing']);
			$fd['GOODS_DESC'] = $di['deskripsi_barang'];
			$fd['GOODS_AMOUNT'] = (int) $di['harga_barang'];
			$fd['INSURANCE_FLAG'] = $di['is_asuransi'] ? 1 : '';
			$fd['INSURANCE_AMOUNT'] = !empty($di['harga_asuransi']) ? (int) $di['harga_asuransi'] : "";
			$fd['DELIVERY_PRICE'] = (int) $di['ongkir'];
			$fd['BOOK_CODE'] = $booking_code;
			$fd['AWB_TYPE'] = 'FREE';
			$fd['CUST_ID'] = $di['nomor_akun'];
			$fd['BRANCH'] = $di['kode_branch'];
			$fd['COD_FLAG'] = $di['layanan'] == 'COD' ? 'YES' : 'NO';
			$fd['COD_AMOUNT'] = (int) $di['harga_cod'];
			$fd['SPECIAL_INS'] = $di['keterangan'];
			foreach ($fd as $k => $v) {
				$fd[$k] = ltrim($v, ' ');
			}
			$res = $this->jne->create_job($fd);
			if ($res['status'] == 200) {
				$body = json_decode($res['data']);

				if (isset($body->status)) {
					if (strtolower($body->status) == "sukses") {
						$this->status = 200;
						$this->message = "Berhasil";
						$du = array();
						$du['layanan'] = $di['service'];
						$du['no_tiket'] = $body->no_tiket;

						$res2 = $this->com->update($order_id, $du);
					} else {
						if (isset($order_id)) $delete = $this->com->del($order_id);
						$this->status = 901;
						$this->message = $body->reason ?? $body->error ?? 'Gagal, coba beberapa saat lagi';
					}
				} else {
					if (isset($order_id)) $delete = $this->com->del($order_id);
					$this->status = 900;
					$this->message = 'Tidak dapat membuat no resi, silakan coba beberapa saat lagi';
				}
			} else {
				if (isset($order_id)) $delete = $this->com->del($order_id);
				$this->status = $res['status'];
				$this->message = $res['message'];
			}
		}
		$this->__json_out($data);
	}

	public function tambah_resi($id)
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');

		$du = $_POST;
		if (!isset($id)) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}
		if ($id > 0) {
			$res = $this->com->update($id, $du);
			if ($res) {
				$this->status = 200;
				$this->message = 'Perubahan berhasil diterapkan';
			} else {
				$this->status = 901;
				$this->message = 'Tidak dapat melakukan perubahan ke basis data';
			}
		} else {
			$this->status = 448;
			$this->message = 'ID Tidak ditemukan';
		}
		$this->__json_out($data);
	}

	public function statistic()
	{
		$data = array();
		$d = $this->__init();
		if (!$this->admin_login && !$this->user_login) {
			$this->status = 400;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			header("HTTP/1.0 $this->status $this->message");
			$this->__json_out($data);
			die();
		}

		$sdate = $this->input->request('sdate', '');
		$edate = $this->input->request('edate', '');

		if (!strlen($sdate) && !strlen($edate)) {
			$sdate = date("Y-m-d", strtotime(date("Y-m-d", strtotime(date("Y-m-d"))) . "-1 month"));
		}

		$b_user_id = $d['sess']->user->id ?? '';

		$data['cod'] = [];
		$data['non_cod'] = [];
		$data['nominal_cod'] = [];

		$in_shipper = [''];
		$in_sorting = ['CR5', 'OP1', 'OP2'];
		$in_shipping = ['OP3', 'TP1', 'TP2', 'TP3', 'TP4', 'TP5', 'IP1', 'IP2', 'IP3', 'OP3', 'BI1', 'BI2', 'BI3', 'OP4', ''];
		$pickup_process = ['PU0', 'RC1', 'RC2', 'PU1', 'PU2', 'S01', 'F01', 'F02', 'F03', 'F04', 'F05', 'F06'];
		$in_warehouse = ['WH1', 'WH2', 'WH3', 'WH4', 'WH5'];
		$delivered = ['DB1', 'DB2', 'D01', 'D02', 'D03', 'D04', 'D05', 'D06', 'D07', 'D08', 'D09', 'D10', 'D11', 'D12', 'R24', 'R25', 'R26'];
		$return = ['CR1', 'R01', 'R02', 'R03', 'R04', 'R05', 'R06', 'R07', 'R08', 'R09', 'R10', 'R11', 'R12', 'CR7'];
		$undelivered = ['CR2', 'CR4', 'U01', 'U02', 'U03', 'U04', 'U05', 'U06', 'U07', 'U08', 'U09', 'U10', 'U11', 'U12', 'U13', 'U14', 'U21', 'U22', 'U23', 'U24', 'U25', 'UB1', 'UB2', 'KRK', 'KRP', 'KRT', 'FOM'];
		$cancel = ['F05'];


		$order_cod = $this->com->getStatistic($b_user_id, $sdate, $edate);
		$order_non_cod = $this->com->getStatistic($b_user_id, $sdate, $edate, 0);
		foreach ($order_cod as $cm) {
			$key = $cm->is_cod ? 'cod' : 'non_cod';

			if (!isset($data[$key]['all'])) $data[$key]['all'] = 0;
			$data[$key]['all'] += $cm->jumlah;

			if (!isset($data['nominal_' . $key]['all'])) $data['nominal_' . $key]['all'] = 0;
			$data['nominal_' . $key]['all'] += $cm->harga_cod;

			if (in_array($cm->kode_tracking, $in_shipper)) {
				if (!isset($data[$key]['in_shipper'])) $data[$key]['in_shipper'] = 0;
				$data[$key]['in_shipper'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['in_shipper'])) $data['nominal_' . $key]['in_shipper'] = 0;
				$data['nominal_' . $key]['in_shipper'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $in_sorting)) {
				if (!isset($data[$key]['in_sorting'])) $data[$key]['in_sorting'] = 0;
				$data[$key]['in_sorting'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['in_sorting'])) $data['nominal_' . $key]['in_sorting'] = 0;
				$data['nominal_' . $key]['in_sorting'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $in_shipping)) {
				if (!isset($data[$key]['in_shipping'])) $data[$key]['in_shipping'] = 0;
				$data[$key]['in_shipping'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['in_shipping'])) $data['nominal_' . $key]['in_shipping'] = 0;
				$data['nominal_' . $key]['in_shipping'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $in_warehouse)) {
				if (!isset($data[$key]['in_warehouse'])) $data[$key]['in_warehouse'] = 0;
				$data[$key]['in_warehouse'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['in_warehouse'])) $data['nominal_' . $key]['in_warehouse'] = 0;
				$data['nominal_' . $key]['in_warehouse'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $delivered)) {
				if (!isset($data[$key]['delivered'])) $data[$key]['delivered'] = 0;
				$data[$key]['delivered'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['delivered'])) $data['nominal_' . $key]['delivered'] = 0;
				$data['nominal_' . $key]['delivered'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $return)) {
				if (!isset($data[$key]['return'])) $data[$key]['return'] = 0;
				$data[$key]['return'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['return'])) $data['nominal_' . $key]['return'] = 0;
				$data['nominal_' . $key]['return'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $undelivered)) {
				if (!isset($data[$key]['undelivered'])) $data[$key]['undelivered'] = 0;
				$data[$key]['undelivered'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['undelivered'])) $data['nominal_' . $key]['undelivered'] = 0;
				$data['nominal_' . $key]['undelivered'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $pickup_process)) {
				if (!isset($data[$key]['pickup_process'])) $data[$key]['pickup_process'] = 0;
				$data[$key]['pickup_process'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['pickup_process'])) $data['nominal_' . $key]['pickup_process'] = 0;
				$data['nominal_' . $key]['pickup_process'] += $cm->harga_cod;
			} elseif (in_array($cm->kode_tracking, $cancel)) {
				if (!isset($data[$key]['cancel'])) $data[$key]['cancel'] = 0;
				$data[$key]['cancel'] += $cm->jumlah;

				if (!isset($data['nominal_' . $key]['cancel'])) $data['nominal_' . $key]['cancel'] = 0;
				$data['nominal_' . $key]['cancel'] += $cm->harga_cod;
			}
		}

		foreach ($data['nominal_cod'] as $k => $v) {
			$data['nominal_cod'][$k] = number_format($v, 0, ',', '.');
		}

		foreach ($order_non_cod as $cm) {
			$key = $cm->is_cod ? 'cod' : 'non_cod';

			if (!isset($data[$key]['all'])) $data[$key]['all'] = 0;
			$data[$key]['all'] += $cm->jumlah;

			if (in_array($cm->kode_tracking, $in_shipper)) {
				if (!isset($data[$key]['in_shipper'])) $data[$key]['in_shipper'] = 0;
				$data[$key]['in_shipper'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $in_sorting)) {
				if (!isset($data[$key]['in_sorting'])) $data[$key]['in_sorting'] = 0;
				$data[$key]['in_sorting'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $in_shipping)) {
				if (!isset($data[$key]['in_shipping'])) $data[$key]['in_shipping'] = 0;
				$data[$key]['in_shipping'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $in_warehouse)) {
				if (!isset($data[$key]['in_warehouse'])) $data[$key]['in_warehouse'] = 0;
				$data[$key]['in_warehouse'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $delivered)) {
				if (!isset($data[$key]['delivered'])) $data[$key]['delivered'] = 0;
				$data[$key]['delivered'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $return)) {
				if (!isset($data[$key]['return'])) $data[$key]['return'] = 0;
				$data[$key]['return'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $undelivered)) {
				if (!isset($data[$key]['undelivered'])) $data[$key]['undelivered'] = 0;
				$data[$key]['undelivered'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $pickup_process)) {
				if (!isset($data[$key]['pickup_process'])) $data[$key]['pickup_process'] = 0;
				$data[$key]['pickup_process'] += $cm->jumlah;
			} elseif (in_array($cm->kode_tracking, $cancel)) {
				if (!isset($data[$key]['cancel'])) $data[$key]['cancel'] = 0;
				$data[$key]['cancel'] += $cm->jumlah;
			}
		}

		$this->status = 200;
		$this->message = 'Berhasil';
		$this->__json_out($data);
	}
}
