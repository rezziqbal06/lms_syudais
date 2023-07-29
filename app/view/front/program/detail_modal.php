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
				<form action="" method="POST" id="fedit-profil">
					<div class="form-group row">
						<div class="col-md-8">
							<label for="inama" class="control-label">Nama Kegiatan</label>
							<input id="inama" type="text" name="nama" value="" class="form-control" required>
						</div>
						<div class="col-md-4">
							<label for="islug" class="control-label">Slug</label>
							<input id="islug" type="text" name="slug" value="" class="form-control" readonly required>
						</div>
						<div class="col-12">
							<label for="ideskripsi" class="control-label">Deskripsi</label>
							<textarea type="text" id="ideskripsi" class="form-control" name="deskripsi" value="" required></textarea>
						</div>
						<div class="col-md-4">
							<label for="inarasumber" class="control-label">Narasumber</label>
							<input type="text" id="inarasumber" class="form-control" name="narasumber" value="" required>
						</div>
						<div class="col-md-4">
							<label for="isasaran" class="control-label">Sasaran</label>
							<input type="text" id="isasaran" class="form-control" name="sasaran" value="" required>
						</div>
						<div class="col-md-4">
							<label for="itempat" class="control-label">Tempat</label>
							<input type="text" id="itempat" class="form-control" name="tempat" placeholder="Ex: Masjid/Gedung/Rumah" value="" required>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="isdate" class="control-label">Tanggal Mulai</label>
								<input type="text" id="isdate" class="form-control datepicker" name="sdate" value="" required>
							</div>
							<div class="col-6">
								<label for="iedate" class="control-label">Tanggal Akhir</label>
								<input type="text" id="iedate" class="form-control datepicker" name="edate" value="">
							</div>
							<div class="col-6">
								<label for="istime" class="control-label">Waktu Mulai</label>
								<input type="text" id="istime" class="form-control timepicker" name="stime" value="" required>
							</div>
							<div class="col-6">
								<label for="ietime" class="control-label">Waktu Akhir</label>
								<input type="text" id="ietime" class="form-control timepicker" name="etime" value="" required>
							</div>
							<div class="col-12">
								<label for="ialamat" class="control-label">Alamat</label>
								<textarea type="text" id="ialamat" class="form-control" name="alamat" value="" required></textarea>
							</div>
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
				<h2 class="modal-title">Tambah Jadwal</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="fedit-profil">
					<div class="row">
						<div class="form-group">
							<input type="hidden" name="id" id="ieid" value="<?= $ue->id ?? '' ?>">
							<div class="col-md-12">
								<label for="iefnama" class="control-label">Nama Lengkap</label>
								<input id="iefnama" type="text" name="fnama" value="<?= $ue->fnama ?? '' ?>" class="form-control" required>
							</div>
							<div class="col-md-12">
								<label for="ietelp" class="control-label">No. Telpon</label>
								<input type="text" id="ietelp" class="form-control" name="telp" value="<?= $ue->telp ?? '' ?>" required>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label for="ieemail" class="control-label">Email</label>
									<input type="text" id="ieemail" class="form-control" name="email" value="<?= $ue->email ?? '' ?>" required>
								</div>
							</div>
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