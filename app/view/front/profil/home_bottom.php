$("#btn-edit-profile").on("click",function(e){
		e.preventDefault();
		$("#modal_option").modal("show");
});

$("#btn_close_modal").on("click",function(e){
		e.preventDefault();
		$("#modal_option").modal("hide");
});

$("#editprofil").on("click",function(e){
		e.preventDefault();
		$("#modal_option").modal("hide");
		$("#modal_edit_profil").modal("show");
});

if (window.matchMedia('(max-width:600px)').matches) {
        $("#edit-button").removeClass("col-md-6");
        $("#edit-button").addClass("col-md-12");
        $("#edit-button").addClass("flex-fill");
        $(".info-asesmen").addClass("m-2")
      }else{
        $("#edit-button").addClass("col-md-6");
        $("#edit-button").removeClass("col-md-12");
        $("#edit-button").removeClass("flex-fill");
        $(".info-asesmen").removeClass("m-2")
    }

$("#changepass").on("click",function(e){
		e.preventDefault();
		$("#modal_option").modal("hide");
		$("#modal_edit_password").modal("show");
});

const chartCtx = $("#asesmenChart");

const data = {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
  datasets: [{
    label: 'Looping tension',
    data: [65, 59, 80, 81, 26, 55, 40],
    fill: false,
    borderColor: 'rgb(75, 192, 192)',
  }]
};

const config = {
  type: 'line',
  data: data,
  options: {
    animations: {
      tension: {
        duration: 1000,
        easing: 'linear',
        from: 1,
        to: 0,
        loop: true
      }
    },
    scales: {
      y: { // defining min and max so hiding the dataset does not change scale range
        min: 0,
        max: 100
      }
    }
  }
};

new Chart(chartCtx, config);