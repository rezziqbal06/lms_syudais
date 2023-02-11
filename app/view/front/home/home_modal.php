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
							<div class="col-md-12">
								<label for="isdate">Dari Tanggal</label>
								<input type="date" class="form-control date-picker" name="sdate" id="isdate">
							</div>
							<div class="col-md-12">
								<label for="iedate">Sampai Tanggal</label>
								<input type="date" class="form-control date-picker" name="edate" id="iedate">
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