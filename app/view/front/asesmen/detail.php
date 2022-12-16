<style>
	.panel-header {
		background-color: var(--background);
	}
</style>
<form action="ftambah">
	<div class="panel-header p-3 shadow-sm">
		<button id="btn_back" class="btn btn-outline-primary mb-3"><i class="fa fa-arrow-left"></i> Kembali</button>
		<h6 class="text-primary">Asesmen</h6>
		<h3 class="mt-n2"><?= $ajm->nama ?></h3>
		<div class="form-group row">
			<div class="col-md-6">
				<label for="iuser">Nama</label>
				<input type="hidden" name="b_user_id" id="ib_user_id">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Nama" aria-label="Nama" id="iuser" name="user">
					<button class="btn btn-secondary" type="button" id="btn_cari_user">Cari</button>
				</div>
			</div>
			<div class="col-md-6">
				<label for="ijabatan">Profesi</label>
				<div class="input-group">
					<select type="text" class="form-control select2" placeholder="Nama" id="ia_jabatan_id" name="a_jabatan_id">
						<?php if (isset($ajbm) && count($ajbm)) : ?>
							<?php foreach ($ajbm as $k => $v) : ?>
								<option value="<?= $v->id ?>"><?= $v->nama ?></option>
							<?php endforeach ?>
						<?php endif ?>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<label for="ia_ruangan_id">Ruangan/Unit</label>
				<select type="text" class="form-control select2" placeholder="Nama" id="ia_ruangan_id" name="a_ruangan_id">
					<?php if (isset($arm) && count($arm)) : ?>
						<?php foreach ($arm as $k => $v) : ?>
							<option value="<?= $v->id ?>"><?= $v->nama ?></option>
						<?php endforeach ?>
					<?php endif ?>
				</select>
			</div>
		</div>
	</div>

	<div class="panel-body p-3 row mb-5">
		<?php if ($type_form == 1) { ?>
			<div class="col-md-6">
				<label for="iindikator">Indikator</label>
				<select type="text" class="form-control select2" placeholder="Indikator" id="ia_indikator_id" name="a_indikator_id">
					<?php if (isset($aim) && count($aim)) : ?>
						<?php foreach ($aim as $k => $v) : ?>
							<?php if ($v->type == 'indikator') : ?>
								<option value="<?= $v->id ?>"><?= $v->nama ?></option>
							<?php endif ?>
						<?php endforeach ?>
					<?php endif ?>
				</select>
			</div>
			<div class="col-md-6">
				<label for="iindikator">Aksi</label>
				<?php if (isset($aim) && count($aim)) : ?>
					<?php foreach ($aim as $k => $v) : ?>
						<?php if ($v->type == 'aksi') : ?>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="a_aksi_id" value="<?= $v->id ?>" id="ia_aksi_id<?= $v->id ?>">
								<label class="form-check-label" for="ia_aksi_id<?= $v->id ?>">
									<?= $v->nama ?>
								</label>
							</div>
						<?php endif ?>
					<?php endforeach ?>
				<?php endif ?>
			</div>
		<?php } ?>
	</div>

	<div class="fixed-bottom row">
		<button type="submit" class="btn btn-success bg-accent float-end">Simpan</button>
	</div>

</form>