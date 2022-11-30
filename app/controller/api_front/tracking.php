<?php

class Tracking extends JI_Controller
{
	var $media_pengguna = 'media/pengguna';

	public function __construct()
	{
		parent::__construct();
		$this->load("a_company_concern");
		$this->load("a_trackstat_jne_concern");
		$this->load("a_destination_concern");
		$this->load("a_origin_concern");
		$this->load("b_user_concern");
		$this->load("b_user_alamat_concern");
		$this->load("c_order_concern");
		$this->load("api_front/a_origin_model", 'aom');
		$this->load("api_front/a_trackstat_jne_model", 'atjm');
		$this->load("api_front/a_company_model", 'acm');
		$this->load("api_front/a_destination_model", 'adm');
		$this->load("api_front/b_user_model", 'bum');
		$this->load("api_front/b_user_alamat_model", 'buam');
		$this->load("api_front/c_order_model", 'com');
		$this->load("api_front/d_barang_model", 'dbm');
		$this->lib("jne");
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

		$datatable = $this->com->datatable()->initialize();
		$dcount = $this->com->count($datatable->keyword());
		$ddata = $this->com->data(
			$datatable->page(),
			$datatable->pagesize(),
			$datatable->sort_column(),
			$datatable->sort_direction(),
			$datatable->keyword(),
			$is_active
		);

		foreach ($ddata as &$gd) {
			if (isset($gd->is_active)) {
				$gd->is_active = $this->com->label('is_active', $gd->is_active);
			}
		}

		$this->__jsonDataTable($ddata, $dcount);
	}

	public function track($no_resi)
	{
		$d = $this->__init();
		$data = array();
		$this->_api_auth_required($data, 'user');


		if (empty($no_resi)) {
			$this->status = 444;
			$this->message = API_ADMIN_ERROR_CODES[$this->status];
			$this->__json_out($data);
			die();
		}

		$dummy_data = '{
			"cnote": {
				"cnote_no": "XXXXXXXXXXXXXXX",
				"reference_number": "CLJN-1603876198528",
				"cnote_origin": "PKY20700",
				"cnote_destination": "AMQ20301",
				"cnote_services_code": "REG",
				"servicetype": "REG19",
				"cnote_cust_no": "80568801",
				"cnote_date": "2020-10-30T12:27:30.000+07:00",
				"cnote_pod_receiver": "NORMA BUGIS",
				"cnote_receiver_name": "JUITA RUMKEL",
				"city_name": "AIR BUAYA/BURU UTARA BARAT",
				"cnote_pod_date": "06 NOV 2020  11:00",
				"pod_status": "DELIVERED",
				"last_status": "DELIVERED TO [NORMA BUGIS | 06-11-2020 11:00 | AMBON ]",
				"cust_type": "999",
				"cnote_amount": "94000",
				"cnote_weight": "1.2",
				"pod_code": "D01",
				"keterangan": "YANG BERSANGKUTAN",
				"cnote_goods_descr": "BAJAKAH TAMPALA",
				"freight_charge": "94000",
				"shippingcost": "94000",
				"insuranceamount": "0",
				"priceperkg": "78333.3333333333333333333333333333333333",
				"signature": "https://s3-ap-southeast-1.amazonaws.com/pod.paket.id/xxxxx.svg",
				"photo": "https://s3-ap-southeast-1.amazonaws.com/pod.paket.id/xxxxxx.jpeg",
				"long": "106.840608",
				"lat": "-6.345136",
				"estimate_delivery": " Days"
			},
			"detail": [
				{
					"cnote_no": "4808012000000159",
					"cnote_date": "30-10-2020 12:27",
					"cnote_weight": "1.2",
					"cnote_origin": "PANGKALANBUN",
					"cnote_shipper_name": "HERBAL ZONE",
					"cnote_shipper_addr1": "ARUT SELATAN KOTAWARINGIN LAM",
					"cnote_shipper_addr2": ", KAB. KOTAWARINGIN BARAT KAL",
					"cnote_shipper_addr3": "MANTAN TENGAH 74111",
					"cnote_shipper_city": "KAB. KOTAWARINGIN B",
					"cnote_receiver_name": "JUITA RUMKEL",
					"cnote_receiver_addr1": "DESA TANJUNG KARANG, AIR BUAYA",
					"cnote_receiver_addr2": ", KAB. BURU MALUKU 97572",
					"cnote_receiver_addr3": null,
					"cnote_receiver_city": "AIR BUAYA/BURU UTARA"
				}
			],
			"history": [
				{
					"date": "30-10-2020 08:04",
					"desc": "RECEIVED AT SORTING CENTER  [PALANGKARAYA]",
					"code": "OP1"
				},
				{
					"date": "30-10-2020 12:27",
					"desc": "SHIPMENT RECEIVED BY JNE COUNTER OFFICER AT  [PANGKALANBUN]",
					"code": "RC1"
				},
				{
					"date": "30-10-2020 16:13",
					"desc": "PROCESSED AT SORTING CENTER  [PKY, AGEN PANGKALAN BUN]",
					"code": "OP2"
				},
				{
					"date": "02-11-2020 03:37",
					"desc": "DEPARTED FROM TRANSIT  [GATEWAY , JAKARTA]",
					"code": "TP4"
				},
				{
					"date": "04-11-2020 04:12",
					"desc": "RECEIVED AT WAREHOUSE   [AMQ, OPR INBOUND]",
					"code": "IP1"
				},
				{
					"date": "04-11-2020 06:15",
					"desc": "SHIPMENT FORWARDED FROM TRANSIT CITY TO DESTINATION CITY [AMQ, OPR TRANSIT DAERAH]",
					"code": "OP3"
				},
				{
					"date": "04-11-2020 11:38",
					"desc": "RECEIVED AT INBOUND STATION  [AMQ, OPR TRANSIT DAERAH]",
					"code": "IP2"
				},
				{
					"date": "04-11-2020 13:33",
					"desc": "SHIPMENT FORWARDED TO DESTINATION [AIR BUAYA/BURU UTARA BARAT]",
					"code": "OP3"
				},
				{
					"date": "06-11-2020 11:00",
					"desc": "DELIVERED TO [NORMA BUGIS | 06-11-2020 11:00 | AMBON ]",
					"code": "D01"
				}
			]
		}';

