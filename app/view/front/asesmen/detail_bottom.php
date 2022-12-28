$(".select2").select2();

$("#btn_back").on('click', function(e){
    e.preventDefault();
    var c = confirm('Apakah anda yakin? Penilaian akan hilang.');
    if(c){
        history.back()
    }
})

//submit form
$("#ftambah").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData($(this)[0]);
	var url = '<?= base_url("api_front/asesmen/baru")?>';
	var isEmpty = false; 
	$.each($("input"), function(key,value){
		var vals = $(value).val();
		var data_id = $(value).attr('data-id');
		var id = $(value).attr('id');
		console.log(vals,"value");
		if(!vals){
			gritter('<p>Beberapa parameter belum terisi</p>','warning');
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
            $("#ia_jabatan_id").val(dt.data.a_jabatan_id).select2();
            $("#ia_ruangan_id").val(dt.data.a_unit_id).select2();
            $("#modal_cari_user").modal('hide');
            <?php if($ajm->slug == 'audit-hand-hygiene') : ?>
                if(dt.data.jumlah_penilaian){
                    $('.progress-bar').css('width', dt.data.progress_penilaian+'%').attr('aria-valuenow', dt.data.progress_penilaian).text(dt.data.jumlah_penilaian); 
                    $('.progress').slideDown();
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


function initDataByRuanganId(r_id=0){
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
					let s = '';
					let r = '';
					$("#panel-judul").removeClass("col-md-12");
					$("#panel-judul").addClass("col-md-6");
					$("#panel-filter").addClass("col-md-6");
					$("#panel-filter").html(`<div class="card col-md-5 p-3">
						Tampilkan yang belum diisi
					</div>`);
					$.each(respon.data.aim, function(k,v){
						$.each(v, function(k1,v1){
							r += `<div class="card p-3 m-2 choice transition" data-id="${v1.id}" id="${v1.id}">
								<input type="hidden" id="aksi-${v1.id}" name="aksi[${v1.id}]">
								<h5>${v1.nama}</h5>
							</div>`;
						});
						s += `<div class="card p-5 my-3">
							<h2>${k}</h2>
							<div class="d-flex flex-wrap">
								${r}
							</div>
						</div>`;
						r = '';
					});
					$("#panel-form-2").html('');
					$("#panel-form-2").html(s);
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


if(<?= $type_form ?> == 2){
	$("#ia_ruangan_id").on('change', function(e){
		e.preventDefault();
		let ruangan_id = this.value;
		initDataByRuanganId(ruangan_id);
		let selector = $(this).attr("data-id");
		$("#"+selector).removeClass("border border-success border-danger");
	});
	setTimeout(function(){
		var fd = $("#ia_ruangan_id").val();
		initDataByRuanganId(fd);
	},300);
}