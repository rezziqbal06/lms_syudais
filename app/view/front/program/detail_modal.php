<style>
	div::-webkit-scrollbar-track {
		background-color: var(--primary);
	}

	div::-webkit-scrollbar-thumb {
		background-color: #babac0;
		border-radius: 16px;
		border: 5px solid var(--primary);
	}
</style>
<!-- modal option -->
<div id="modal_option" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Aksi </h2>
				<h5 id="tvjabatan"></h5>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 btn-group-vertical">
						<!-- <a id="adetail" href="#" class="btn btn-info btn-left"><i class="fa fa-info-circle"></i> Detail</a> -->
						<a id="editprofil" href="#" class="btn btn-info bg-secondary btn-left"><i class="fa fa-pencil"></i> Edit Profil</a>
						<!-- <a id="areseller" href="#" class="btn btn-warning btn-left"><i class="fa fa-user"></i> Jadikan Reseller</a> -->
						<a id="changepass" href="#" class="btn btn-danger bg-primary btn-left"><i class="fa fa-key"></i> Ubah Password</a>
					</div>
				</div>
				<div class="row" style="margin-top: 1em; ">
					<div class="col-md-12" style="border-top: 1px #afafaf dashed;">&nbsp;</div>
					<div class="col-xs-12 btn-group-vertical" style="">
						<button type="button" class="btn btn-default btn-block text-left" data-dismiss="modal" id="btn_close_modal"><i class="fa fa-close"></i> Tutup</button>
					</div>
				</div>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
</div>
<!-- modal tambah  -->
<div id="modal_tambah_jadwal" class="modal fade " role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Tambah Jadwal</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="ftambah_jadwal">
					<div class="form-group row">
						<input type="hidden" id="ia_program_id" name="a_program_id" value="<?= $apm->id ?>">
						<div class="col-md-4">
							<label for="inama" class="control-label">Nama Kegiatan</label>
							<input id="inama" type="text" name="nama" value="<?= $apm->nama ?>" class="form-control">
						</div>
						<div class="col-md-8">
							<label for="ideskripsi" class="control-label">Deskripsi</label>
							<textarea type="text" id="ideskripsi" class="form-control" name="deskripsi" value=""></textarea>
						</div>
						<div class="col-md-4">
							<label for="ib_user_id_narasumber" class="control-label">Narasumber*</label>
							<select type="text" id="ib_user_id_narasumber" class="form-control select2" style="width: 100% !important;" name="b_user_id_narasumber" value="" onchange="$('#inarasumber').val($(this).find('option:selected').attr('data-nama'))" required>
								<option value="">-- pilih narasumber --</option>
								<?php if (isset($bum[0])) : ?>
									<?php foreach ($bum as $k => $v) : ?>
										<option value="<?= $v->id ?>" data-nama="<?= $v->fnama ?>"><?= $v->fnama ?></option>
									<?php endforeach ?>
								<?php endif ?>
							</select>
							<input type="hidden" id="inarasumber" name="narasumber">
						</div>
						<div class="col-md-4">
							<label for="ia_jabatan_id_sasaran" class="control-label">Sasaran*</label>
							<select type="text" id="ia_jabatan_id_sasaran" class="form-control select2" style="width: 100% !important;" name="a_jabatan_id_sasaran" value="" onchange="$('#isasaran').val($(this).find('option:selected').attr('data-nama'))" required>
								<option value="">-- pilih sasaran --</option>
								<?php if (isset($ajm[0])) : ?>
									<?php foreach ($ajm as $k => $v) : ?>
										<option value="<?= $v->id ?>" data-nama="<?= $v->nama ?>"><?= $v->nama ?></option>
									<?php endforeach ?>
								<?php endif ?>
							</select>
							<input type="hidden" id="isasaran" name="sasaran">
						</div>
						<div class="col-md-4">
							<label for="itempat" class="control-label">Tempat*</label>
							<input type="text" id="itempat" class="form-control" name="tempat" placeholder="Ex: Masjid/Gedung/Rumah" value="" required>
						</div>
						<div class="col-md-12 mt-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="1" id="iis_rutin" name="is_rutin">
								<label class="form-check-label" for="iis_rutin">
									Kegiatan Rutin
								</label>
							</div>
						</div>
						<div class="col-6 panel-rutin" style="display: none;">
							<label for="ihari">Hari rutin*</label>
							<select id="ihari" class="form-control select2" name="hari" style="width: 100%">
								<option value="1">Setiap Senin</option>
								<option value="2">Setiap Selasa</option>
								<option value="3">Setiap Rabu</option>
								<option value="4">Setiap Kamis</option>
								<option value="5">Setiap Jum'at</option>
								<option value="6">Setiap Sabtu</option>
								<option value="7">Setiap Ahad</option>
							</select>
						</div>
						<div class="col-6 panel-not-rutin">
							<label for="isdate" class="control-label">Tanggal Mulai*</label>
							<input type="text" id="isdate" autocomplete="off" class="form-control datepicker" name="sdate" value="" required>
						</div>
						<div class="col-6 panel-not-rutin">
							<label for="iedate" class="control-label">Tanggal Akhir</label>
							<input type="text" id="iedate" autocomplete="off" class="form-control datepicker" name="edate" value="">
						</div>
						<div class="col-6">
							<label for="istime" class="control-label">Waktu Mulai*</label>
							<input type="text" id="istime" autocomplete="off" class="form-control" placeholder="ex: 07:00" name="stime" value="" required>
						</div>
						<div class="col-6">
							<label for="ietime" class="control-label">Waktu Akhir*</label>
							<input type="text" id="ietime" autocomplete="off" class="form-control" placeholder="ex: 07:00" name="etime" value="" required>
						</div>
						<div class="col-12">
							<label for="ialamat" class="control-label">Alamat</label>
							<textarea type="text" id="ialamat" class="form-control" name="alamat" value=""></textarea>
						</div>
					</div>
					<div class="row" style="margin-top: 1em; ">
						<div class="col-md-12" style="border-top: 1px #afafaf dashed;">&nbsp;</div>
						<div class="col-xs-12 btn-group-vertical" style="">
							<button type="submit" class="btn btn-default btn-block text-left" data-dismiss="modal"><i class="fa fa-save"></i> Simpan</button>
						</div>
					</div>
				</form>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
