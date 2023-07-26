<?php
$user_name = $sess->user->username;
if (isset($sess->user->nama)) if (strlen($sess->user->nama) > 1) $user_name = $sess->user->nama;
if (!isset($this->current_page)) $this->current_page = "";
if (!isset($this->current_parent)) $this->current_parent = "";
$current_page = $this->current_page;
$current_parent = $this->current_parent;
$parent = array();

$user_foto = '';
if (isset($sess->user->foto)) $user_foto = $sess->user->foto;
if (empty($user_foto)) $user_foto = 'media/pengguna/default.png';
$user_foto = $this->cdn_url($user_foto);
?>
<aside class="sidenav bg-nav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
	<div class="sidenav-header">
		<i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
		<a class="navbar-brand m-0" href="<?= base_url() ?>">
			<img src="<?= $this->cdn_url("media/logo.png") ?>" class="navbar-brand-img h-100" alt="main_logo">
			<span class="ms-1 font-weight-bold"><?= $this->config->semevar->site_name ?></span>
		</a>
	</div>
	<hr class="horizontal dark mt-0">
	<div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link active" href="<?= base_url() ?>">
					<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
					</div>
					<span class="nav-link-text ms-1">Dashboard</span>
				</a>
			</li>
			<!-- Header -->
			<li class="nav-item mt-3">
				<h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"></h6>
			</li>

			<!-- Header -->
			<li class="nav-item mt-3">
				<h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Program</h6>
			</li>
			<?php if (isset($sess->user->program[0])) {
				foreach ($sess->user->program as $k => $v) { ?>
					<li class="nav-item">
						<a class="nav-link" href="<?= base_url("program/" . $v->slug) ?>">
							<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
								<i class="<?= $v->icon ?? 'ni ni-app' ?> text-sm opacity-10" style="color:<?= $v->warna ?? '#dedede' ?>"></i>
							</div>
							<span class="nav-link-text ms-1 <?= $v->slug == $current_page ? 'active' : '' ?>"><?= $v->nama ?></span>
						</a>
					</li>
			<?php }
			} ?>
		</ul>
	</div>
	<div class="sidenav-footer mx-3 vertical-end">
		<div class="card card-plain shadow-none " id="sidenavCard">
			<div class="card-body text-center p-3 w-100 pt-0 d-none">
				<div class="docs-info">
					<h6 class="mb-0">Need help?</h6>
					<p class="text-xs font-weight-bold mb-0">Please check our docs</p>
				</div>
			</div>
		</div>
		<a href="<?= base_url("logout/") ?>" class="btn btn-dark btn-sm w-100 mb-3">Logout</a>
	</div>
</aside>