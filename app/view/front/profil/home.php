<style>
	.size-profile {
		width: 200px;
		height: 200px;
	}

	.select2-container {
		z-index: 100000;
	}

	.circle {
		border-radius: 200px;
		color: white;
		font-weight: bold;
		display: table;
		width: 100px;
		height: 100px;
		text-align: center;
	}

	.circle p {
		vertical-align: middle;
		display: table-cell;
		font-size: 3em;
		font-family: none;
	}

	@media only screen and (max-width:600px) {
		.size-profile {
			width: 100px;
			height: 100px;
		}

		.profile-root {
			margin: 0px !important;
		}


	}
</style>
<div class="mx-2 profile-root">
	<div class="mt-2">
		<img src="<?= base_url() . "/media/background-profile.jpg" ?>" class="rounded img-fluid" width="100%" alt="...">

	</div>
	<?php //dd($ue); 
	?>
	<div class="d-flex flex-wrap justify-content-between align-items-end px-5">
		<div class="col-md-6">
			<div class="d-flex align-items-center" style="margin-top:1rem;">
				<div style="margin-top: -80px;">
					<div class="circle bg-primary">
						<p><?= $ue->fnama[0] ?? '' ?></p>
					</div>


				</div>
				<div style="margin-left: 1.5rem;">
					<h2 class="text-secondary"><?= $ue->fnama ?></h2>
					<div class="text-primary"><?= $ue->profesi ?></div>
					<div class="text-primary"><?= $ue->ruangan ?></div>
				</div>
			</div>

		</div>
		<div id="edit-button" class="col-md-6 text-end">

			<button class="btn btn-primary bg-primary" id="btn-edit-profile">
				<div class="d-inline-flex">
					<div><span class="fa fa-pencil"></span></div>
					<div style="margin-left: 1rem;">Edit Profile</div>
				</div>
			</button>
			<button class="btn btn-danger " id="btn-logout">
				<div class="d-inline-flex">
					<div><span class="fa fa-door-open"></span></div>
					<div style="margin-left: 1rem;">Logout</div>
				</div>
			</button>
			<!-- <div class="row justify-content-end mt-2">
				<div class="col-md-2">Social Media</div>
				<div class="col-md-1"><img src="<?= base_url() . "/media/instagramm.png" ?>" alt=""></div>
				<div class="col-md-1"><img src="<?= base_url() . "/media/facebook.png" ?>" alt=""></div>
				<div class="col-md-1"><img src="<?= base_url() . "/media/twitter.png" ?>" alt=""></div>
			</div> -->
		</div>

	</div>
	<div class="m-4">
		<div class="row">
			<div class="p-3 col-md-4">
				<div class="card text-primary">
					<div class="card-body" style="min-height:12em">
						<h1 class="text-primary card-text"><?= $count_hygiene ?></h1>
						<p class="text-dark card-title">Audit Hand Hygiene </p>
						<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
						<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
					</div>
				</div>

			</div>
			<div class="p-3 col-md-4">
				<div class="card text-primary">
					<div class="card-body" style="min-height:12em">
						<h1 class="text-primary card-text"><?= $count_apd ?></h1>
						<p class="text-dark card-title">Audit Kepatuhan APD </p>
						<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
						<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
					</div>
				</div>

			</div>
			<div class="p-3 col-md-4">
				<div class="card text-primary">
					<div class="card-body" style="min-height:12em">
						<h1 class="text-primary card-text"><?= $count_monev ?></h1>
						<p class="text-dark card-title">Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi (PPI) </p>
						<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
						<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
					</div>
				</div>

			</div>
			<!-- <div class="p-3 col-md-3">
				<div class="card text-primary">
					<div class="card-body">
						<h5 class="text-primary card-title">Surveilan Pencegahan Dan Pengendalian Infeksi </h5>
						<h1 class="text-primary card-text mt-5"><?= $count_monev ?></h1>
					</div>
				</div>
			</div> -->

		</div>

	</div>