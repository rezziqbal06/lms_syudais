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
function initData(id, fd=[]){
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
					$.each(respon.data, function(k,v){
						s += ``;
					});
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