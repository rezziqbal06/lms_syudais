<!-- modal profil foto -->
<div id="modal_profil_foto" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Ganti Foto</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form id="fmodal_profil_foto" method="post" enctype="multipart/form-data" action="<?= base_url('profil/edit_foto') ?>">
					<div class="form-group">
						<input id="iprofil_foto" type="file" name="foto" class="form-control" required />
					</div>
					<div class="form-group form-actions">
						<button type="submit" value="Submit" class="btn btn-primary btn-submit btn-block">Ganti Foto <i class="fa fa-upload icon-submit"></i></button>
					</div>
				</form>
			</div>
			<!-- Modal Body -->

		</div>
	</div>
</div>
<!-- end modal profil foto -->

<!-- modal profil edit -->
<div id="modal_profil_edit" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Edit Profil</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form id="fmodal_profil_edit" method="post" enctype="multipart/form-data" action="<?= base_url('profil/edit') ?>" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-12">
							<label for="imodal_profil_edit_nama">Nama *</label>
							<input id="imodal_profil_edit_nama" type="text" name="fnama" class="form-control" value="<?= $sess->user->fnama ?>" required />
						</div>
						<div class="col-md-12">
							<label for="imodal_profil_edit_email">Email *</label>
							<input id="imodal_profil_edit_email" type="text" name="email" class="form-control" value="<?= $sess->user->email ?>" required />
						</div>
						<div class="col-md-12">
							<label for="imodal_profil_edit_username">Username *</label>
							<input id="imodal_profil_edit_username" type="text" name="username" class="form-control" minlength="6" value="<?= $sess->user->username ?>" required />
						</div>
					</div>
					<div class="form-group form-actions">
						<button type="submit" value="Submit" class="btn btn-primary btn-submit btn-block">Simpan Perubahan <i class="fa fa-upload icon-submit"></i></button>
					</div>
				</form>
			</div>
			<!-- Modal Body -->

		</div>
	</div>
</div>
<!-- end modal profil edit -->


