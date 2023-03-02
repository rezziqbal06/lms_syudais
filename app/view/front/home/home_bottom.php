
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
function download(file, filename) {
    if (window.navigator.msSaveOrOpenBlob) {// IE10+
        window.navigator.msSaveOrOpenBlob(file, filename);
        return;
    }
    let a = document.createElement("a");
    let url = URL.createObjectURL(file);

    a.href = url;
    a.download = filename;
    word.appendChild(a);
    a.click();

    setTimeout(function() {
        word.removeChild(a);
        window.URL.revokeObjectURL(url);
        window.close()
    }, 500);
}
	const chartCtx = document.querySelector("#asesmenChart");
	let today = new Date();
	let categories = [];

	for (let i = 6; i >= 0; i--) {
		let date = new Date(today);
		date.setDate(date.getDate() - i);
		categories.push(date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' }));
	}

	let optionsAO = {
		series: [
		{
			name: 'Audit Hand Hygiene',
			data: [0,0,0,0,0,0,0]
		},
		{
			name: 'Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi (PPI)',
			data: [0,0,0,0,0,0,0]
		},
		{
			name: 'Audit Kepatuhan APD',
			data: [0,0,0,0,0,0,0]
		},
		
		],
		chart: {
		height: 350,
		type: 'area',
		fontFamily: 'Lexend Deca, sans-serif',
		},
		dataLabels: {
		enabled: false
		},
		stroke: {
		curve: 'smooth'
		},
		xaxis: {
		type: 'string',
		categories: categories,
		},
		tooltip: {
			x: {
				format: undefined,
			},
		},
	};

  	let chartAO = new ApexCharts(chartCtx, optionsAO);

	$(document).on('ready',() => {
		chartAO.render();		
		setTimeout(function(){
			var fd = new FormData($("#ffilter")[0]);
			initData(fd);
		},300);
	})


function grafik_asesmen(){
	$.get('<?= base_url("api_front/asesmen/chart_asesmen") ?>', {
		'asesor_id' : $('#asesor').val()
	}).done((res) => {
		console.log(res);
		let today = new Date();
		let categories = [];

		for (let i = 6; i >= 0; i--) {
			let date = new Date(today);
			date.setDate(date.getDate() - i);
			categories.push(date.toLocaleDateString('en-US', { day: 'numeric' }));
		}


		let hh_series = [];
		let apd_series = [];
		let monev_series = [];

		let hh = res.data.hh;
		let apd = res.data.apd;
		let monev = res.data.monev;

		categories.forEach(category => {
        let count_hh = 0;
        let count_apd = 0;
        let count_monev = 0;
        hh.forEach(item => {
          if (item.day === category) {
            count_hh = item.nilai;
          }
        });
        apd.forEach(item => {
          if (item.day === category) {
            count_apd = item.nilai;
          }
        });
        monev.forEach(item => {
          if (item.day === category) {
            count_monev = item.nilai;
          }
        });
        hh_series.push(count_hh);
        apd_series.push(count_apd);
        monev_series.push(count_monev);
      });


		setTimeout(() => {
        chartAO.updateSeries([
          {
            name: 'Audit Hand Hygiene',
            data: hh_series
          },
          {
            name: 'Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi (PPI)',
            data: apd_series
          },
          {
            name: 'Audit Kepatuhan APD',
            data: monev_series
          }
        ])
      }, 100)

	}).fail((xhr) => {
		console.log(xhr)
	});
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
					var s = '';
					$.each(respon.data.list, function(k,v){
						var is_show = 'd-none'
						if(v.nilai) is_show = '';
						s += `<a class="col-md-4 mb-3" data-id="${v.id}" href="<?=base_url('asesmen/')?>${v.slug}/${v.id}"><div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<span class="" style="font-size: smaller;">${v.slug != 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi' ? v.ruangan : ''}</span>
									</div>
									<div class="col-6">
										<span class="pill pill-warning ${is_show} float-end">${v.nilai} poin</span>
									</div>
								</div>
								<p class=""><b>${v.slug == 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi' ? v.ruangan : v.nama}</b></p>
								<figcaption class="blockquote-footer">
									${v.slug != 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi' ? v.profesi : ''}
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


$('#ffilter').on('submit', function(e){
	e.preventDefault();
	if(myChart){
		myChart.destroy();
	}
	var fd = new FormData($(this)[0]);
	initData(fd);
	$("#modal_filter").modal('hide');
});

$("#asesor").on('change', function(e){
	grafik_asesmen();
});

$('#btn_filter').on('click', function(e){
	e.preventDefault();
	var jp = $("#jenis_penilaian").find('option:selected').val();
	if(jp == 4){
		$("#panel_b_user_id").hide();
		$("#panel_tgl").hide();
		$("#panel_bulan").show();
	}else{
		$("#panel_b_user_id").show();
		$("#panel_tgl").show();
		$("#panel_bulan").hide();
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

function printHH(respon){
	var s = '<h4 class="text-center mb-n1">FORMULIR AUDIT HAND HYGIENE RSU BINA SEHAT</h4><br>';
	s += '<table style="width: 100%;">'
	s += '<tbody>'
	var n = 0;
	$.each(respon.data.list, function(k,v){
		if(k == 0){
			s += '<tr>';
		}
		if(n == 3){
			s += '</tr><tr>';
			n = 0;
		}
		s += `<td>
				<table class="my_table">
					<tbody>
						<tr>
							<td>Profesi</td>
							<td colspan="2">${v.profesi}</td>
						</tr>
						<tr>
							<td>Nama</td>
							<td colspan="2">${v.nama}</td>
						</tr>
						<tr>
							<td>Unit</td>
							<td colspan="2">${v.ruangan}</td>
						</tr>
						<tr>
							<td>Tanggal</td>
							<td colspan="2">${v.cdate}</td>
						</tr>
						<tr>
							<td>Lama Audit</td>
							<td colspan="2">${v.durasi}</td>
						</tr>
					</tbody>
					<tbody>
						<tr style="background-color: #08686738;">
							<td>Opp</td>
							<td>Indikasi</td>
							<td>Action</td>
						</tr>`
						$.each(v.value, function(kvalue, vvalue){
							var isPageBreak = kvalue == 4 ? '' : '';
							s += `<tr class="${isPageBreak}">
								<td>${kvalue+1}</td>
								<td>`
								$.each(respon.data.aim, function(kaim,vaim){
									if(vaim.type == 'indikator'){
										var ischecked = vvalue.indikator == vaim.id ? 'checked' : '';
										s += `<div class="form-check">
												<input class="form-check-input" type="checkbox" ${ischecked}>
												<label class="form-check-label" >
													${vaim.nama}
												</label>
											</div>`
										<!-- s += `<label><input type="checkbox" ${ischecked}> ${vaim.nama}</label>` -->
									}
								})
							s += `</td>`
							s += `<td>`
								$.each(respon.data.aim, function(kaim,vaim){
									if(vaim.type == 'aksi'){
										var ischecked = vvalue.aksi == vaim.id ? 'checked' : '';
										s += `<div class="form-check">
												<input class="form-check-input" type="checkbox" ${ischecked}>
												<label class="form-check-label" >
													${vaim.nama}
												</label>
											</div>`
										<!-- s += `<label><input type="checkbox" ${ischecked}> ${vaim.nama}</label>` -->
									}
								})
							s += `</td>
							</tr>`
						})
						
					s += `</tbody>
				</table>
			</td>`;
		if(k == respon.data.list.length - 1){
			s += '</tr>';
		}
		n++;
	});
	s += '</tbody>'
	s += '</table>'

	$.post('<?=base_url('api_front/asesmen/printing')?>', {content: s}).done(function(dt){
		if(dt.status == 200) window.open('<?=base_url('cetak/hh/')?>', 'blank');
	})

	<!-- $("#panel_print").html(s); -->
	
}

function printMonev(respon){
	$.post('<?=base_url('api_front/asesmen/printing_xls')?>', {content: respon}).done(function(dt){
		if(dt.status == 200) window.open('<?=base_url('cetak/monev/')?>', 'blank');
	})
}

function printApd(respon){
	$.post('<?=base_url('api_front/asesmen/printing_xls')?>', {content: respon}).done(function(dt){
		if(dt.status == 200) window.open('<?=base_url('cetak/apd/')?>', 'blank');
	})
}


$("#btn_print").on('click', function(e){
	e.preventDefault();
	var fd = new FormData($("#ffilter")[0]);
	if(fd){
		fd.append('a_jpenilaian_id', $('#jenis_penilaian').find('option:selected').val());
	}
	var url = '<?=base_url("api_front/asesmen/list_for_print")?>';
	$.ajax({
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(respon){
			if(respon.status==200){
				if(respon.data.list && respon.data.list.length > 0){
					if(respon.data.ajm.slug == 'audit-hand-hygiene'){
						printHH(respon);
					}else if(respon.data.ajm.slug == 'monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi'){
						printMonev(respon)
					}else if(respon.data.ajm.slug == 'audit-kepatuhan-apd'){
						printApd(respon);
					}
					
				}else{
					gritter('<h4>Info</h4><p>Tidak ada data yang perlu dicetak</p>','info');
				}
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','danger');
				NProgress.done();
			}
		},
		error:function(){
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat menambah data, silahkan coba beberapa saat lagi</p>','warning');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});
})