</div>

<!-- modal edit -->
<div id="modal_edit_jadwal" class="modal fade " role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Edit Jadwal</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="fedit_jadwal">
					<div class="form-group row">
						<input type="hidden" id="ieid" name="">
						<input type="hidden" id="iea_program_id" name="a_program_id" value="<?= $apm->id ?>">
						<div class="col-md-4">
							<label for="ienama" class="control-label">Nama Kegiatan</label>
							<input id="ienama" type="text" name="nama" value="<?= $apm->nama ?>" class="form-control">
						</div>
						<div class="col-md-8">
							<label for="iedeskripsi" class="control-label">Deskripsi</label>
							<textarea type="text" id="iedeskripsi" class="form-control" name="deskripsi" value=""></textarea>
						</div>
						<div class="col-md-4">
							<label for="ieb_user_id_narasumber" class="control-label">Narasumber*</label>
							<select type="text" id="ieb_user_id_narasumber" class="form-control select2" style="width: 100% !important;" name="b_user_id_narasumber" value="" onchange="$('#ienarasumber').val($(this).find('option:selected').attr('data-nama'))" required>
								<option value="">-- pilih narasumber --</option>
								<?php if (isset($bum[0])) : ?>
									<?php foreach ($bum as $k => $v) : ?>
										<option value="<?= $v->id ?>" data-nama="<?= $v->fnama ?>"><?= $v->fnama ?></option>
									<?php endforeach ?>
								<?php endif ?>
							</select>
							<input type="hidden" id="ienarasumber" name="narasumber">
						</div>
						<div class="col-md-4">
							<label for="iea_jabatan_id_sasaran" class="control-label">Sasaran*</label>
							<select type="text" id="iea_jabatan_id_sasaran" class="form-control select2" style="width: 100% !important;" name="a_jabatan_id_sasaran" value="" onchange="$('#iesasaran').val($(this).find('option:selected').attr('data-nama'))" required>
								<option value="">-- pilih sasaran --</option>
								<?php if (isset($ajm[0])) : ?>
									<?php foreach ($ajm as $k => $v) : ?>
										<option value="<?= $v->id ?>" data-nama="<?= $v->nama ?>"><?= $v->nama ?></option>
									<?php endforeach ?>
								<?php endif ?>
							</select>
							<input type="hidden" id="iesasaran" name="sasaran">
						</div>
						<div class="col-md-4">
							<label for="ietempat" class="control-label">Tempat*</label>
							<input type="text" id="ietempat" class="form-control" name="tempat" placeholder="Ex: Masjid/Gedung/Rumah" value="" required>
						</div>
						<div class="col-md-12 mt-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="1" id="ieis_rutin" name="is_rutin">
								<label class="form-check-label" for="ieis_rutin">
									Kegiatan Rutin
								</label>
							</div>
						</div>
						<div class="col-6 panel-rutin" style="display: none;">
							<label for="iehari">Hari rutin*</label>
							<select id="iehari" class="form-control select2" name="hari" style="width: 100%">
								<option value="1">Setiap Senin</option>
								<option value="2">Setiap Selasa</option>
								<option value="3">Setiap Rabu</option>
								<option value="4">Setiap Kamis</option>
								<option value="5">Setiap Jum'at</option>
								<option value="6">Setiap Sabtu</option>
								<option value="7">Setiap Ahad</option>
							</select>
						</div>
						<div class="col-6 panel-not-rutin">
							<label for="iesdate" class="control-label">Tanggal Mulai*</label>
							<input type="text" id="iesdate" autocomplete="off" class="form-control datepicker" name="sdate" value="" required>
						</div>
						<div class="col-6 panel-not-rutin">
							<label for="ieedate" class="control-label">Tanggal Akhir</label>
							<input type="text" id="ieedate" autocomplete="off" class="form-control datepicker" name="edate" value="">
						</div>
						<div class="col-6">
							<label for="iestime" class="control-label">Waktu Mulai*</label>
							<input type="text" id="iestime" autocomplete="off" class="form-control" placeholder="ex: 07:00" name="stime" value="" required>
						</div>
						<div class="col-6">
							<label for="ieetime" class="control-label">Waktu Akhir*</label>
							<input type="text" id="ieetime" autocomplete="off" class="form-control" placeholder="ex: 07:00" name="etime" value="" required>
						</div>
						<div class="col-12">
							<label for="iealamat" class="control-label">Alamat</label>
							<textarea type="text" id="iealamat" class="form-control" name="alamat" value=""></textarea>
						</div>
					</div>
					<div class="row" style="margin-top: 1em; ">
						<div class="col-md-12" style="border-top: 1px #afafaf dashed;">&nbsp;</div>
						<div class="col-xs-12 btn-group-vertical" style="">
							<button type="submit" class="btn btn-default btn-block text-left" data-dismiss="modal"><i class="fa fa-save"></i> Simpan</button>
						</div>
					</div>
				</form>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