		// $data = json_decode($dummy_data);


		$this->status = 200;
		$this->message = "Berhasil";
		$res = $this->jne->tracking($no_resi);
		if ($res['status'] == 200) {
			$body = json_decode($res['data']);
			if (isset($body->detail)) {
				$data = $body;
				$data->history = array_reverse($data->history);
				if (isset($data->history)) {
					$codes = [];
					foreach ($data->history as $k => $h) {
						$codes[] = $h->code;
					}
					$atjm = $this->atjm->getByCodes($codes);
					$track_status = [];
					$track_sg = [];
					foreach ($atjm as $k => $v) {
						$track_status[$v->pod_code] = $v->pod_status;
						$track_sg[$v->pod_code] = $v->pod_status_group;
					}
					foreach ($data->history as $k => $h) {
						$h->icon = isset($this->jne->icon[$track_sg[$h->code]]) ? $this->jne->icon[$track_sg[$h->code]] : 'info';
						$h->color_icon = isset($this->jne->color[$track_sg[$h->code]]) ? $this->jne->color[$track_sg[$h->code]] : 'info';
						$h->title = isset($track_status[$h->code]) ? $track_status[$h->code] : $h->code;
						if (date('Y-m-d', strtotime($h->date)) == date('Y-m-d')) {
							$h->date = 'Hari ini';
						}
					}
				}

				if (isset($data->cnote)) {
					if (isset($data->cnote->estimate_delivery)) {
						$data->cnote->estimate_delivery = str_replace('Days', 'Hari', $data->cnote->estimate_delivery);
						$data->cnote->estimate_delivery = str_replace('Weeks', 'Pekan', $data->cnote->estimate_delivery);
						$data->cnote->estimate_delivery = str_replace('Months', 'Bulan', $data->cnote->estimate_delivery);
					}
					if (isset($data->cnote->cnote_date)) {
						$date = date("Y-m-d H:i:s", strtotime($data->cnote->cnote_date));
						$data->cnote->cnote_date = $this->__dateIndonesia($date, "hari_tanggal_jam");
					}

					if (isset($data->cnote->shippingcost)) {
						$data->cnote->shippingcost = "Rp. " . number_format($data->cnote->shippingcost, 0, ',', '.');
					}

					$data->cnote->penerima = '-';
					$data->cnote->pengirim = '-';

					if (isset($data->detail[0])) {
						$detail = $data->detail[0];
						$penerima = '';
						if (isset($detail->cnote_receiver_name)) $penerima .= $detail->cnote_receiver_name . " - ";
						if (isset($detail->cnote_receiver_city)) $penerima .= $detail->cnote_receiver_city . "<br>";
						if (isset($detail->cnote_receiver_addr1)) $penerima .= $detail->cnote_receiver_addr1;
						if (isset($detail->cnote_receiver_addr2)) $penerima .= $detail->cnote_receiver_addr2;
						if (isset($detail->cnote_receiver_addr3)) $penerima .= $detail->cnote_receiver_addr3;
						if (strlen($penerima)) $data->cnote->penerima = $penerima;

						$pengirim = '';
						if (isset($detail->cnote_shipper_name)) $pengirim .= $detail->cnote_shipper_name . " - ";
						if (isset($detail->cnote_shipper_city)) $pengirim .= $detail->cnote_shipper_city . "<br>";
						if (isset($detail->cnote_shipper_addr1)) $pengirim .= $detail->cnote_shipper_addr1;
						if (isset($detail->cnote_shipper_addr2)) $pengirim .= $detail->cnote_shipper_addr2;
						if (isset($detail->cnote_shipper_addr3)) $pengirim .= $detail->cnote_shipper_addr3;
						if (strlen($pengirim)) $data->cnote->pengirim = $pengirim;
					}
				}
				$this->status = 200;
				$this->message = "Berhasil";
			} else {
				$this->status = 900;
				$this->message = $body->error ?? 'Tidak dapat tracking no resi, silakan coba beberapa saat lagi';
				if (isset($body->error) && $body->error == 'Cnote No. Not Found.') {
					$this->message = "No Resi tidak ditemukan";
				}
			}
		} else {
			$this->status = $res['status'];
			$this->message = $res['message'];
		}
		$this->__json_out($data);
	}
}
