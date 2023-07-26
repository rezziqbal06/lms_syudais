<style>
	.select2 {
		width: 100% !important;
	}

	.multiple-select {
		border-radius: 4px;
	}

	/* .choices__list--multiple .choices__item {
		background-color: #ffc107;
		border: 1px solid #ffc107;
	} */

	.choices[data-type*=select-multiple] .choices__button,
	.choices[data-type*=text] .choices__button {
		border-left: 1px solid white;
	}
</style>
<div id="page-content">
	<!-- Static Layout Header -->
	<div class="content-header">
		<div class="row" style="">
			<div class="col-md-6"></div>
			<div class="col-md-6">
				<div class="btn-group pull-right">
					<a id="" type="button" href="history.back()" class="btn btn-primary btn-submit">Kembali</a>
				</div>
			</div>
		</div>
	</div>

	<form method="POST" id="ftambah">
		<!-- Content -->
		<div class="card">

			<div class="card-header">
				<h6><strong>Module - Jabatan: <?= $ajm->nama ?></strong></h6>
			</div>
			<div class="card-body">

				<input type="hidden" name="a_jabatan_id" value="<?= $ajm->id ?>">
				<?php if (isset($apm) && count($apm)) {
					foreach ($apm as $k => $v) { ?>
						<div class="row">
							<div class="col-md-4">
								<input type="hidden" name="a_program_id[]" value="<?= $v->id ?>">
								<p><?= ($k + 1) ?>. <?= $v->nama ?></p>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-12">
										<div class="form-check">
											<input class="form-check-input btn-all" type="checkbox" value="" id="all_<?= $v->id ?>" data-id="<?= $v->id ?>" data-feat="jadwal">
											<label class="form-check-label" for="all_<?= $v->id ?>">
												<b>all</b>
											</label>
										</div>
									</div>
									<div class="col-6 col-md-3">
										<hr>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-sub-all" type="checkbox" value="" id="all_<?= $v->id ?>_jadwal" data-id="<?= $v->id ?>" data-feat="jadwal">
											<label class="form-check-label" for="all_<?= $v->id ?>_jadwal">
												<b>jadwal</b>
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-jadwal" type="checkbox" value="melihat_jadwal" name="type_<?= $v->id ?>[]" id="melihat_<?= $v->id ?>_jadwal" data-id="<?= $v->id ?>" data-feat="jadwal" <?= isset($bumm["$v->id-melihat_jadwal"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="melihat_<?= $v->id ?>_jadwal">
												melihat
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-jadwal" type="checkbox" value="update_jadwal" name="type_<?= $v->id ?>[]" id="update_<?= $v->id ?>_jadwal" data-id="<?= $v->id ?>" data-feat="jadwal" <?= isset($bumm["$v->id-update_jadwal"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="update_<?= $v->id ?>_jadwal">
												update
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-jadwal" type="checkbox" value="hapus_jadwal" name="type_<?= $v->id ?>[]" id="hapus_<?= $v->id ?>_jadwal" data-id="<?= $v->id ?>" data-feat="jadwal" <?= isset($bumm["$v->id-hapus_jadwal"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="hapus_<?= $v->id ?>_jadwal">
												hapus
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-jadwal" type="checkbox" value="export_jadwal" name="type_<?= $v->id ?>[]" id="export_<?= $v->id ?>_jadwal" data-id="<?= $v->id ?>" data-feat="jadwal" <?= isset($bumm["$v->id-export_jadwal"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="export_<?= $v->id ?>_jadwal">
												export
											</label>
										</div>
									</div>
									<div class="col-6 col-md-3">
										<hr>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-sub-all" type="checkbox" value="" id="all_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara">
											<label class="form-check-label" for="all_<?= $v->id ?>_berita_acara">
												<b>berita acara</b>
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-berita_acara" type="checkbox" value="melihat_berita_acara" name="type_<?= $v->id ?>[]" id="melihat_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara" <?= isset($bumm["$v->id-melihat_berita_acara"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="melihat_<?= $v->id ?>_berita_acara">
												melihat
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-berita_acara" type="checkbox" value="update_berita_acara" name="type_<?= $v->id ?>[]" id="update_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara" <?= isset($bumm["$v->id-update_berita_acara"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="update_<?= $v->id ?>_berita_acara">
												update
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-berita_acara" type="checkbox" value="hapus_berita_acara" name="type_<?= $v->id ?>[]" id="hapus_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara" <?= isset($bumm["$v->id-hapus_berita_acara"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="hapus_<?= $v->id ?>_berita_acara">
												hapus
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-berita_acara" type="checkbox" value="komentar_berita_acara" name="type_<?= $v->id ?>[]" id="komentar_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara" <?= isset($bumm["$v->id-komentar_berita_acara"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="komentar_<?= $v->id ?>_berita_acara">
												komentar
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-berita_acara" type="checkbox" value="export_berita_acara" name="type_<?= $v->id ?>[]" id="export_<?= $v->id ?>_berita_acara" data-id="<?= $v->id ?>" data-feat="berita_acara" <?= isset($bumm["$v->id-export_berita_acara"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="export_<?= $v->id ?>_berita_acara">
												export
											</label>
										</div>
									</div>
									<div class="col-6 col-md-3">
										<hr>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-sub-all" type="checkbox" value="" id="all_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas">
											<label class="form-check-label" for="all_<?= $v->id ?>_tugas">
												<b>tugas</b>
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="melihat_tugas" name="type_<?= $v->id ?>[]" id="melihat_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-melihat_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="melihat_<?= $v->id ?>_tugas">
												melihat
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="update_tugas" name="type_<?= $v->id ?>[]" id="update_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-update_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="update_<?= $v->id ?>_tugas">
												update
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="hapus_tugas" name="type_<?= $v->id ?>[]" id="hapus_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-hapus_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="hapus_<?= $v->id ?>_tugas">
												hapus
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="komentar_tugas" name="type_<?= $v->id ?>[]" id="komentar_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-komentar_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="komentar_<?= $v->id ?>_tugas">
												komentar
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="mengerjakan_tugas" name="type_<?= $v->id ?>[]" id="mengerjakan_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-mengerjakan_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="mengerjakan_<?= $v->id ?>_tugas">
												mengerjakan
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="rate_tugas" name="type_<?= $v->id ?>[]" id="rate_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-rate_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="rate_<?= $v->id ?>_tugas">
												memberi nilai
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-tugas" type="checkbox" value="export_tugas" name="type_<?= $v->id ?>[]" id="export_<?= $v->id ?>_tugas" data-id="<?= $v->id ?>" data-feat="tugas" <?= isset($bumm["$v->id-export_tugas"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="export_<?= $v->id ?>_tugas">
												export
											</label>
										</div>
									</div>
									<div class="col-6 col-md-3">
										<hr>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-sub-all" type="checkbox" value="" id="all_<?= $v->id ?>_absensi" data-id="<?= $v->id ?>" data-feat="absensi">
											<label class="form-check-label" for="all_<?= $v->id ?>_absensi">
												<b>absensi</b>
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-absensi" type="checkbox" value="melihat_absensi" name="type_<?= $v->id ?>[]" id="melihat_<?= $v->id ?>_absensi" data-id="<?= $v->id ?>" data-feat="absensi" <?= isset($bumm["$v->id-melihat_absensi"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="melihat_<?= $v->id ?>_absensi">
												melihat
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-absensi" type="checkbox" value="update_absensi" name="type_<?= $v->id ?>[]" id="update_<?= $v->id ?>_absensi" data-id="<?= $v->id ?>" data-feat="absensi" <?= isset($bumm["$v->id-update_absensi"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="update_<?= $v->id ?>_absensi">
												update
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-absensi" type="checkbox" value="hapus_absensi" name="type_<?= $v->id ?>[]" id="hapus_<?= $v->id ?>_absensi" data-id="<?= $v->id ?>" data-feat="absensi" <?= isset($bumm["$v->id-hapus_absensi"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="hapus_<?= $v->id ?>_absensi">
												hapus
											</label>
										</div>
										<div class="form-check">
											<input class="form-check-input btn-module-<?= $v->id ?> btn-module-<?= $v->id ?>-absensi" type="checkbox" value="export_absensi" name="type_<?= $v->id ?>[]" id="export_<?= $v->id ?>_absensi" data-id="<?= $v->id ?>" data-feat="absensi" <?= isset($bumm["$v->id-export_absensi"]) ? 'checked' : '' ?>>
											<label class="form-check-label" for="export_<?= $v->id ?>_absensi">
												export
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
				<?php }
				} ?>
				<div class="row">
					<div class="col-md-12">
						<button type="submit" class="btn btn-success float-end">Simpan</button>
					</div>
				</div>
			</div>

		</div>
	</form>

</div>