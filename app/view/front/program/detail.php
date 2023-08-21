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

	.card-lampiran {
		border: 1px solid #dedede;
		background-color: #f3f3f3;
		padding: 3px;
		text-align: center;
		border-radius: 8px;
	}



	.accordion-button {
		position: relative;
		display: flex;
		align-items: center;
		width: 100%;
		padding: 1rem 1.25rem;
		font-size: 1rem;
		color: #212529;
		text-align: left;
		background-color: #fff;
		border: 0;
		border-radius: 0;
		overflow-anchor: none;
		transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out, border-radius .15s ease
	}

	@media (prefers-reduced-motion:reduce) {
		.accordion-button {
			transition: none
		}
	}

	.accordion-button:not(.collapsed) {
		color: #0c63e4;
		background-color: #e7f1ff;
		box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .125)
	}

	.accordion-button:not(.collapsed)::after {
		background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%230c63e4'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
		transform: rotate(-180deg)
	}

	.accordion-button::after {
		flex-shrink: 0;
		width: 1.25rem;
		height: 1.25rem;
		margin-left: auto;
		content: "";
		background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
		background-repeat: no-repeat;
		background-size: 1.25rem;
		transition: transform .2s ease-in-out
	}

	@media (prefers-reduced-motion:reduce) {
		.accordion-button::after {
			transition: none
		}
	}

	.accordion-button:hover {
		z-index: 2
	}

	.accordion-button:focus {
		z-index: 3;
		border-color: #86b7fe;
		outline: 0;
		box-shadow: 0 0 0 .25rem rgba(13, 110, 253, .25)
	}

	.accordion-header {
		margin-bottom: 0
	}

	.accordion-item {
		background-color: #fff;
		border: 1px solid rgba(0, 0, 0, .125)
	}

	.accordion-item:first-of-type {
		border-top-left-radius: .25rem;
		border-top-right-radius: .25rem
	}

	.accordion-item:first-of-type .accordion-button {
		border-top-left-radius: calc(.25rem - 1px);
		border-top-right-radius: calc(.25rem - 1px)
	}

	.accordion-item:not(:first-of-type) {
		border-top: 0
	}

	.accordion-item:last-of-type {
		border-bottom-right-radius: .25rem;
		border-bottom-left-radius: .25rem
	}

	.accordion-item:last-of-type .accordion-button.collapsed {
		border-bottom-right-radius: calc(.25rem - 1px);
		border-bottom-left-radius: calc(.25rem - 1px)
	}

	.accordion-item:last-of-type .accordion-collapse {
		border-bottom-right-radius: .25rem;
		border-bottom-left-radius: .25rem
	}

	.accordion-body {
		padding: 1rem 1.25rem
	}

	.accordion-flush .accordion-collapse {
		border-width: 0
	}

	.accordion-flush .accordion-item {
		border-right: 0;
		border-left: 0;
		border-radius: 0
	}

	.accordion-flush .accordion-item:first-child {
		border-top: 0
	}

	.accordion-flush .accordion-item:last-child {
		border-bottom: 0
	}

	.accordion-flush .accordion-item .accordion-button {
		border-radius: 0
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
							<button class="nav-link" id="week-tab" data-bs-toggle="tab" data-type="week" data-bs-target="#week-tab-pane" type="button" role="tab" aria-controls="week-tab-pane" aria-selected="false">Akan Datang</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="history-tab" data-bs-toggle="tab" data-type="history" data-bs-target="#history-tab-pane" type="button" role="tab" aria-controls="history-tab-pane" aria-selected="false">Histori</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="today-tab-pane" role="tabpanel" aria-labelledby="today-tab" tabindex="0">
							<div id="panel_jadwal_today" class="row p-3"></div>
						</div>
						<div class="tab-pane fade" id="week-tab-pane" role="tabpanel" aria-labelledby="week-tab" tabindex="0">
							<div id="panel_jadwal_week" class="row p-3"></div>
						</div>
						<div class="tab-pane fade" id="history-tab-pane" role="tabpanel" aria-labelledby="history-tab" tabindex="0">
							<div class="row mt-3">
								<div class="col">
									<input type="text" id="sdate_laporan" autocomplete="off" placeholder="tanggal" class="form-control datepicker" value="">
								</div>
								<div class="col">
									<input type="text" class="form-control mb-3" id="keyword_laporan" placeholder="cari laporan">
								</div>
							</div>

							<div id="panel_jadwal_history" class=""></div>
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