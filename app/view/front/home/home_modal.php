<!-- modal filter -->
<div id="modal_filter" class="modal fade" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center">
				<h2 class="modal-title">Filter</h2>
			</div>
			<!-- END Modal Header -->

			<!-- Modal Body -->
			<div class="modal-body">
				<form action="" method="POST" id="ffilter">
					<div class="row">
						<div class="form-group">
							<input type="hidden" name="b_user_id_penilai" value="<?= $sess->user->id ?>" id="ib_user_id_penilai">
							<div id="panel_b_user_id" class="col-md-12">
								<label for="ib_user_id">Nama</label>
								<select class="form-control select2" style="width: 100%;" name="b_user_id" id="ib_user_id">
									<option value="">-- Pilih Nama --</option>
									<?php foreach ($bum as $k => $v) : ?>
										<option value="<?= $v->id ?>"><?= $v->fnama ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<div class="col-md-12">
								<label for="ia_ruangan_id">Ruangan</label>
								<select class="form-control select2" style="width: 100%;" name="a_ruangan_id" id="ia_ruangan_id">
									<option value="">-- Pilih Ruangan --</option>
									<?php foreach ($arm as $k => $v) : ?>
										<option value="<?= $v->id ?>"><?= $v->nama ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<hr>
							<div id="panel_tgl">
								<div class="col-md-12">
									<label for="isdate">Dari Tanggal</label>
									<input type="date" class="form-control date-picker" name="sdate" id="isdate">
								</div>
								<div class="col-md-12">
									<label for="iedate">Sampai Tanggal</label>
									<input type="date" class="form-control date-picker" name="edate" id="iedate">
								</div>
							</div>
							<div id="panel_bulan">
								<div class="col-md-12">
									<label for="iedate">Sampai Tanggal</label>
									<select name="bulan" id="ibulan" class="form-control select2">
										<option value="">-- pilih bulan --</option>
										<option value="<?= date('Y') ?>-01-01">Januari</option>
										<option value="<?= date('Y') ?>-02-01">Februari</option>
										<option value="<?= date('Y') ?>-03-01">Maret</option>
										<option value="<?= date('Y') ?>-04-01">April</option>
										<option value="<?= date('Y') ?>-05-01">Mei</option>
										<option value="<?= date('Y') ?>-06-01">Juni</option>
										<option value="<?= date('Y') ?>-07-01">Juli</option>
										<option value="<?= date('Y') ?>-08-01">Agustus</option>
										<option value="<?= date('Y') ?>-09-01">September</option>
										<option value="<?= date('Y') ?>-12-01">Oktober</option>
										<option value="<?= date('Y') ?>-11-01">November</option>
										<option value="<?= date('Y') ?>-13-01">Desember</option>
									</select>
								</div>
							</div>

						</div>
					</div>
					<div class="row" style="margin-top: 1em; ">
						<div class="col-xs-12 btn-group-vertical" style="">
							<button type="submit" class="btn btn-primary btn-block text-left" data-dismiss="modal"><i class="fa fa-filter"></i> Filter</button>
							<button id="btn_print" class="btn btn-secondary btn-block text-left"><i class="fa fa-print"></i> Print</button>
						</div>
					</div>
				</form>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
</div>