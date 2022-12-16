<style>
	.size-profile{
		width: 200px;
		height: 200px;
	}
	@media only screen and (max-width:600px) {
		.size-profile{
			width: 100px;
			height: 100px;
		}
		.profile-root{
			margin: 0px !important;
		}
	}
</style>
<div class="mx-2 profile-root">
	<div class="mt-2">
		<img src="<?= base_url()."/media/background-profile.jpg" ?>" class="rounded img-fluid" width="100%" alt="...">
		
	</div>
	<div class="d-flex flex-wrap justify-content-between align-items-end px-5">
		<div class="col-md-6">
			<div class="d-flex align-items-center" style="margin-top:1rem;">
				<div style="margin-top: -150px;">
					<div class="bg-primary rounded-circle size-profile" >
						<!-- <div class="pt-2">
							<h2 class="text-center text-white">R</h2>
					
						</div> -->
					</div>

				</div>
				<div style="margin-left: 1.5rem;">
					<h2 class="text-secondary">Rezza Muhammad </h2>
					<div class="text-primary">profesi</div>
					<div class="text-primary">unit</div>
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
			<!-- <div class="row justify-content-end mt-2">
				<div class="col-md-2">Social Media</div>
				<div class="col-md-1"><img src="<?= base_url()."/media/instagramm.png" ?>" alt=""></div>
				<div class="col-md-1"><img src="<?= base_url()."/media/facebook.png" ?>" alt=""></div>
				<div class="col-md-1"><img src="<?= base_url()."/media/twitter.png" ?>" alt=""></div>
			</div> -->
		</div>
	
	</div>
	<div class="m-4">
		<div class="row">
			<div class="col-md-6 info-asesmen">
				<div class="card p-5">
					<h4 class="text-secondary">Informasi Asesmen</h4>
					<div class="d-flex justify-content-around flex-wrap">
						<div class="p-3" style="flex: 50%;">
							<div class="card text-primary" >
								<div class="card-body">
									<h5 class="text-primary card-title">Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi </h5>
									<h1 class="text-primary card-text mt-5">100</h1>
									<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
									<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
								</div>
							</div>
						</div>
						<div class="p-3" style="flex: 50%;">
							<div class="card text-primary">
								<div class="card-body">
									<h5 class="text-primary card-title">Survei Pencegahan Pengendalian Infeksi </h5>
									<h1 class="text-primary card-text mt-5">100</h1>
									<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
									<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
								</div>
							</div>

						</div>
						<div class="p-3" style="flex: 50%;">
							<div class="card text-primary" >
								<div class="card-body">
									<h5 class="text-primary card-title">Monitoring Infeksi Luka Operasi </h5>
									<h1 class="text-primary card-text mt-5">100</h1>
									<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
									<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
								</div>
							</div>

						</div>
						<div class="p-3" style="flex: 50%;">
							<div class="card text-primary" >
								<div class="card-body">
									<h5 class="text-primary card-title">Audit Kepatuhan APD </h5>
									<h1 class="text-primary card-text mt-5">100</h1>
									<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
									<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
								</div>
							</div>

						</div>
						<div class="p-3" style="flex: 50%;">
							<div class="card text-primary" >
								<div class="card-body">
									<h5 class="text-primary card-title">Audit Hand Hygiene </h5>
									<h1 class="text-primary card-text mt-5">100</h1>
									<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
									<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
								</div>
							</div>

						</div>
						
					</div>
				</div>
			</div>
			<div class="col-md-6 info-asesmen">
				<div class="card p-5">
					<h4 class="text-secondary">Grafik Asesmen</h4>
					<div>
						<canvas id="asesmenChart"></canvas>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>
