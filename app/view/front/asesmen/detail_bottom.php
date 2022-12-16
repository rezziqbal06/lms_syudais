<!-- $(".select2").select2(); -->

$("#btn_back").on('click', function(e){
    e.preventDefault();
    var c = confirm('Apakah anda yakin? Penilaian akan hilang.');
    if(c){
        history.back()
    }
})