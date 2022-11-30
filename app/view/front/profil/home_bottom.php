$("#bprofil_foto").on("click",function(e){
	e.preventDefault();
	$("#modal_profil_foto").modal('show');
});
$("#bprofil").on("click",function(e){
	e.preventDefault();
	$("#modal_profil_edit").modal('show');
});
$("#fmodal_profil_edit").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	var fd = $(this).serialize();
	$.post('<?=base_url('api_admin/profil/edit')?>',fd).done(function(dt){
		$("#modal_profil_edit").modal('hide');
		NProgress.done();
		if(dt.status == 200){
			window.location = '<?=base_url('profil/')?>';
		}
	}).fail(function(){
		$("#modal_profil_edit").modal('hide');
		NProgress.done();
		window.reload();
	})
});

$(".select2").select2();

$("#ialamat_select").select2({
	ajax: {
		method: 'post',
		url: '<?=base_url("api_front/pengaturan/destination/cari")?>',
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

$("#bedit_company").on('click', function(e){
	e.preventDefault();
	$("#modal_company_edit").modal('show');
})

$("#ialamat_select").on('change', function(e){
	var value = $(this).find('option:selected').val();
	var text = $(this).find('option:selected').text();
	var alamat = text.split(' - ');
	$("[name='kode_destination']").val(value);
	$("[name='provinsi']").val(alamat[0]);
	$("[name='kabkota']").val(alamat[1]);
	$("[name='kecamatan']").val(alamat[2]);
	$("[name='kelurahan']").val(alamat[3]);
	$("[name='kodepos']").val(alamat[4]);
  var kabkota = alamat[1];
  $.get('<?=base_url("api_admin/pengaturan/origin/get_by_kota/")?>'+kabkota).done(function(dt){
    if(dt.status == 200){
      if(dt.data){
        $("[name='kode_origin']").val(dt.data.code);
      }
    }
  })
})


<?php if(isset($acm->id)){
  foreach($acm as $k => $v){ ?>
    <?php if(isset($v) && strlen($v)){?>
    $("[name='<?=$k?>']").val('<?=$v?>');
    <?php } ?>
  <?php }
} ?>

<?php if(isset($buam->id)){
  foreach($buam as $k => $v){ ?>
    <?php if(isset($v) && strlen($v) && $k != 'nama'){?>
     $("[name='<?=$k?>']").val('<?=$v?>');
    <?php } ?>
  <?php }
} ?>

//submit form
$("#fmodal_company_edit").on("submit",function(e){
	e.preventDefault();
	NProgress.start();
	$('.btn-submit').prop('disabled',true);
	$('.icon-submit').addClass('fa-circle-o-notch fa-spin');

	var fd = new FormData($(this)[0]);
	var url = '<?=base_url("api_admin/partner/reseller/edit_profil/")?>' + '<?=$acm->id ?? ''?>';

	$.ajax({
		type: $(this).attr('method'),
		url: url,
		data: fd,
		processData: false,
		contentType: false,
		success: function(respon){
			if(respon.status==200){
				window.location = '<?=base_url('profil/')?>';
				$("#modal_company_edit").modal('hide')
			}else{

				$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
				$('.btn-submit').prop('disabled',false);
				NProgress.done();
			}
		},
		error:function(){

			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			return false;
		}
	});

});

$("#btn_regenerate").on('click', function(e){
	e.preventDefault();
	var c = confirm('Apakah anda yakin?');
	if(c){
		$('.icon-submit').addClass('fa-circle-o-notch fa-spin');
		$('.btn-submit').prop('disabled',true);
		NProgress.start();
		$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
				$('.btn-submit').prop('disabled',false);
		var apikey = $("[name='apikey']").val();
		$.get('<?=base_url("api_front/user/regenerate_apikey/")?>'+apikey).done(function(dt){
			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
			if(dt.data){
				$("[name='apikey']").val(dt.data.apikey);
			}
		}).fail(function(){
			$('.icon-submit').removeClass('fa-circle-o-notch fa-spin');
			$('.btn-submit').prop('disabled',false);
			NProgress.done();
		})
	}
})