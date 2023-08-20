var email = '';
var id_kegiatan = '';
var keterangan = '';
var id = 0
var laporan_id = 0
var sdate = ''
var sdate_laporan = ''
var keyword_laporan = ''
var type = 'today';

var lampiran = [];
var id_lampiran = 0
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

function getHistory(keyword, sdate){
  var url = '<?=base_url('api_front/program/get_histori/'.$apm->id.'/?keyword=')?>'+keyword+'&sdate='+sdate;

  $.get(url).done(function(dt){
    if(dt.status == 200){
      var s = '<p>Belum ada jadwal</p>';
      if(dt.data){
        var s = '';
        $.each(dt.data, function(k,v){
          var is_active = v?.is_reported ? 'bar-active' : 'bar'
          s += `<a href="#" class="item-jadwal mb-3" data-id="${v.jadwal_id}" data-laporan-id="${v.id}" data-sdate="${v.sdate_ori}" data-type="${type}">
									<div class="col-md-12 card border">
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

function getJadwal(type="today"){
  var url = '<?=base_url('api_front/program/get_jadwal/'.$apm->id.'/?type=')?>'+type;
  $.get(url).done(function(dt){
    if(dt.status == 200){
      var s = '<p>Belum ada jadwal</p>';
      if(dt.data){
        var s = '';
        $.each(dt.data, function(k,v){
          var is_active = v?.is_reported ? 'bar-active' : 'bar'
          s += `<a href="#" class="item-jadwal mb-3" data-id="${v.id}" data-laporan-id="${v.laporan_id}" data-sdate="${v.sdate_ori}" data-type="${type}">
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
  if(type != 'history') {
    getJadwal(type)
  }else{
    getHistory(keyword_laporan, sdate_laporan);
  }
});

function setListAbsen(absen){
    var s = '';
    $.each(absen, function(k,v){
      var status = '';
      switch(v?.keterangan){
        case 'hadir':
          status = 'success';
          break;
        case 'izin':
          status = 'info';
          v.jam = '---'
          break;
        case 'alpa':
          status = 'danger';
          v.jam = '---'
          break;
        default:
          status = 'secondary';
          break;
      }
      s += `<div id="item-absen-${v.id}" class="col-12 card shadow-none mb-2 item-absen" data-id-kegiatan="${id}" data-keterangan="${v.keterangan}" data-email="${v.email}">
            <a data-id="${v.id}" class="">
              <div class="card-body">
                <p id="ianama-${v.id}">${v.nama}</p>
                <div class="d-flex justify-content-between">
                  <small id="iajam-${v.id}" >${v.jam}</small>
                  <span id="iaketerangan-${v.id}" class="badge badge-sm bg-gradient-${status}">${v.keterangan}</span>
                </div>`

      if(v.catatan){
        s += `<div class="row"><div class="col"><p id="iacatatan-${v.id}" class="p-2 rounded block bg-background mt-2">${v.catatan}</p></div></div>`
      }

      s +=     `</div>
            </a>
          </div>`
    })
    $('#panel_absen').html(s);
}

function getDataAbsen(id, keyword='', sdate=''){
  $.get('<?=base_url('api_front/program/get_jadwal_detail/')?>'+id+'?keyword='+keyword+'&type='+type+'&sdate='+sdate).done(function(dt){
    if(dt.status == 200){
      if(dt.data.absen){
        setListAbsen(dt.data.absen)
      }
    }else{
      // gritter('<h4>Gagal</h4><p>'+dt.message+'</p>','warning');
    }
  }).fail(function(){
    // gritter('<h4>Error</h4><p>Gagal, silahkan coba lagi nanti</p>','danger');
  })
}

$(document).off('click', '.item-jadwal');
$(document).on('click', '.item-jadwal', function(e){
  e.preventDefault();
  id = $(this).attr('data-id');
  type = $(this).attr('data-type');
  sdate = $(this).attr('data-sdate');
  laporan_id = $(this).attr('data-laporan-id');
  $("#btn_lihat_laporan").show();
  if(laporan_id == 0 || laporan_id == '0'){
    console.log(laporan_id, 'laporan_id')
    $("#btn_lihat_laporan").hide();
  } 
  $.get('<?=base_url('api_front/program/get_jadwal_detail/')?>'+id+'?type='+type+'&sdate='+sdate).done(function(dt){
    if(dt.status == 200){
      <?php if(isset($permissions['melihat_absensi'])) : ?>
      if(dt.data.absen){
        setListAbsen(dt.data.absen)
      }
      <?php endif ?>
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

function setAbsen(id_kegiatan, email, keterangan, utype, sia, catatan){
  if(keterangan == sia && sia == 'hadir') return false;

  var fd = new FormData();
  if(id_kegiatan) fd.append('id_kegiatan',id_kegiatan)
  if(utype) fd.append('utype_kegiatan',utype)
  if(sia) fd.append('sia',sia)
  if(catatan) fd.append('catatan',catatan)
  if(type) fd.append('type',type)
	var url = '<?=base_url("api_front/program/ngabsen/")?>'+email;

	$.ajax({
		type: 'POST',
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		success: function(respon){
			if(respon.status==200){
				//gritter('<h4>Sukses</h4><p>Berhasil</p>','success');
				getDataAbsen(id, '', sdate)
        $("#modal_option_absen").modal('hide');
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','warning');
			}
		},
		error:function(){
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat mengubah data sekarang, silahkan coba lagi nanti</p>','danger');
			}, 666);
			return false;
		}
	});
}

<?php if(isset($permissions['update_absensi'])) : ?>
$(document).off('click', '.item-absen')
$(document).on('click', '.item-absen', function(e) {
  e.preventDefault();
  email = $(this).attr('data-email')
  id_kegiatan = $(this).attr('data-id-kegiatan')
  keterangan = $(this).attr('data-keterangan')
  setAbsen(id_kegiatan, email, keterangan, 'kegiatan', 'hadir', '')
})

let longPressTimer;

$(document).on('mousedown touchstart', '.item-absen', function(e) {
  //e.preventDefault();
  email = $(this).attr('data-email')
  id_kegiatan = $(this).attr('data-id-kegiatan')
  keterangan = $(this).attr('data-keterangan')
  longPressTimer = setTimeout(function() {
    $("#modal_option_absen").modal('show');
    console.log('Long press detected!');
  }, 500); 
})

$(document).on('mouseup touchend touchcancel', '.item-absen', function(e) {
  //e.preventDefault();
  clearTimeout(longPressTimer);
  console.log('clear long press')
})
<?php endif ?>


$("#modal_option_absen").on("shown.bs.modal",function(e){
	$("#modal_detail_jadwal").modal('hide');
});
$("#modal_option_absen").on("hidden.bs.modal",function(e){
	$("#modal_detail_jadwal").modal('show');
});

$("#set_izin").on('click', function(e){
  e.preventDefault();
  var catatan = $("#catatan_absen").val();
  setAbsen(id, email, keterangan, 'kegiatan', 'izin', catatan)
})

$("#set_alpa").on('click', function(e){
  e.preventDefault();
  setAbsen(id, email, keterangan, 'kegiatan', 'alpa')
})

$("#keyword").on('input', debounce(function(e){
  e.preventDefault();
  var keyword = $(this).val();
  getDataAbsen(id, keyword, sdate)
}, 500))


$("#keyword_laporan").on('input', debounce(function(e){
  e.preventDefault();
  keyword_laporan = $(this).val();
  getHistory(keyword_laporan, sdate_laporan)
}, 500))

$("#sdate_laporan").on('change', function(e){
  e.preventDefault();
  sdate_laporan = $(this).val();
  getHistory(keyword_laporan, sdate_laporan)
})


function addLampiran(id, path='', extension=''){
  var file = 'file';
  if(extension == 'doc' || extension == 'docx'){
    file = 'file-word-o';
  }else if(extension == 'xls' || extension == 'xlsx'){
    file = 'file-excel-o';
  }else if(extension == 'pdf'){
    file = 'file-pdf-o';
  }else if(!extension){
    file = 'file';
  }else{
    file = 'picture-o';
  }
  var hide_image = file != 'picture-o' ? 'display: none;' : '';
  var hide_icon = file == 'picture-o' ? 'display: none;' : '';
  var s = `<div id="panel_lampiran_${id}" class="col-12 col-md-4" data-id="${id}" data-path="${path}">
              <div class="input-group mb-3">
                <input id="file-${id}" name="lampiran[]" type="file" data-id="${id}" class="form-control" accept=".png,.jpg,.docx,.doc,.xlsx,.xls,.pdf">
                <button class="btn btn-danger btn-delete ${id < 1 ? 'd-none' : ''} " style="margin-bottom: 0px !important;" type="button" data-id="${id}"><i class="fa fa-trash"></i></button>
              </div>
              <div class="card-lampiran mb-2" id="card_lampiran_${id}" data-id="${id}" data-path="${path}">
                  <i id="icon-${id}" class="fa fa-${file} fa-3x m-3" data-id="${id}" style="${hide_icon}"></i>
                  <img id="img-${id}" src="" alt="" class="img-fluid" data-id="${id}" style="${hide_image}">
                  <input id="extension-${id}" type="hidden" name="extension[]" data-id="${id}" value="${extension}">
                  <input id="path-${id}" type="hidden" name="path_lampiran[]" data-id="${id}" value="${path}">
              </div>
            </div>`
  $('#panel_attach').append(s);
  id_lampiran++
}

$("#btn_buat_laporan").on('click', function(e){
  e.preventDefault();
  addLampiran(id_lampiran)
  $("#modal_buat_laporan").modal('show')
})

$("#btn_tambah_lampiran").on('click', function(e){
  e.preventDefault();
  addLampiran(id_lampiran)
})

$(document).off('click', '.card-lampiran')
$(document).on('click', '.card-lampiran', function(e) {
  e.preventDefault();
  var id = $(this).attr('data-id')
  var path = $(this).attr('data-path')
  var type = $(this).attr('data-type')
  if(!type){
    $("#file-"+id).trigger('click');
    return false;
  }
  if(type == 'file') return false;
  if(type == 'image'){
    var src = $("#img-"+id).attr('src');
    $("#panel_image").attr('src', src).show();
    $("#panel_dokumen").hide();
  }else{
    const embedURL = `https://view.officeapps.live.com/op/embed.aspx?src=${encodeURIComponent(path)}`;
    $("#panel_dokumen").attr('src', path).show();
    $("#panel_image").hide();
  }
  $("#modal_detail").modal('show');
})

$(document).off('change', 'input[type="file"]');
$(document).on('change', 'input[type="file"]', function(e){
	e.preventDefault();
  var id = $(this).attr('data-id');

	var file = e.target.files[0];
	var originalFormat = file.type.toLowerCase();
	if(originalFormat.includes('image')){
    lampiran[id] = 'image'
		setCompressedImage(e)
		readURLImage(this, 'img-'+id);
    $("#img-"+id).show();
    $("#icon-"+id).hide();
    $("#extension-"+id).val('image')
	}else if(originalFormat.includes('pdf')){
    lampiran[id] = 'pdf'
    $("#card_lampiran_"+id).attr('data-path', URL.createObjectURL(file));
    $("#img-"+id).hide();
    $("#icon-"+id).show().removeClass('fa-file').addClass('fa-file-pdf-o text-danger');
    $("#extension-"+id).val('document')
  }else{
    lampiran[id] = 'file'
    $("#img-"+id).hide();
    $("#icon-"+id).show();
    $("#extension-"+id).val('document')
  }
  $("#card_lampiran_"+id).attr('data-type', lampiran[id]);
  console.log(id, URL.createObjectURL(file), lampiran)
});


$(document).off('click', '.btn-delete')
$(document).on('click', '.btn-delete', function(e) {
  e.preventDefault();
  var id = $(this).attr('data-id')
  var path = $(this).attr('data-path')
  lampiran[id] = null;
  console.log(lampiran)
  $("#panel_lampiran_"+id).remove();
})

$("#flaporan").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData();
	var url = '<?= base_url("api_front/program/tambah_laporan/")?>'+id;

  var lampiranInputs = $('input[name="lampiran[]"]');
  var nomor = 0;
  for (let index = 0; index < lampiran.length; index++) {
      if(lampiran[index]) {
        if(lampiran[index] == 'image'){
	        var gambar = getImageData('file-'+index+'prev');
          console.log(gambar, index)
          if(gambar){
		        fd.append('lampiran[]', gambar.blob, 'gambar.'+gambar.extension);
          }
        }else{
          if(lampiranInputs[nomor].files && lampiranInputs[nomor].files[0])
          fd.append('lampiran[]', lampiranInputs[nomor].files[0])
        }
        nomor++
      }
  }

  var extensionInputs = $('input[name="extension[]"]');
  extensionInputs.each(function(index, input) {
    fd.append('extension[]', $(input).val());
  });

  fd.append('sdate', sdate)
  fd.append('deskripsi', $("#ildeskripsi").val())
	
	$.ajax({
		type: $(this).attr('method'),
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		success: function(respon){
			if(respon.status==200){
				gritter('<h4>Sukses</h4><p>Berhasil dilaporkan</p>','success');
				<!-- window.history.back() -->
			}else{
				gritter('<h4>Gagal</h4><p>'+respon.message+'</p>','warning');
				$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
				$('.btn-submit').prop('disabled',false);
			}
      NProgress.done();
		},
		error:function(){
			setTimeout(function(){
				gritter('<h4>Error</h4><p>Tidak dapat mengupdate data, silahkan coba beberapa saat lagi</p>','danger');
			}, 666);

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});
});
