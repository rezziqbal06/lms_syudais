<footer class="clearfix">
	<div class="pull-right teks-pudar" style="">
		<?=$this->config->semevar->app_name?> <?=$this->config->semevar->site_version?> dibuat sepenuh <i class="fa fa-heart text-danger"></i> oleh <a href="https://cenah.co.id" target="_blank" title="Cipta Esensi Merenah" style="color: rgba(0,0,0,0.4);">Cenah.co.id</a> dengan Seme Framework <?=SEME_VERSION?>
	</div>
	<div class="pull-left">
		<?=$this->footer_text()?> <a href="<?=base_url("releases/index/".$this->config->semevar->site_version)?>" target="_blank" title="Catatan rilis"><?=$this->config->semevar->site_version?></a> &copy; 2016-<?=date("Y")?>
	</div>
</footer>
