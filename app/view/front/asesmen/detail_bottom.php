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
	var url = '<?= base_url("api_front/asesmen/baru/")?>';
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
					<!-- window.location = '<?=base_url('home')?>'; -->
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