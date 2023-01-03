<style>
	.card {
		box-shadow: none;
		border: solid 1px #121212;
	}

	.pill {
		padding: 5px;
		border-radius: 8px;
		font-size: small;
		color: white;
	}

	.pill-warning {
		color: white;
		background-color: var(--accent);
	}

	.select2 {
		width: 100%;
	}

	.date-picker {
		z-index: 1600 !important;
		/* has to be larger than 1050 */
	}
</style>
<div class="container mb-5">
	<div class="row gradient-primary p-5" style="border-bottom-left-radius: 16px;border-bottom-right-radius: 16px;">
		<h6 class="text-white">Statistik</h6>
		<h3 class="text-white">Asesmen RS Bina Sehat</h3>
	</div>
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	<div class="input-group p-3 mt-n5">
		<select name="" id="jenis_penilaian" class="form-control">
			<?php if (isset($ajm) && count($ajm)) : ?>
				<?php foreach ($ajm as $k => $v) : ?>
					<option value="<?= $v->id ?>"><?= $v->nama ?></option>
				<?php endforeach ?>
			<?php endif ?>
		</select>
		<button class="btn btn-secondary bg-accent"><i class="fa fa-search"></i></button>
	</div>
	<div class="panel-filter row" style="display: none;">
		<div class="col-md-1">
			<a href="#" id="btn_filter"><i class="fa fa-sliders"></i></a>
		</div>
	</div>
	<div class="panel-statistik mb-5">
		<div class="col-md-6 mx-auto">
			<div class="p-4" style="width: 100%">
				<canvas id="asesmenChart"></canvas>
			</div>

		</div>
	</div>

	<div class="panel-list p-2" style="display: none; ">
	</div>
	<div class="panel-loading mt-3">
		<p class="placeholder-glow">
			<span class="placeholder col-12"></span>
			<span class="placeholder col-6"></span>
			<span class="placeholder col-4"></span>
			<span class="placeholder col-2"></span>
			<span class="placeholder col-12"></span>
			<span class="placeholder col-4"></span>
			<span class="placeholder col-7"></span>
			<span class="placeholder col-12"></span>
			<span class="placeholder col-12"></span>
			<span class="placeholder col-12"></span>
		</p>
	</div>
	<div class="panel-empty row" style="display: none;">
		<div class="col-md-12 text-center">
			<img src="<?= base_url('media/empty.png') ?>" class="img-fluid mb-n5" alt="">
			<h5>Penilaian masih kosong</h5>
		</div>
	</div>

</div>