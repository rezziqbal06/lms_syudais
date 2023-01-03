var myChart;
function showLoading(){
	$(".panel-loading").show();
	$(".panel-empty").hide();
	$(".panel-list").hide();
	$(".panel-statistik").hide();
	$(".panel-filter").hide();
}
function hideLoading(){
	$(".panel-loading").hide();
	$(".panel-empty").hide();
	$(".panel-list").hide();
	$(".panel-filter").hide();
}
function initChart(labels=['January', 'February', 'March', 'April', 'May', 'June', 'July'], datas=[65, 59, 80, 81, 26, 55, 40]){
	
	const chartCtx = $("#asesmenChart");
	

	const data = {
	labels: labels,
	datasets: [{
		label: 'Data Asesmen',
		data: datas,
		fill: false,
		backgroundColor: ['#086867','#6c9b87'],
		borderColor: 'rgb(75, 192, 192)',
		borderRadius: 8
	}]
	};

	const config = {
	type: 'bar',
	data: data,
	options: {
		scales: {
		y: {
			beginAtZero: true
		}
		}
	},
	};

	return new Chart(chartCtx, config);
}
function initData(fd=[]){
	if(fd){
		fd.append('a_jpenilaian_id', $('#jenis_penilaian').find('option:selected').val());
	}
	showLoading();
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
				if(respon.data.list && respon.data.list.length > 0){
					let labelSets = [];
					let nilaiSets = [];
					$.each(respon.data.datasets, function(k,v){
						labelSets.push(v.nama);
						nilaiSets.push(v.percent);
					});
					console.log(respon.data.datasets);
					myChart = initChart(labelSets,nilaiSets);
					var s = '';
					$.each(respon.data.list, function(k,v){
						var is_show = 'd-none'
						if(v.nilai) is_show = '';
						s += `<a data-id="${v.id}" href="<?=base_url('asesmen/')?>${v.slug}/${v.id}"><div class="card mx-auto my-3 col-md-5">
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
					$(".panel-statistik").show();
					$(".panel-filter").show();
					$(".panel-list").show();
					$(".panel-list").addClass("row");
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
};
$('.select2').select2();

setTimeout(function(){
	var fd = new FormData($("#ffilter")[0]);
	initData(fd);
},300);

$('#ffilter').on('submit', function(e){
	e.preventDefault();
	if(myChart){
		myChart.destroy();
	}
	var fd = new FormData($(this)[0]);
	initData(fd);
	$("#modal_filter").modal('hide');
});


$('#btn_filter').on('click', function(e){
	e.preventDefault();
	if(myChart){
		myChart.destroy();
	}
	$("#modal_filter").modal('show');
});

$("#jenis_penilaian").on('change', function(e){
	e.preventDefault();
	var fd = new FormData($("#ffilter")[0]);
	if(myChart){
		myChart.destroy();
	}
	initData(fd);
	
});
