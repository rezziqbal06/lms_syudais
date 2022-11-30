<div id="page-content">
	<!-- Dashboard 2 Header -->
	<div class="content-header content-header-media" style="display: none;">
		<div class="header-section">
			<div class="row">
				<!-- Main Title (hidden on small devices for the statistics to fit) -->
				<div class="col-md-4 col-lg-6 hidden-xs hidden-sm">
					<h1>
						Halo <strong><?= $this->__($sess->user, 'fnama', '') ?></strong>
						<br><small><?= $this->__($sess->user->reseller, 'nama', '') ?></small>
					</h1>
				</div>
				<!-- END Main Title -->

				<!-- Top Stats -->
				<div class="col-md-8 col-lg-6">
					<div class="row text-center">

						<div class="col-xs-12 col-sm-12">
							<h2 class="animation-hatch">
								<?= $this->__dateIndonesia('now', 'hari_tanggal') ?><br>
								<small><i class="fa fa-clock-o"></i> <span id="waktu_jam">00</span>:<span id="waktu_menit">00</span>:<span id="waktu_detik">00</span></small>
							</h2>
						</div>

					</div>
				</div>
				<!-- END Top Stats -->

			</div>
		</div>
		<!-- For best results use an image with a resolution of 2560x248 pixels (You can also use a blurred image with ratio 10:1 - eg: 1000x100 pixels - it will adjust and look great!) -->
		<!--<img src="<?= base_url() ?>skin/admin/img/placeholders/headers/dashboard_header.png" alt="header image" class="animation-pulseSlow">-->
	</div>
	<!-- END Dashboard 2 Header -->

	<!-- Main Dashboard -->
	<div class="row">
		<div class="col-md-12">
			<div class="" style="margin-top: 6em;">
				<div class="row" style="margin-bottom: 8px;">
					<div class="col-md-4" style="margin-bottom: 8px;">
						<span class="pill pill-danger text-center">Cash On Delivery</span>
						<img src="<?= base_url("media/cod.png") ?>" alt="dashboard cod" class="img-responsive hidden-xs">
					</div>
					<div class="col-md-8 row">
						<div class="col-xs-6 col-md-6">
							<div class="card danger">
								<h3 id="all_cod" class="text-danger">0</h3>
								<h5><i class="feather-16 text-info" data-feather="shopping-cart"></i> Jumlah Transaksi</h5>
								<h6 id="nominal_all_cod" class="">Rp. 0</h6>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card danger">
								<h3 id="in_shipper" class="text-danger">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="send"></i> Masih Di Pengirim</h5>
								<h6 id="nominal_in_shipper" class="">Rp. 0</h6>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card danger">
								<h3 id="in_warehouse" class="text-danger">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="archive"></i> Di Warehouse/Gudang</h5>
								<h6 id="nominal_in_warehouse" class="">Rp. 0</h6>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card danger">
								<h3 id="in_shipping" class="text-danger">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="clock"></i> Dalam Perjalanan</h5>
								<h6 id="nominal_in_shipping" class="">Rp. 0</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<div class="card danger">
							<h3 id="delivered" class="text-danger">0</h3>
							<h5><i class="feather-16 text-success" data-feather="check-circle"></i> Sukses Diterima</h5>
							<h6 id="nominal_delivered" class="">Rp. 0</h6>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card danger">
							<h3 id="return" class="text-danger">0</h3>
							<h5><i class="feather-16 text-danger" data-feather="corner-down-left"></i> Return</h5>
							<h6 id="nominal_return" class="">Rp. 0</h6>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card danger">
							<h3 id="in_sorting" class="text-danger">0</h3>
							<h5><i class="feather-16 text-info" data-feather="search"></i> Dalam Peninjauan</h5>
							<h6 id="nominal_in_sorting" class="">Rp. 0</h6>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card danger">
							<h3 id="undelivered" class="text-danger">0</h3>
							<h5><i class="feather-16 text-danger" data-feather="x-square"></i> Tidak Sampai</h5>
							<h6 id="nominal_undelivered" class="">Rp. 0</h6>
						</div>
					</div>
				</div>
			</div>

			<div class="" style="margin-top: 6em;">
				<div class="row" style="margin-bottom: 4px;">
					<div class="col-md-4" style="margin-bottom: 8px;">
						<span class="pill pill-info text-center">Non Cash On Delivery</span>
						<img src="<?= base_url("media/non_cod.png") ?>" alt="dashboard cod" class="img-responsive hidden-xs">
					</div>
					<div class="col-md-8 row">
						<div class="col-xs-6 col-md-6">
							<div class="card info">
								<h3 id="all_non_cod" class="text-info">0</h3>
								<h5><i class="feather-16 text-info" data-feather="shopping-cart"></i> Jumlah Transaksi</h5>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card info">
								<h3 id="in_shipper_non_cod" class="text-info">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="send"></i> Masih Di Pengirim</h5>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card info">
								<h3 id="in_warehouse_non_cod" class="text-info">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="archive"></i> Di Warehouse/Gudang</h5>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="card info">
								<h3 id="in_shipping_non_cod" class="text-info">0</h3>
								<h5><i class="feather-16 text-warning" data-feather="clock"></i> Dalam Perjalanan</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-xs-6 col-md-3">
						<div class="card info">
							<h3 id="delivered_non_cod" class="text-info">0</h3>
							<h5><i class="feather-16 text-success" data-feather="check-circle"></i> Sukses Diterima</h5>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card info">
							<h3 id="return_non_cod" class="text-info">0</h3>
							<h5><i class="feather-16 text-danger" data-feather="corner-down-left"></i> Return</h5>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card info">
							<h3 id="in_sorting_non_cod" class="text-info">0</h3>
							<h5><i class="feather-16 text-info" data-feather="search"></i> Dalam Peninjauan</h5>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="card info">
							<h3 id="undelivered_non_cod" class="text-info">0</h3>
							<h5><i class="feather-16 text-danger" data-feather="x-square"></i> Tidak Sampai</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- EndMain Dashboard -->


</div>