</div>
<!-- modal detail  -->
<div id="modal_detail_jadwal" class="modal fade " role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 id="dnama" class="modal-title">Detail Jadwal</h2>
				<div class="btn-group float-end">

					<?php if (isset($permissions['update_jadwal'])) : ?>
						<button id="edit_jadwal" class="btn bg-white"><i class="fa fa-pencil"></i></button>
					<?php endif ?>
					<?php if (isset($permissions['hapus_jadwal'])) : ?>
						<button id="hapus_jadwal" class="btn bg-danger"><i class="fa fa-trash text-white"></i></button>
					<?php endif ?>
				</div>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-12">
						<small id="ddeskripsi"></small>
					</div>
					<div class="col-6 col-md-4">
						<label class=""><img src="<?= base_url('media/user.svg') ?>" alt="clock" width="18px"><span style="color: #b7b7b7 !important;"> Narasumber</span></label>
						<p><b class="ms-1" style="font-size:0.8rem !important;" id="dnarasumber"></b></p>
					</div>
					<div class="col-6 col-md-4">
						<label class=""><img src="<?= base_url('media/users.svg') ?>" alt="clock" width="18px"><span style="color: #b7b7b7 !important;"> Sasaran</span></label>
						<p><b class="ms-1" style="font-size:0.8rem !important;" id="dsasaran"></b></p>
					</div>
					<div class="col-6 col-md-4">
						<label class=""><img src="<?= base_url('media/calendar.svg') ?>" alt="clock" width="18px"><span style="color: #b7b7b7 !important;"> Tanggal</span></label>
						<p class="ms-1" style="font-size:0.8rem !important;"><b id="dsdate_text"></b> <b id="dedate_text"></b></p>
					</div>
					<div class="col-6 col-md-4">
						<label class=""><img src="<?= base_url('media/clock.svg') ?>" alt="clock" width="18px"><span style="color: #b7b7b7 !important;"> Waktu</span></label>
						<p class="ms-1" style="font-size:0.8rem !important;"><b id="dstime"></b> <b id="detime"></b></p>
					</div>
					<div class="col-12 col-md-4">
						<label class=""><img src="<?= base_url('media/home.svg') ?>" alt="clock" width="18px"><span style="color: #b7b7b7 !important;"> Tempat</span></label>
						<p class="ms-1" style="font-size:0.8rem !important;"><b id="dtempat"></b></p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 card bg-primary p-5 " style="height: 30rem;">
						<div class="row" id="panel_absen" style="overflow-y: scroll;">

						</div>
					</div>
				</div>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
</div>