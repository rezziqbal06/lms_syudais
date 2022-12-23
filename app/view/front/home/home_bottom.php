var s = '';
function showLoading(){
	$(".panel-loading").show();
	$(".panel-empty").hide();
	$(".panel-list").hide();
	$(".panel-filter").hide();
}
function hideLoading(){
	$(".panel-loading").hide();
	$(".panel-empty").hide();
	$(".panel-list").hide();
	$(".panel-filter").hide();
}
function initData(fd=[]){
	if(fd){
		fd.append('a_jpenilaian_id', $('#jenis_penilaian').find('option:selected').val());
	}
	showLoading()
	var url = '<?=base_url("api_front/asesmen/list")?>';
	$.ajax({
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(respon){
			hideLoading();
			if(respon.status==200){
				if(respon.data){
					$.each(respon.data.list, function(k,v){
						var is_show = 'd-none'
						if(v.nilai) is_show = '';
						s += `<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<span class="" style="font-size: smaller;">${v.ruangan}</span>
									</div>
									<div class="col-6">
										<span class="pill pill-warning ${is_show} float-end">${v.nilai} poin</span>
									</div>
								</div>
								<p class="text-dark"><b>${v.nama}</b></p>
								<figcaption class="blockquote-footer">
									${v.profesi}
								</figcaption>
								<div class="row">
									<div class="col-8">
										<span class="text-grey" style="font-size: smaller;">${v.cdate}</span>
									</div>
									<div class="col-4">
										<span class="float-end" style="font-size: smaller;">${v.durasi}</span>
									</div>
								</div>
							</div>
						</div>`;
					});
					$(".panel-list").html('');
					$(".panel-list").html(s);
					$(".panel-filter").show();
					$(".panel-list").show();
				}else{
					$(".panel-empty").show();
				}
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','danger');
				NProgress.done();
			}
		},
		error:function(){
			hideLoading();
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat menambah data, silahkan coba beberapa saat lagi</p>','warning');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});
}
$('.select2').select2();

setTimeout(function(){
	var fd = new FormData($("#ffilter")[0]);
	initData(fd);
},300)

$('#ffilter').on('submit', function(e){
	e.preventDefault();
	var fd = new FormData($(this)[0]);
	initData(fd);
	$("#modal_filter").modal('hide');
})


$('#btn_filter').on('click', function(e){
	e.preventDefault();
	$("#modal_filter").modal('show');
})