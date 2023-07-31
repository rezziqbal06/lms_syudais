$('.select2').select2();
// tambah jadwal
$("#ftambah_jadwal").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData($(this)[0]);
	var url = '<?=base_url("api_front/program/tambah_jadwal/")?>';

	$.ajax({
		type: $(this).attr('method'),
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		success: function(respon){
			if(respon.status==200){
				gritter('<h4>Sukses</h4><p>Data berhasil ditambah</p>','success');
				setTimeout(function(){
					window.location.reload()
				},500);
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','warning');

				$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
				$('.btn-submit').prop('disabled',false);
				NProgress.done();
			}
		},
		error:function(){
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat mengubah data sekarang, silahkan coba lagi nanti</p>','danger');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});

});

$("#fedit_jadwal").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');
  var id = $("#ieid").val();
	var fd = new FormData($(this)[0]);
	var url = '<?=base_url("api_front/program/edit_jadwal/")?>'+id;

	$.ajax({
		type: $(this).attr('method'),
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		success: function(respon){
			if(respon.status==200){
				gritter('<h4>Sukses</h4><p>Data berhasil diubah</p>','success');
				setTimeout(function(){
					window.location.reload()
				},500);
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','warning');

				$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
				$('.btn-submit').prop('disabled',false);
				NProgress.done();
			}
		},
		error:function(){
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat mengubah data sekarang, silahkan coba lagi nanti</p>','danger');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});

});

// change password
$("#fchange-password").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData($(this)[0]);
	var url = '<?=base_url("api_front/akun/user/changePass/")?>';

  let newPass = $("#new-pass").val();
  let confirmNewPass = $("#confirm-new-pass").val();

  if(newPass != confirmNewPass){
    gritter('<h4>Gagal</h4><p>Password tidak cocok</p>','danger');
  }else{
    $.ajax({
      type: $(this).attr('method'),
      url: url,
      data: fd,
      processData: false,
      contentType: false,
      success: function(respon){
        if(respon.status==200){
          gritter('<h4>Sukses</h4><p>Password berhasil diubah</p>','success');
          setTimeout(function(){
            window.location = '<?=base_url('profil/')?>';
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
          gritter('<h4>Error</h4><p>Tidak dapat mengubah data sekarang, silahkan coba lagi nanti</p>','warning');
        }, 666);
  
        $('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
        $('.btn-submit').prop('disabled',false);
        NProgress.done();
        return false;
      }
    });

  }

});

$("#tambah_jadwal").on('click', function(e){
  e.preventDefault();
  $('#modal_tambah_jadwal').modal('show')
})

$("#edit_jadwal").on('click', function(e){
  e.preventDefault();
  $('#modal_edit_jadwal').modal('show')
  $('#modal_detail_jadwal').modal('hide')
})


$("#hapus_jadwal").on('click', function(e){
  e.preventDefault();
  var c = confirm('Apakah anda yakin?');
  if(c){
    var id = $("#ieid").val();
    $.get('<?=base_url('api_front/program/hapus_jadwal/')?>'+id).done(function(dt){
      if(dt.status == 200){
        gritter('<h4>Gagal</h4><p>Jadwal berhasil dihapus</p>','success');
        setTimeout(function(){
          window.location.reload();
        },500)
      }else{
        gritter('<h4>Gagal</h4><p>'+dt.message+'</p>','warning');
      }
    }).fail(function(){
      gritter('<h4>Error</h4><p>Gagal, silahkan coba lagi nanti</p>','danger');
    })
  }
})

$(".datepicker").datepicker({
  format: "yyyy-mm-dd"
});
$(".timepicker").timepicker({
  showMeridian: false
});

$("#iis_rutin").on('change', function(e){
  e.preventDefault();
  if($(this).is(':checked')){
    $('.panel-not-rutin').hide();
    $('.panel-rutin').show();
    $('#isdate').prop('required', false);
  }else{
    $('.panel-not-rutin').show();
    $('.panel-rutin').hide();
    $('#isdate').prop('required', true);
  }
})

$("#ieis_rutin").on('change', function(e){
  e.preventDefault();
  if($(this).is(':checked')){
    $('.panel-not-rutin').hide();
    $('.panel-rutin').show();
    $('#iesdate').prop('required', false);
  }else{
    $('.panel-not-rutin').show();
    $('.panel-rutin').hide();
    $('#iesdate').prop('required', true);
  }
})

function getJadwal(type="today"){
  $.get('<?=base_url('api_front/program/get_jadwal/'.$apm->id.'/?type=')?>'+type).done(function(dt){
    if(dt.status == 200){
      var s = '<p>Belum ada jadwal</p>';
      if(dt.data){
        var s = '';
        $.each(dt.data, function(k,v){
          var is_active = v?.is_reported ? 'bar-active' : 'bar'
          s += `<a href="#" class="item-jadwal mb-3" data-id="${v.id}">
									<div class="col-md-12 card">
										<div class="card-body">
											<div class="d-flex justify-content-start">
												<div>
													<div class="${is_active}"></div>
												</div>
												<div class="ms-2 w-100">
													<small class="fw-light text-muted m-0">${v.sdate}</small>
													<p class="fs-6"><b>${v.nama}</b></p>
													<div class="row text-muted">
														<div class="col-md-6">
															<img src="<?= base_url('media/clock.svg') ?>" alt="clock" width="12px">
															<small>${v.stime} - ${v.etime}</small>
														</div>
														<div class="col-md-6">
															<img src="<?= base_url('media/user.svg') ?>" alt="clock" width="12px">
															<small>${v.narasumber}</small>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>`
        })
        $('#panel_jadwal_'+type).html(s);
      }
    }else{
      gritter('<h4>Gagal</h4><p>'+dt.message+'</p>','warning');
    }
  }).fail(function(){
    gritter('<h4>Error</h4><p>Gagal, silahkan coba lagi nanti</p>','danger');
  })
}

getJadwal();

$('button[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
  const type = $(e.target).attr('data-type');
  getJadwal(type)
});

$(document).off('click', '.item-jadwal');
$(document).on('click', '.item-jadwal', function(e){
  e.preventDefault();
  var id = $(this).attr('data-id');
  $.get('<?=base_url('api_front/program/get_jadwal_detail/')?>'+id).done(function(dt){
    if(dt.status == 200){
      if(dt.data.absen){
        var s = '';
        $.each(dt.data.absen, function(k,v){
          var status = '';
          switch(v?.keterangan){
            case 'hadir':
              status = 'success';
              break;
            case 'izin':
              status = 'info';
              break;
            case 'alpa':
              status = 'danger';
              break;
            default:
              status = 'secondary';
              break;
          }
          s += `<div class="col-12 card mb-2">
                <a id="item-absen-${v.id}" data-id="${v.id}" class="item-absen">
                  <div class="card-body">
                    <p>${v.nama}</p>
                    <div class="d-flex justify-content-between">
                      <small>${v.jam}</small>
                      <span class="badge badge-sm bg-gradient-${status}">${v.keterangan}</span>
                    </div>
                  </div>
                </a>
							</div>`
        })
        $('#panel_absen').html(s);
      }
      if(dt.data.detail){
        $.each(dt.data.detail, function(k,v){
          
          $("#ie"+k).val(v);
          if($("#ie"+k).hasClass('select2')) $("#ie"+k).select2().trigger('change');
          if(k == 'is_rutin'){
            console.log("#ie"+k, v)
            $("#ie"+k).prop('checked', v).trigger('change');
          }

          if(k == 'edate' && v) v = '- '+v;
          if(k == 'etime' && v) v = '- '+v;
          $("#d"+k).text(v);
        })
      }
      $("#modal_detail_jadwal").modal('show');
    }else{
      gritter('<h4>Gagal</h4><p>'+dt.message+'</p>','warning');
    }
  }).fail(function(){
    gritter('<h4>Error</h4><p>Gagal, silahkan coba lagi nanti</p>','danger');
  })
});