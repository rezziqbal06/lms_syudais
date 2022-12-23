<!-- modal option -->
<div id="modal_option" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Aksi </h2>
				<h5 id="t"></h5>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 btn-group-vertical">
						<a id="adetail" href="#" class="btn btn-info btn-left"><i class="fa fa-info"></i> Detail</a>
						<a id="aedit" href="#" class="btn btn-primary btn-left"><i class="fa fa-pencil"></i> Edit</a>
						<button id="bhapus" type="button" class="btn btn-danger btn-left btn-submit"><i class="fa fa-trash-o icon-submit"></i> Hapus</button>
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

<!-- modal tambah -->
<div id="modal_tambah" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Tambah</h2>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="ftambah">
					<div class="row">
						<div class="form-group">
							<div class="row">
								<div class="col-md-6">
									<label for="inama" class="control-label">Nama</label>
									<input id="inama" type="text" name="nama" class="form-control" required>
								</div>
								<div class="col-md-6">
									<label for="islug" class="control-label">Slug</label>
									<input id="islug" type="text" name="slug" class="form-control" required>
								</div>
								<div class="col-md-12">
									<label for="ideskripsi" class="control-label">Deskripsi</label>
									<textarea name="deskripsi" id="ideskripsi" class="form-control" cols="30" rows="10"></textarea>
								</div>
							</div>
						</div>
						<div class="form-group">

							<div class="row">
								<table class="my_table mt-3">
									<thead>
										<tr>
											<th rowspan="2">Aksi</th>
											<th rowspan="2" class="">Kategori</th>
											<th rowspan="2" class="">Sub Kategori</th>
											<th rowspan="2" class="">Nama</th>
											<th rowspan="2" class="">Tipe</th>
											<th rowspan="2" class="">Ruangan</th>
										</tr>
									</thead>
									<tbody id="panel_indikator_tambah">
										<tr id="row_indikator_tambah_0" class="row-indikator-tambah" data-id="0">
											<td>
												<button style="display: none;" type="button" class="btn btn-xs btn-danger btn-remove-row"><i class="fa fa-close"></i></button>
											</td>
											<td>
												<div class="form-group">
													<input id="ikategori_0" type="text" name="kategori[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<input id="isubkategori_0" type="text" name="subkategori[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<input id="inama_indikator_0" type="text" name="nama_indikator[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<select id="itype_0" type="text" name="type[]" class="form-control">
														<option value="indikator">indikator</option>
														<option value="aksi">aksi</option>
													</select>
												</div>
											</td>
											<td>
												<div class="form-group">
													<select id="ia_ruangan_ids_0" type="text" name="a_ruangan_ids_0[]" multiple class="form-select">
														<option value="">-- Tidak ada --</option>
														<?php foreach ($ruangans as $r) { ?>
															<option value="<?= $r->id ?>"><?= $r->nama ?></option>
														<?php } ?>
													</select>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row mb-1 mt-1">
								<div class="col-10"></div>
								<div class="col-2">
									<button class="btn btn-info float-end btn-tambah-indikator" data-type="tambah"><i class="fa fa-plus"></i></button>
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

<!-- modal edit -->
<div id="modal_edit" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Edit</h2>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="fedit">
					<div class="row">
						<div class="form-group">
							<input type="hidden" name="id" id="ieid">
							<div class="row">
								<div class="col-md-6">
									<label for="ienama" class="control-label">Nama</label>
									<input id="ienama" type="text" name="nama" class="form-control" required>
								</div>
								<div class="col-md-6">
									<label for="ieslug" class="control-label">Slug</label>
									<input id="ieslug" type="text" name="slug" class="form-control" required>
								</div>
								<div class="col-md-12">
									<label for="iedeskripsi" class="control-label">Deskripsi</label>
									<textarea name="deskripsi" id="iedeskripsi" class="form-control" cols="30" rows="10"></textarea>
								</div>
							</div>

							<div class="row">
								<table class="my_table mt-3">
									<thead>
										<tr>
											<th rowspan="2">Aksi</th>
											<th rowspan="2" class="">Kategori</th>
											<th rowspan="2" class="">Sub Kategori</th>
											<th rowspan="2" class="">Nama</th>
											<th rowspan="2" class="">Tipe</th>
											<th rowspan="2" class="">Ruangan</th>
										</tr>
									</thead>
									<tbody id="panel_indikator_edit">
										<tr id="row_indikator_edit_0" class="row-indikator-edit" data-id="0">
											<td>
												<button style="display: none;" type="button" class="btn btn-xs btn-danger btn-remove-row"><i class="fa fa-close"></i></button>
											</td>
											<td>
												<div class="form-group">
													<input id="iekategori_0" type="text" name="kategori[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<input id="iesubkategori_0" type="text" name="subkategori[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<input id="ienama_indikator_0" type="text" name="nama_indikator[]" class="form-control">
												</div>
											</td>
											<td>
												<div class="form-group">
													<select id="ietype_0" type="text" name="type[]" class="form-control">
														<option value="indikator">indikator</option>
														<option value="aksi">aksi</option>
													</select>
												</div>
											</td>
											<td>
												<div class="form-group">
													<select id="iea_ruangan_ids_0" type="text" name="a_ruangan_ids_0[]" multiple class="form-select">
														<option value="">-- Tidak ada --</option>
														<?php foreach ($ruangans as $r) { ?>
															<option value="<?= $r->id ?>"><?= $r->nama ?></option>
														<?php } ?>
													</select>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row mb-1 mt-1 mt-1">
								<div class="col-10"></div>
								<div class="col-2">
									<button class="btn btn-info float-end btn-tambah-indikator" data-type="edit"><i class="fa fa-plus"></i></button>
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