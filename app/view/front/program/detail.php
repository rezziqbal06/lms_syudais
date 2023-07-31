<style>
	.card-header {
		background-image: url('<?= base_url('media/bg-card.png') ?>');
		background-repeat: no-repeat;
		background-position: cover;
		padding: 1rem !important;
	}

	.bar {
		background-color: var(--primary);
		border-radius: 8px;
		width: 5px;
		height: 100%;
	}

	.bar-active {
		background-color: var(--accent);
		border-radius: 8px;
		width: 5px;
		height: 100%;
	}

	.text-muted {
		color: gainsboro;
	}
</style>
<section>
	<div class="row mt-3 mt-md-5">
		<div class="col-12">
			<div class="card mb-3">
				<div class="card-header" style="background-color: <?= $apm->warna ?? '#dedede' ?>;">
					<i class="<?= $apm->icon ?? 'ni ni-app' ?> text-white text-lg opacity-10"></i>
				</div>
				<div class="card-body">
					<h6 class="card-title"><?= $apm->nama ?? '' ?></h6>
					<p><?= $apm->deskripsi ?></p>
				</div>
			</div>
		</div>
	</div>
</section>
<section>
	<div class="row">
		<div class="col-md-7 mb-4">
			<div class="card">
				<div class="card-header">
					Jadwal
					<?php if (isset($permissions['update_jadwal'])) : ?>
						<button id="tambah_jadwal" class="btn btn-info float-end"><i class="fa fa-plus"></i></button>
					<?php endif ?>
				</div>
				<div class="card-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="today-tab" data-bs-toggle="tab" data-type="today" data-bs-target="#today-tab-pane" type="button" role="tab" aria-controls="today-tab-pane" aria-selected="true">Hari Ini</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="week-tab" data-bs-toggle="tab" data-type="week" data-bs-target="#week-tab-pane" type="button" role="tab" aria-controls="week-tab-pane" aria-selected="false">Pekan Ini</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="today-tab-pane" role="tabpanel" aria-labelledby="today-tab" tabindex="0">
							<div id="panel_jadwal_today" class="row p-3"></div>
						</div>
						<div class="tab-pane fade" id="week-tab-pane" role="tabpanel" aria-labelledby="week-tab" tabindex="0">
							<div id="panel_jadwal_week" class="row p-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-5 mb-4">
			<div class="card">
				<div class="card-header">
					Tugas
					<?php if (isset($permissions['update_tugas'])) : ?>
						<button id="tambah_jadwal" class="btn btn-info float-end"><i class="fa fa-plus"></i></button>
					<?php endif ?>
				</div>
				<div class="card-body">
					<?php if (isset($absensi[0])) : ?>
					<?php else : ?>
						<p>Tidak ada tugas</p>
					<?php endif ?>
				</div>
			</div>
		</div>
	</div>
</section>