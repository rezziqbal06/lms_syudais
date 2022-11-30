<?php
$admin_foto = '';
if (isset($sess->user->foto)) $admin_foto = $sess->user->foto;
if (empty($admin_foto)) $admin_foto = 'media/pengguna/default.png';
$admin_foto = base_url($admin_foto);
?>
<div id="page-content">
	<!-- Static Layout Header -->
	<div class="content-header">
		<div class="row" style="padding: 0.5em 2em;">
			<div class="col-md-12">
				<div class="btn-group">
					<a id="aback" href="<?= base_url(''); ?>" class="btn btn-default"><i class="fa fa-chevron-left"></i> Kembali</a>
				</div>
			</div>
		</div>
	</div>
	<ul class="breadcrumb breadcrumb-top">
		<li>User</li>
		<li>Profil</li>
	</ul>
	<!-- END Static Layout Header -->

	<!-- Content -->
	<?php if (isset($notif)) { ?>
		<div class="alert alert-info" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<?= $notif ?>
		</div>
	<?php } ?>
	<div class="block full row">
		<div class="block-title">
			<div class="block-options pull-right">
				<button type="button" id="bprofil_foto" href="#" class="btn btn-alt btn-sm btn-default" data-toggle="tooltip" title="Edit Foto Profil" data-original-title="Edit Profil"><i class="fa fa-file-image-o"></i> Ganti Foto</button>
				<button type="button" id="bprofil" href="#" class="btn btn-alt btn-sm btn-default" data-toggle="tooltip" title="Edit Profil" data-original-title="Edit Profil"><i class="fa fa-edit"></i> Edit</button>
			</div>
			<h2><strong>Profil</strong></h2>
		</div>
		<div class="form-group">
			<div class="col-md-3">
				<img src="<?= $admin_foto ?>" style="width: 100%;" class="img-responsive" />
			</div>
			<div class="col-md-3">&nbsp;</div>
			<div class="col-md-6">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Nama</th>
							<td>:</td>
							<td><?= $sess->user->fnama ?></td>
						</tr>
						<tr>
							<th>Username</th>
							<td>:</td>
							<td><?= $sess->user->username ?></td>
						</tr>
						<tr>
							<th>Email</th>
							<td>:</td>
							<td><?= $sess->user->email ?></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<?php if (isset($acm->id)) { ?>

		<div class="block full">
			<div class="block-title">
				<div class="block-options pull-right">
					<button type="button" id="bedit_company" href="#" class="btn btn-alt btn-sm btn-default" data-toggle="tooltip" title="Edit Company" data-original-title="Edit Profil"><i class="fa fa-pencil"></i> Edit</button>
				</div>
				<h4><strong>Informasi Perusahaan</strong></h4>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th class="col-md-2">Nama</th>
								<td class="col-md-1">:</td>
								<td><?= $acm->nama ?? '' ?></td>
							</tr>
							<tr>
								<th>Kode</th>
								<td>:</td>
								<td><?= $acm->kode ?? '' ?></td>
							</tr>
							<tr>
								<th>Alamat</th>
								<td>:</td>
								<td>
									<?= $buam->alamat ?? '' ?><br />
									<?= $buam->alamat2 ?? '' ?><br />
									<?= isset($buam->kelurahan) ? $buam->kelurahan : '' ?? '' ?>
									<?= isset($buam->kecamatan) ? $buam->kecamatan : '' ?? '' ?><br />
									<?= isset($buam->kabkota) ? $buam->kabkota : '' ?? '' ?>
									<?= isset($buam->provinsi) ? $buam->provinsi : '' ?? '' ?><br />
									<?= isset($buam->negara) ? $buam->negara : '' ?? '' ?>
									<?= $buam->kodepos ?? '' ?>
								</td>
							</tr>
							<tr>
								<th>Email</th>
								<td>:</td>
								<td><?= $acm->email ?? $bum->email ?? '' ?></td>
							</tr>
							<tr>
								<th>Telp</th>
								<td>:</td>
								<td><?= $acm->telp ?? $buam->telp ?? '-' ?></td>
							</tr>
							<tr>
								<th>Situs Web</th>
								<td>:</td>
								<td><a href="<?= isset($acm->website) && strlen($acm->website) > 4 ? $acm->website : "#" ?>" target="_blank"><?= isset($acm->website) ? $acm->website . ' <i class="fa fa-external-link"></i></a>' : '-' ?> </td>
							</tr>
							<tr>
								<th>Instagram</th>
								<td>:</td>
								<td><a href="<?= isset($acm->instagram) && strlen($acm->instagram) > 4 ? "https://instagram.com/" . $acm->instagram : "#" ?>" target="_blank"><?= isset($acm->instagram) ? $acm->instagram . ' <i class="fa fa-external-link"></i></a>' : '-' ?> </td>
							</tr>
							<tr>
								<th>LinkedIn</th>
								<td>:</td>
								<td><a href="<?= isset($acm->linkedin) && strlen($acm->linkedin) > 4 ? $acm->linkedin : "#" ?>" target="_blank"><?= isset($acm->linkedin) ? $acm->linkedin . ' <i class="fa fa-external-link"></i></a>' : '-' ?> </td>
							</tr>
							<tr>
								<th>Status</th>
								<td>:</td>
								<td><?= !empty($acm->is_active) ? '<label class="label label-success">Aktif</label>' : '<label class="label label-default">Tidak Aktif</label>' ?></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	<?php } ?>

	<?php if (isset($sess->user->apikey) && strlen($sess->user->apikey)) { ?>

		<div class="block full">
			<div class="block-title">
				<div class="block-options pull-right">
				</div>
				<h4><strong>Apikey</strong></h4>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="input-group">
						<input type="text" readonly name="apikey" class="form-control" placeholder="apikey" value="<?= $sess->user->apikey ?>">
						<div class="input-group-btn">
							<button id="btn_regenerate" class="btn btn-primary">Re-Generate</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<?php } ?>


	<!-- END Content -->
</div>