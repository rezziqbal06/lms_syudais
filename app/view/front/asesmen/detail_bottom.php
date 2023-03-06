$(".select2").select2();

$("#btn_back").on('click', function(e){
    e.preventDefault();
    var c = confirm('Apakah anda yakin?');
    if(c){
        history.back()
    }
})

//submit form
$("#ftambah").on("submit",function(e){
	e.preventDefault();
	var c = confirm('Apakah anda yakin? Penilaian yang tersimpan tidak bisa diedit kembali.');
	if(!c){
		return;
		return false;
	}
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData($(this)[0]);
	var url = '<?= isset($id) ? base_url("api_front/asesmen/edit/$id") : base_url("api_front/asesmen/baru")?>';
	var isEmpty = false; 
	$.each($("input[id*='aksi']:not([id='aksi-empty'])"), function(key,value){
		var vals = $(value).val();
		var data_id = $(value).attr('data-id');
		var id = $(value).attr('id');
		console.log(vals,"value");
		console.log(value,"val");
		if(!vals){
			gritter('<p>Beberapa belum terisi</p>','warning');
			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			isEmpty = true;
			return false;
		}
	})
	
	if(!isEmpty){
		$.ajax({
			url: url,
			data: fd,
			processData: false,
			contentType: false,
			type: $(this).attr('method'),
			success: function(respon){
				if(respon.status==200){
					gritter('<h4>Sukses</h4><p>Data berhasil ditambahkan</p>','success');
					setTimeout(function(){
						window.location = '<?=base_url('home')?>';
					},500);
				}else{
					gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','danger');
					$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
					$('.btn-submit').prop('disabled',false);
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
	}
});

$("#btn_cari_user").on('click', function(e){
    e.preventDefault();
    $("#modal_cari_user").modal('show');
});

$("#cari_user").select2({
	ajax: {
		method: 'post',
		url: '<?=base_url("api_front/user/cari/")?>',
		dataType: 'json',
	delay: 250,
		data: function (params) {
	var query = {
		keyword: params.term,
	}
	return query;
	},
	processResults: function (dt) {
	return {
		results:  $.map(dt, function (itm) {
		return {
			text: itm.text,
			id: itm.id
		}
		})
	};
	},
	cache: true
	}
});

$("#pilih_user").on('click', function(e){
    e.preventDefault();
    var id = $('#cari_user').find('option:selected').val();
    $.get('<?=base_url('api_front/user/detail/')?>' + id + '/' + '?jenis_penilaian=<?=$ajm->slug?>').done(function(dt){
        if(dt.data){
            $("#ib_user_id").val(id);
            $("#iuser").val(dt.data.fnama);
			console.log(dt.data);
            $("#ia_jabatan_id").val(dt.data.a_jabatan_id).select2();
            $("#ia_ruangan_id").val(dt.data.a_unit_id).select2();
            $("#modal_cari_user").modal('hide');
            <?php if($ajm->slug == 'audit-hand-hygiene') : ?>
                if(dt.data.jumlah_penilaian){
                    $('.progress-bar').css('width', dt.data.progress_penilaian+'%').attr('aria-valuenow', dt.data.progress_penilaian).text(dt.data.jumlah_penilaian); 
                    $('.progress').slideDown();
                }
				if(dt.data.histori_penilaian){
					var penilaian = dt.data.histori_penilaian;
					console.log(penilaian, 'penilaian');
					if(penilaian && penilaian.length >= 10){
						var pesan = `Penilaian untuk ${dt.data.fnama} sudah selesai dikerjakan/sudah 10kali kesempatan. Silakan untuk kembali`;
						var a = alert(pesan);
						if(a){
							history.back();
						}
						$(".btn-submit").hide();				
					}
					$.each(penilaian, function(k,v){

					})
				}
            <?php else : ?>
                $('.progress').slideUp();
            <?php endif; ?>
        } 
    })
})

$(document).off('click', '.choice');
$(document).on('click', '.choice', function(e){
	e.preventDefault();
	let selector = $(this).attr("data-id");
	$("#"+selector).removeClass("border border-success border-danger");
	let aksi = $("#aksi-"+selector).val();
	if(!aksi || aksi == 'n'){
		$("#aksi-"+selector).val('y');
		$("#"+selector).addClass("border border-success");
	}else{
		$("#aksi-"+selector).val('n');
		$("#"+selector).addClass("border border-danger");
	}
});

$(document).off('dblclick', '.choice');
$(document).on('dblclick', '.choice', function(e){
	e.preventDefault();
	let selector = $(this).attr("data-id");
	$("#"+selector).removeClass("border border-success border-danger");
	let aksi = $("#aksi-"+selector).val();
	$("#aksi-"+selector).val('n');
	$("#"+selector).addClass("border border-danger");
});

$(document).on('click',"#filter-empty",function(e){
	e.preventDefault();
	let iempty = $("#aksi-empty").val();
	if(!iempty || iempty == 'false'){
		$("#aksi-empty").val('true');
		$(this).addClass("bg-primary");
		$("#filter-empty h6").addClass("text-white");
		$("#filter-empty h6").text("Reset Filter");
		var isEmpty = false; 
		$.each($(".choice "), function(key,value){
			var vals = $(value).val();
			var data_id = $(value).attr('data-id');
			var id = $(value).attr('id');
			var value = $("#aksi-"+data_id).val();
			console.log(value);
			if(value || value == 'y'){
				$("#aksi-"+data_id).parent().hide();
			}
		})
	}else{
		$(this).removeClass("bg-primary");
		$("#filter-empty h6").removeClass("text-white");
		$("#filter-empty h6").text("Tampilkan yang belum diisi");
		$("#aksi-empty").val('false');
		$.each($(".choice "), function(key,value){
			var vals = $(value).val();
			var data_id = $(value).attr('data-id');
			var id = $(value).attr('id');
			var value = $("#aksi-"+data_id).val();
			console.log(value);
			if(value || value == 'y'){
				$("#aksi-"+data_id).parent().show();
			}
		})
	}
});


function initDataByRuanganId(r_id=0, val_edit = []){
	var url = '<?= base_url("api_front/asesmen/indicatorLists/".$slug."/") ?>'+r_id;
	$.ajax({
		url: url,
		data: [],
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(respon){
			if(respon.status==200){
				if(respon.data.aim && Object.keys(respon.data.aim).length > 0){
					if(val_edit.length < 0){
						let s = '';
						let r = '';
						$("#panel-judul").removeClass("col-md-12");
						$("#panel-judul").addClass("col-md-6");
						$("#panel-filter").addClass("col-md-6");
						$("#panel-filter").html(`<div class="card col-md-5 p-3 text-center transition" id="filter-empty">
							<input type="hidden" id="aksi-empty">
							<h6>Tampilkan yang belum diisi</h6>
						</div>`);
						$.each(respon.data.aim, function(k,v){
							$.each(v, function(k1,v1){
								r += `
								<div class="col-md-6">
								<div class="card p-3 m-1 choice transition" data-id="${v1.id}" id="${v1.id}">
									<input type="hidden" id="aksi-${v1.id}" name="aksi[${v1.id}]">
									<h6>${v1.nama}</h6>
								</div>	
								</div>
								`;
							});
							s += `<div class="card p-2 my-3">
								<div class="card-header">
									<h4>${k}</h4>
									<hr>
								</div>
								<div class="card-body">
									<div class="row">
										${r}
									</div>
								</div>
							</div>`;
							r = '';
						});
						$("#panel-form-2").html('');
						$("#panel-form-2").html(s);
					}else{
						let s = '';
						let r = '';
						$("#panel-judul").removeClass("col-md-12");
						$("#panel-judul").addClass("col-md-6");
						$("#panel-filter").addClass("col-md-6");
						$("#panel-filter").html(`<div class="card col-md-5 p-3 text-center transition" id="filter-empty">
							<input type="hidden" id="aksi-empty">
							<h6>Tampilkan yang belum diisi</h6>
						</div>`);
						$.each(respon.data.aim, function(k,v){
							
							$.each(v, function(k1,v1){
								r += `
								<div class="col-md-6">
								<div class="card p-3 m-1 choice transition" data-id="${v1.id}" id="${v1.id}">
									<input type="hidden" id="aksi-${v1.id}" name="aksi[${v1.id}]">
									<h6>${v1.nama}</h6>
								</div>	
								</div>
								`;
							});
							s += `<div class="card p-2 my-3">
								<div class="card-header">
									<h4>${k}</h4>
									<hr>
								</div>
								<div class="card-body">
									<div class="row">
										${r}
									</div>
								</div>
							</div>`;
							r = '';
						});
						$("#panel-form-2").html('');
						$("#panel-form-2").html(s);
						console.log(val_edit);
						$.each(val_edit, function(k,v){
							$("#"+v.indikator).removeClass("border border-success border-danger");
							$("#aksi-"+v.indikator).val(v.aksi);
							if(v.aksi == 'n'){
								$("#"+v.indikator).addClass("border border-danger");
							}else{
								$("#"+v.indikator).addClass("border border-success");
							}
						});

					}
					
				}else{
					$("#panel-form-2").html('');
				}
				if(respon.data.list && respon.data.list.length > 0){
					let labelSets = [];
					let nilaiSets = [];
					$.each(respon.data.datasets, function(k,v){
						labelSets.push(v.nama);
						nilaiSets.push(v.percent);
					});
					initChart(labelSets,nilaiSets);
					var s = '';
					
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
				gritter('<h4>Error</h4><p>Tidak dapat memuat data, silahkan coba beberapa saat lagi</p>','warning');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});
}

$('#tgl_asesmen').datepicker({format: 'yyyy-mm-dd'})


<?php if($sess->user->profesi == 'Komite Mutu'){ ?>
	$(".btn-submit").hide();
<?php }else{ ?>
	$(".btn-submit").show();
<?php } ?>
if(<?= $type_form ?> == 1){
	var val_edit = <?= isset($value) ? json_encode($value) : json_encode([]) ?>;
	$('.progress-bar').removeClass('bg-warning');
	if(val_edit.length >= 10){
		<!-- $(".btn-submit").hide(); -->
		$('.progress-bar').addClass('bg-warning');
	}
	var items = val_edit.length;
	var progress = Math.round(items/10*100);
	$('.progress').slideUp();
	if(items){
		$('.progress-bar').css('width', progress+'%').attr('aria-valuenow', progress).text(items); 
		$('.progress').slideDown();
	}
	
}else if(<?= $type_form ?> == 2){
	$("#ia_ruangan_id").on('change', function(e){
		e.preventDefault();
		let ruangan_id = this.value;
		initDataByRuanganId(ruangan_id);
		let selector = $(this).attr("data-id");
		$("#"+selector).removeClass("border border-success border-danger");
	});
	var val_edit = <?= isset($value) ? json_encode($value) : json_encode([]) ?>;
	console.log(val_edit.length);
	if(val_edit.length < 1){
		setTimeout(function(){
			var fd = $("#ia_ruangan_id").val();
			initDataByRuanganId(fd);
		},300);
	}else{
		setTimeout(function(){
			var fd = $("#ia_ruangan_id").val();
			initDataByRuanganId(fd,val_edit);
		},300);
	}
} else if(<?= $type_form ?> == 3){
	console.log(<?= $type_form ?>);
	var val_edit = <?= isset($value) ? json_encode($value) : json_encode([]) ?>;
	if(val_edit.length > 1){
		console.log(val_edit);
		$.each(val_edit, function(k,v){
			$.each(v.aksi,function(k1,v1){
				console.log(v1);
				$("#checkbox_"+v1+"_"+v.indikator).prop('checked', true);
			})
		});
	}
}

function tambahForm(now){

}


$(document).off('change', '.indikator-select');
$(document).on('change', '.indikator-select', function(e){
	e.preventDefault();
	let count = $(this).attr("data-count");
	let value = $(this).find('option:selected').val();
	$("#ia_indikator_id_"+count).val(value);
});