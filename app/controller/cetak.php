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
			'ukuran' => 'A3',
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
		$maxdate = $content['data']['maxdate'];
		$mindate = $content['data']['mindate'];
		$newAim = [];
		foreach ($aim as $k => $v) {
			$newAim[$v['id']] = $v;
		}
		$aim = $newAim;

		$sh = 0;
		$tempRuangan = '';
		$tempTgl = '';
		$tempKategori = '';
		$tempSubKategori = '';
		$countSheet = [];

		// Init Spreadsheet
		$ssheet = $this->ss->newSpreadSheet();
		$ssheet->setActiveSheetIndex(0);

		// Get columns excel
		$colAlpha = $this->ss->colAlpha;

		$rowIdx = 10;
		$colIdx = 0;
		$rowTgl = 10;
		$lastRowTgl = 0;
		$isFirst = true;
		$nomor = 1;

		$countY = 0;
		$countN = 0;
		$countItem = 0;

		$colTgl = [];
		$columnTgl = 2;
		$tgl = 1;
		for ($i = 0; $i < 62; $i++) {
			if ($columnTgl % 2 == 0) {
				$colTgl[$tgl]['y'] = $colAlpha[$columnTgl];
			} else {
				$colTgl[$tgl]['n'] = $colAlpha[$columnTgl];
				$tgl++;
			}
			$columnTgl++;
		}
		foreach ($list as $k => $v) {
			if ($k == 0) {
				$tempRuangan = $v['ruangan'];
				$tempTgl = $v['tgl'];
				$tempKategori = $v['indikator_kategori'];
				$tempSubKategori = $v['indikator_subkategori'];

				//Header
				$countSheet[$sh] = $ssheet->getActiveSheet();
				$objDrawing = $this->ss->newDrawing();
				$objDrawing->setPath('media/logo.png');
				$objDrawing->setWidth(50);
				$objDrawing->setHeight(50);
				$objDrawing->setOffsetX(150);
				$objDrawing->setCoordinates('B2');
				$objDrawing->setWorksheet($countSheet[$sh]);
				$countSheet[$sh]->setTitle($v['ruangan']);
				$countSheet[$sh]->setCellValue($colAlpha[0] . 2, 'MONITORING KEGIATAN HARIAN PENCEGAHAN PENGENDALIAN INFEKSI DI RUMAH SAKIT UMUM BINA SEHAT')->mergeCells('A' . 2 . ':BL' . 2);
				$countSheet[$sh]->getStyle('A' . 2 . ':BL' . 2)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$countSheet[$sh]->setCellValue($colAlpha[0] . 4, 'Ruangan');
				$countSheet[$sh]->setCellValue($colAlpha[1] . 4, ': ' . $v['ruangan']);
				$countSheet[$sh]->setCellValue($colAlpha[0] . 5, 'Bulan');
				$countSheet[$sh]->setCellValue($colAlpha[1] . 5, ': ' . $v['bulan_tahun']);

				$countSheet[$sh]->setCellValue($colAlpha[0] . 7, 'NO')->mergeCells('A' . 7 . ':A' . 9);
				$countSheet[$sh]->getStyle('A' . 7 . ':A' . 9)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$countSheet[$sh]->setCellValue($colAlpha[1] . 7, 'INDIKATOR')->mergeCells('B' . 7 . ':B' . 9);
				$countSheet[$sh]->getStyle('B' . 7 . ':B' . 9)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$countSheet[$sh]->setCellValue($colAlpha[2] . 7, 'TANGGAL')->mergeCells('C' . 7 . ':BL' . 7);
				$countSheet[$sh]->getStyle('C' . 7 . ':BL' . 7)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());

				$columnTgl = 2;
				$tgl = 1;
				for ($i = 0; $i < 62; $i++) {
					if ($columnTgl % 2 == 0) {
						$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 8, $tgl)->mergeCells($colAlpha[$columnTgl] . 8 . ':' . $colAlpha[($columnTgl + 1)] . 8);
						$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 8 . ':' . $colAlpha[($columnTgl + 1)] . 8)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 9, 'Y');
						$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 9, 'Y')->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						$tgl++;
					} else {
						$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 9, 'T');
						$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 9, 'T')->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
					}
					$columnTgl++;
				}

				//Indikator
				$countSheet[$sh]->setCellValue($colAlpha[0] . $rowIdx, $v['indikator_kategori'])->mergeCells('A' . $rowIdx . ':BF' . $rowIdx);
				$countSheet[$sh]->setCellValue('BG' . $rowIdx, 'HASIL')->mergeCells('BG' . $rowIdx . ':BJ' . $rowIdx);
				$countSheet[$sh]->setCellValue('BK' . $rowIdx, $v['aksi_persentase'])->mergeCells('BK' . $rowIdx . ':BL' . $rowIdx);
				$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
				$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('66bb6a');
				$rowIdx++;
				$rowTgl++;

				// auto fit columns
				foreach ($countSheet[$sh]->getColumnIterator() as $column) {
					if ($column->getColumnIndex() != 'B') {
						$countSheet[$sh]->getColumnDimension($column->getColumnIndex())->setAutoSize(true);
					} else {
						$countSheet[$sh]->getColumnDimension($column->getColumnIndex())->setWidth(35);
						$countSheet[$sh]->getStyle('B')->getAlignment()->setWrapText(true);
					}
				}
			} else {
				if ($tempTgl != $v['tgl']) {
					if ($isFirst) {
						$lastRowTgl = $rowTgl;
						$columnTgl = 2;
						for ($i = 0; $i <= 62; $i++) {
							if ($i != 62) {
								$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 10 . ':' . $colAlpha[$columnTgl] . ($lastRowTgl - 1))->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
							}
							$columnTgl++;
						}
					}
				}
				if ($tempRuangan != $v['ruangan']) {
					$rowIdx++;
					$countSheet[$sh]->setCellValue('AQ' . $rowIdx, 'IPCN')->mergeCells('AQ' . $rowIdx . ':BB' . $rowIdx);
					$countSheet[$sh]->getStyle('AQ' . $rowIdx . ':BB' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
					$rowIdx++;
					$rowIdx++;
					$rowIdx++;
					$rowIdx++;
					$countSheet[$sh]->setCellValue('AQ' . $rowIdx, '(………………………………………)')->mergeCells('AQ' . $rowIdx . ':BB' . $rowIdx);
					$countSheet[$sh]->getStyle('AQ' . $rowIdx . ':BB' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());

					$nomor = 1;
					$rowIdx = 10;
					$rowTgl = 10;
					$isFirst = true;
					$tempRuangan = $v['ruangan'];
					$tempTgl = $v['tgl'];
					$tempKategori = $v['indikator_kategori'];
					$tempSubKategori = $v['indikator_subkategori'];
					$sh++;
					$countSheet[$sh] = $ssheet->createSheet();
					$objDrawing = $this->ss->newDrawing();
					$objDrawing->setPath('media/logo.png');
					$objDrawing->setWidth(50);
					$objDrawing->setHeight(50);
					$objDrawing->setOffsetX(150);
					$objDrawing->setCoordinates('B2');
					$objDrawing->setWorksheet($countSheet[$sh]);
					$countSheet[$sh]->setTitle($v['ruangan']);
					$countSheet[$sh]->setCellValue($colAlpha[0] . 2, 'MONITORING KEGIATAN HARIAN PENCEGAHAN PENGENDALIAN INFEKSI DI RUMAH SAKIT UMUM BINA SEHAT')->mergeCells('A' . 2 . ':BL' . 2);
					$countSheet[$sh]->getStyle('A' . 2 . ':BL' . 2)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
					$countSheet[$sh]->setCellValue($colAlpha[0] . 4, 'Ruangan');
					$countSheet[$sh]->setCellValue($colAlpha[1] . 4, ': ' . $v['ruangan']);
					$countSheet[$sh]->setCellValue($colAlpha[0] . 5, 'Bulan');
					$countSheet[$sh]->setCellValue($colAlpha[1] . 5, ': ' . $v['bulan_tahun']);

					$countSheet[$sh]->setCellValue($colAlpha[0] . 7, 'NO')->mergeCells('A' . 7 . ':A' . 9);
					$countSheet[$sh]->getStyle('A' . 7 . ':A' . 9)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
					$countSheet[$sh]->setCellValue($colAlpha[1] . 7, 'INDIKATOR')->mergeCells('B' . 7 . ':B' . 9);
					$countSheet[$sh]->getStyle('B' . 7 . ':B' . 9)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
					$countSheet[$sh]->setCellValue($colAlpha[2] . 7, 'TANGGAL')->mergeCells('C' . 7 . ':BL' . 7);
					$countSheet[$sh]->getStyle('C' . 7 . ':BL' . 7)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());

					$columnTgl = 2;
					$tgl = 1;
					for ($i = 0; $i < 62; $i++) {
						if ($columnTgl % 2 == 0) {
							$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 8, $tgl)->mergeCells($colAlpha[$columnTgl] . 8 . ':' . $colAlpha[($columnTgl + 1)] . 8);
							$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 8 . ':' . $colAlpha[($columnTgl + 1)] . 8)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
							$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 9, 'Y');
							$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 9, 'Y')->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
							$tgl++;
						} else {
							$countSheet[$sh]->setCellValue($colAlpha[$columnTgl] . 9, 'T');
							$countSheet[$sh]->getStyle($colAlpha[$columnTgl] . 9, 'T')->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						}
						$columnTgl++;
					}

					//Indikator
					$countSheet[$sh]->setCellValue($colAlpha[0] . $rowIdx, $v['indikator_kategori'])->mergeCells('A' . $rowIdx . ':BF' . $rowIdx);
					$countSheet[$sh]->setCellValue('BG' . $rowIdx, 'HASIL')->mergeCells('BG' . $rowIdx . ':BJ' . $rowIdx);
					$countSheet[$sh]->setCellValue('BK' . $rowIdx, $v['aksi_persentase'])->mergeCells('BK' . $rowIdx . ':BL' . $rowIdx);
					$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
					$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('66bb6a');
					$rowIdx++;
					$rowTgl++;

					// auto fit columns
					foreach ($countSheet[$sh]->getColumnIterator() as $column) {
						if ($column->getColumnIndex() != 'B') {
							$countSheet[$sh]->getColumnDimension($column->getColumnIndex())->setAutoSize(true);
						} else {
							$countSheet[$sh]->getColumnDimension($column->getColumnIndex())->setWidth(35);
							$countSheet[$sh]->getStyle('B')->getAlignment()->setWrapText(true);
						}
					}
				}
				if ($tempTgl != $v['tgl']) {
					$tempTgl = $v['tgl'];
					$rowTgl = 10;
					$isFirst = false;
				}
				if ($tempKategori != $v['indikator_kategori']) {
					$tempKategori = $v['indikator_kategori'];
					if ($isFirst) {
						$nomor = 1;
						//Indikator
						$countSheet[$sh]->setCellValue($colAlpha[0] . $rowIdx, $v['indikator_kategori'])->mergeCells('A' . $rowIdx . ':BF' . $rowIdx);
						$countSheet[$sh]->setCellValue('BG' . $rowIdx, 'HASIL')->mergeCells('BG' . $rowIdx . ':BJ' . $rowIdx);
						$countSheet[$sh]->setCellValue('BK' . $rowIdx, $v['aksi_persentase'])->mergeCells('BK' . $rowIdx . ':BL' . $rowIdx);
						$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
						$countSheet[$sh]->getStyle('A' . $rowIdx . ':BL' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('66bb6a');
						$rowIdx++;
					}
					$rowTgl++;
				}
			}

			if ($isFirst) {
				$countSheet[$sh]->getStyle('C' . $rowIdx . ':BL' . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$countSheet[$sh]->setCellValue($colAlpha[1] . $rowIdx, $v['indikator_nama']);
				$countSheet[$sh]->getStyle($colAlpha[1] . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
				$countSheet[$sh]->setCellValue($colAlpha[0] . $rowIdx, $nomor);
				$countSheet[$sh]->getStyle($colAlpha[0] . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
				$rowIdx++;
				$nomor++;
			}
			$countSheet[$sh]->setCellValue($colTgl[$v['tgl']][$v['aksi']] . $rowTgl, '√');
			$rowTgl++;

			if ($k == count($list) - 1) {
				$rowIdx++;
				$countSheet[$sh]->setCellValue('AQ' . $rowIdx, 'IPCN')->mergeCells('AQ' . $rowIdx . ':BB' . $rowIdx);
				$countSheet[$sh]->getStyle('AQ' . $rowIdx . ':BB' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$rowIdx++;
				$rowIdx++;
				$rowIdx++;
				$rowIdx++;
				$countSheet[$sh]->setCellValue('AQ' . $rowIdx, '(………………………………………)')->mergeCells('AQ' . $rowIdx . ':BB' . $rowIdx);
				$countSheet[$sh]->getStyle('AQ' . $rowIdx . ':BB' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$ssheet->setActiveSheetIndex(0);
			}
		}




		// $aksi = [];
		// if (isset($aim) && is_array($aim) && count($aim)) {
		// 	foreach ($aim as $ka => $va) {
		// 		if ($va['type'] == 'indikator') {
		// 			continue;
		// 		}
		// 		$aksi[] = $va;
		// 	}
		// }




		// if (isset($list) &&  is_array($list) && count($list)) {

		// 	foreach ($list as $k => $v) {
		// 		$colIdx = 0;

		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, strtoupper($ajm['nama']))->mergeCells('A' . $rowIdx . ':H' . $rowIdx);
		// 		$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$rowIdx++;
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Nama');
		// 		$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['nama']);
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Profesi');
		// 		$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['profesi']);
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Unit');
		// 		$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['ruangan']);
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Tanggal Audit');
		// 		$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['cdate']);
		// 		$rowIdx++;

		// 		//Add table
		// 		// Header
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Jenis Tindakan');
		// 		$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$colIdx++;
		// 		if (isset($aksi) && is_array($aksi) && count($aksi)) {
		// 			foreach ($aksi as $ka => $va) {
		// 				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $va['nama']);
		// 				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 				$colIdx++;
		// 			}
		// 		}

		// 		$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Persentase');
		// 		$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$colIdx++;
		// 		$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Keterangan');
		// 		$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$sheet->getStyle('A' . $rowIdx . ':H' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('66bb6a');

		// 		// Content
		// 		$rowIdx++;
		// 		if (isset($v['value']) && is_array($v['value']) && count($v['value'])) {
		// 			$sumPersen = 0;
		// 			foreach ($v['value'] as $kvalue => $vvalue) {
		// 				$colIdx = 0;
		// 				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $aim[$vvalue['indikator']]['nama']);
		// 				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
		// 				$colIdx++;
		// 				$persentase = 0;
		// 				$ya = 0;
		// 				foreach ($aksi as $ka => $va) {
		// 					if (in_array($va['id'], $vvalue['aksi'])) {
		// 						$ya++;
		// 						$value = 'IYA';
		// 					} else {
		// 						$value = 'TIDAK';
		// 					}
		// 					$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $value);
		// 					$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 					$colIdx++;
		// 				}
		// 				if ($ya) {
		// 					$persentase = $ya / count($aksi) * 100;
		// 					$sumPersen += $persentase;
		// 				}
		// 				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $persentase);
		// 				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 				$colIdx++;
		// 				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 				$colIdx++;

		// 				$rowIdx++;
		// 			}
		// 		}

		// 		$totalPersentase = $sumPersen ? ceil($sumPersen / (count($v['value']) * 100) * 100) : 0;
		// 		$sheet->setCellValue($colAlpha[0] . $rowIdx, 'TOTAL')->mergeCells('A' . $rowIdx . ':F' . $rowIdx);
		// 		$sheet->setCellValue('G' . $rowIdx, $totalPersentase)->mergeCells('G' . $rowIdx . ':H' . $rowIdx);
		// 		$sheet->getStyle('A' . $rowIdx . ':H' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('d7a510');
		// 		$sheet->getStyle('A' . $rowIdx . ':F' . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$sheet->getStyle('G' . $rowIdx . ':H' . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 		$rowIdx++;


		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, 'IPCN')->mergeCells('C' . $rowIdx . ':D' . $rowIdx);
		// 		$rowIdx++;
		// 		$rowIdx++;
		// 		$sheet->setCellValue($colAlpha[2] . $rowIdx, '(………………………………………)')->mergeCells('C' . $rowIdx . ':D' . $rowIdx);
		// 		$rowIdx++;
		// 		$rowIdx++;

		// 		// $sheet->getStyle($colAlpha[0] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
		// 	}
		// }



		if ($ajm['slug'] == 'audit-kepatuhan-apd') {
			$media_dir = 'apd';
		} else {
			$media_dir = 'monev';
		}

		//save file
		$save_dir = $this->__checkDir(date("Y/m"), "media/$media_dir/");
		$save_file = $ajm['slug'];
		if ($mindate != $maxdate) {
			$save_file = $save_file . str_replace('-', '', $mindate) . '-' . str_replace('-', '', $maxdate);
		} else {
			$save_file = $save_file . str_replace('-', '', $mindate);
		}
		$save_file = str_replace(' ', '', str_replace('/', '', $save_file));

		$swriter = $this->ss->newWriter($ssheet);
		if (file_exists($save_dir . '/' . $save_file . '.xlsx')) unlink($save_dir . '/' . $save_file . '.xlsx');
		$swriter->save($save_dir . '/' . $save_file . '.xlsx');

		$download_path = str_replace(SEMEROOT, '/', $save_dir . '/' . $save_file . '.xlsx');
		// echo '<a href="' . base_url($download_path) . '">' . base_url($download_path) . '</a>';
		$this->__forceDownload($save_dir . '/' . $save_file . '.xlsx');
	}

	public function apd()
	{
		$content = $_SESSION['content'];
		// $_SESSION['content'] = null;
		$ajm = $content['data']['ajm'];
		$aim = $content['data']['aim'];
		$list = $content['data']['list'];
		$maxdate = $content['data']['maxdate'];
		$mindate = $content['data']['mindate'];
		// dd($list);
		$newAim = [];
		foreach ($aim as $k => $v) {
			$newAim[$v['id']] = $v;
		}
		$aim = $newAim;

		// Init Spreadsheet
		$ssheet = $this->ss->newSpreadSheet();
		$ssheet->setActiveSheetIndex(0);
		$sheet = $ssheet->getActiveSheet();
		$sheet->setTitle($ajm['nama']);

		$aksi = [];
		if (isset($aim) && is_array($aim) && count($aim)) {
			foreach ($aim as $ka => $va) {
				if ($va['type'] == 'indikator') {
					continue;
				}
				$aksi[] = $va;
			}
		}


		// Get columns excel
		$colAlpha = $this->ss->colAlpha;

		$rowIdx = 1;

		if (isset($list) &&  is_array($list) && count($list)) {

			foreach ($list as $k => $v) {
				$colIdx = 0;

				$sheet->setCellValue($colAlpha[0] . $rowIdx, strtoupper($ajm['nama']))->mergeCells('A' . $rowIdx . ':H' . $rowIdx);
				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$rowIdx++;
				$rowIdx++;
				$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Nama');
				$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
				$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['nama']);
				$rowIdx++;
				$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Profesi');
				$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
				$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['profesi']);
				$rowIdx++;
				$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Unit');
				$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
				$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['ruangan']);
				$rowIdx++;
				$sheet->setCellValue($colAlpha[0] . $rowIdx, 'Tanggal Audit');
				$sheet->setCellValue($colAlpha[1] . $rowIdx, ':');
				$sheet->setCellValue($colAlpha[2] . $rowIdx, $v['cdate']);
				$rowIdx++;

				//Add table
				// Header
				$rowIdx++;
				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Jenis Tindakan');
				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$colIdx++;
				if (isset($aksi) && is_array($aksi) && count($aksi)) {
					foreach ($aksi as $ka => $va) {
						$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $va['nama']);
						$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						$colIdx++;
					}
				}

				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Persentase');
				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$colIdx++;
				$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, 'Keterangan');
				$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$sheet->getStyle('A' . $rowIdx . ':H' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('66bb6a');

				// Content
				$rowIdx++;
				if (isset($v['value']) && is_array($v['value']) && count($v['value'])) {
					$sumPersen = 0;
					foreach ($v['value'] as $kvalue => $vvalue) {
						$colIdx = 0;
						$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $aim[$vvalue['indikator']]['nama']);
						$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold());
						$colIdx++;
						$persentase = 0;
						$ya = 0;
						foreach ($aksi as $ka => $va) {
							if (in_array($va['id'], $vvalue['aksi'])) {
								$ya++;
								$value = 'IYA';
							} else {
								$value = 'TIDAK';
							}
							$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $value);
							$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
							$colIdx++;
						}
						if ($ya) {
							$persentase = $ya / count($aksi) * 100;
							$sumPersen += $persentase;
						}
						$sheet->setCellValue($colAlpha[$colIdx] . $rowIdx, $persentase);
						$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						$colIdx++;
						$sheet->getStyle($colAlpha[$colIdx] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
						$colIdx++;

						$rowIdx++;
					}
				}

				$totalPersentase = $sumPersen ? ceil($sumPersen / (count($v['value']) * 100) * 100) : 0;
				$sheet->setCellValue($colAlpha[0] . $rowIdx, 'TOTAL')->mergeCells('A' . $rowIdx . ':F' . $rowIdx);
				$sheet->setCellValue('G' . $rowIdx, $totalPersentase)->mergeCells('G' . $rowIdx . ':H' . $rowIdx);
				$sheet->getStyle('A' . $rowIdx . ':H' . $rowIdx)->getFill()->setFillType('solid')->getStartColor()->setARGB('d7a510');
				$sheet->getStyle('A' . $rowIdx . ':F' . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$sheet->getStyle('G' . $rowIdx . ':H' . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$rowIdx++;


				$rowIdx++;
				$sheet->setCellValue($colAlpha[2] . $rowIdx, 'IPCN')->mergeCells('G' . $rowIdx . ':H' . $rowIdx);
				$sheet->getStyle('G' . $rowIdx . ':H' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$rowIdx++;
				$rowIdx++;
				$sheet->setCellValue($colAlpha[2] . $rowIdx, '(………………………………………)')->mergeCells('G' . $rowIdx . ':H' . $rowIdx);
				$sheet->getStyle('G' . $rowIdx . ':H' . $rowIdx)->applyFromArray($this->ss->_textBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
				$rowIdx++;
				$rowIdx++;

				// $sheet->getStyle($colAlpha[0] . $rowIdx)->applyFromArray($this->ss->_textBorderBold())->getAlignment()->applyFromArray($this->ss->_textCenter());
			}
		}

		// auto fit columns
		foreach ($sheet->getColumnIterator() as $column) {
			$sheet->getColumnDimension($column->getColumnIndex())->setAutoSize(true);
		}

		if ($ajm['slug'] == 'audit-kepatuhan-apd') {
			$media_dir = 'apd';
		} else {
			$media_dir = 'monev';
		}

		//save file
		$save_dir = $this->__checkDir(date("Y/m"), "media/$media_dir/");
		$save_file = $ajm['slug'];
		if ($mindate != $maxdate) {
			$save_file = $save_file . str_replace('-', '', $mindate) . '-' . str_replace('-', '', $maxdate);
		} else {
			$save_file = $save_file . str_replace('-', '', $mindate);
		}
		$save_file = str_replace(' ', '', str_replace('/', '', $save_file));

		$swriter = $this->ss->newWriter($ssheet);
		if (file_exists($save_dir . '/' . $save_file . '.xlsx')) unlink($save_dir . '/' . $save_file . '.xlsx');
		$swriter->save($save_dir . '/' . $save_file . '.xlsx');

		$download_path = str_replace(SEMEROOT, '/', $save_dir . '/' . $save_file . '.xlsx');
		// echo '<a href="' . base_url($download_path) . '">' . base_url($download_path) . '</a>';
		$this->__forceDownload($save_dir . '/' . $save_file . '.xlsx');
	}
}