<!-- modal company edit -->
<div id="modal_company_edit" class="modal fade" tabindex="" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Edit Perusahaan</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form id="fmodal_company_edit" method="post" enctype="multipart/form-data" action="" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-6">
							<input type="hidden" name="b_user_id_owner" value="<?= $sess->user->id ?? '' ?>">
							<input type="hidden" name="b_user_id" value="<?= $sess->user->id ?? '' ?>">
							<input type="hidden" name="b_user_alamat_id" value="<?= $buam->id ?? '' ?>">
						</div>
						<div class="col-md-10">
							<label for="inama" class="control-label">Nama Reseller *</label>
							<input id="inama" class="form-control" name="nama" placeholder="Nama Perusahaan / Cabang / Departemen / Vendor" required />
						</div>
						<div class="col-md-2">
							<label for="ikode" class="control-label">Kode</label>
							<input id="ikode" class="form-control" name="kode" placeholder="Kode Perusahaan" minlenght="12" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="isubdomain" class="control-label">Default Subdomain *</label>
							<div class="input-group">
								<div class="input-group-addon">
									HTTPS://
								</div>
								<input id="isubdomain" class="form-control" name="subdomain" placeholder="Subdomain" maxlength="48" required />
								<div class="input-group-addon">
									<?php $main_domain = parse_url(base_url()); ?>
									<?= '.' . $main_domain['host'] ?>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<label for="idomain" class="control-label">Domain <i class="fa fa-question-circle"></i></label>
							<div class="input-group">
								<div class="input-group-addon">
									HTTPS://
								</div>
								<input id="idomain" class="form-control" name="domain" placeholder="domain, eg: google.com" maxlength="63" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-3">
							<label for="iis_active" class="control-label">IS Active</label>
							<select id="iis_active" name="is_active" class="form-control">
								<option value="1" <?= isset($acm->is_active) && $acm->is_active ? 'selected' : '' ?>>Aktif</option>
								<option value="0" <?= isset($acm->is_active) && !$acm->is_active ? 'selected' : '' ?>>Tidak Aktif</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="iis_vendor" class="control-label">Vendor?</label>
							<select id="iis_vendor" name="is_vendor" class="form-control">
								<option value="0">Bukan</option>
								<option value="1">Iya</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12">
							<label for="isite_title" class="control-label">Site Title</label>
							<input id="isite_title" class="form-control" name="site_title" placeholder="Site Title" maxlength="72" />
						</div>
						<div class="col-md-12">
							<label for="isite_title_suffix" class="control-label">Site Title Suffix</label>
							<input id="isite_title_suffix" class="form-control" name="site_title_suffix" placeholder="Site Title Suffix" maxlength="42" />
						</div>
						<div class="col-md-12">
							<label for="isite_description" class="control-label">Site Description</label>
							<textarea id="isite_description" class="form-control" name="site_description" placeholder="Site Description" rows="4" maxlength="160"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-6">
							<label for="ialamat_select" class="control-label">Cari Alamat</label>
							<select id="ialamat_select" class="form-control select2" style="width: 100%;"></select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="inegara">Negara *</label>
							<input id="inegara" class="form-control" name="negara" value="INDONESIA" required>
						</div>
						<div class="col-md-4">
							<label for="iprovinsi">Provinsi *</label>
							<input id="iprovinsi" class="form-control" name="provinsi" required>
						</div>
						<div class="col-md-4">
							<label for="ikabkota">Kabupaten / Kota *</label>
							<input id="ikabkota" class="form-control" name="kabkota" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="ikecamatan">Kecamatan *</label>
							<input id="ikecamatan" class="form-control" name="kecamatan" required>
						</div>
						<div class="col-md-4">
							<label for="ikelurahan">Desa / Kelurahan *</label>
							<input id="ikelurahan" class="form-control" name="kelurahan" required>
						</div>
						<div class="col-md-4">
							<label for="ialamat">Alamat *</label>
							<textarea id="ialamat" class="form-control" name="alamat" required></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="ikodepos" class="control-label">Kodepos *</label>
							<input id="ikodepos" class="form-control " name="kodepos" placeholder="Kodepos" required>
						</div>
						<div class="col-md-4">
							<label for="ikode_origin" class="control-label">Kode Origin *</label>
							<input id="ikode_origin" class="form-control" name="kode_origin" placeholder="Kode Origin" readonly required>
						</div>
						<div class="col-md-4">
							<label for="ikode_destination" class="control-label">Kode Destination *</label>
							<input id="ikode_destination" class="form-control" name="kode_destination" placeholder="Kode Destination" readonly required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="iitelp" class="control-label">Telepon</label>
							<input id="iitelp" type="number" class="form-control" name="telp" placeholder="Telepon Perusahaan" />
						</div>
						<div class="col-md-4">
							<label for="iemail" class="control-label">Email</label>
							<input id="iemail" type="email" class="form-control" name="email" placeholder="Email Perusahaan" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="iewebsite" class="control-label">Website</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-globe"></i>
								</div>
								<input id="iewebsite" class="form-control " name="website" placeholder="cth: https://example.com/" />
							</div>
						</div>
						<div class="col-md-4">
							<label for="ienstagram" class="control-label">Instagram</label>
							<div class="input-group">
								<div class="input-group-addon">
									@
								</div>
								<input id="ienstagram" class="form-control " name="instagram" placeholder="username" />
							</div>
						</div>
						<div class="col-md-4">
							<label for="ielinkedin" class="control-label">LinkedIn</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-linkedin"></i>
								</div>
								<input id="ielinkedin" class="form-control " name="linkedin" placeholder="cth: https://linkedin.com/example-company/" />
							</div>
						</div>
					</div>
					<div class="form-group">

					</div>
					<div class="form-group form-actions">
						<button type="submit" value="Submit" class="btn btn-primary btn-submit btn-block">Simpan Perubahan <i class="fa fa-upload icon-submit"></i></button>
					</div>
				</form>
			</div>
			<!-- Modal Body -->

		</div>
	</div>
</div>
<!-- end modal company edit -->