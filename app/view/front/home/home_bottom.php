setInterval( function() {
	var seconds = new Date().getSeconds();
	$("#waktu_detik").html(( seconds < 10 ? "0" : "" ) + seconds); //>
},1000);

setInterval( function() {
	var minutes = new Date().getMinutes();
	$("#waktu_menit").html(( minutes < 10 ? "0" : "" ) + minutes); //>
},1000);

setInterval( function() {
	var hours = new Date().getHours();
	$("#waktu_jam").html(( hours < 10 ? "0" : "" ) + hours); //>
}, 1000);

function initChart(label="", idselector="chpengiriman", url=""){
	$.get(url).done(function(dt){
		if(dt.status == 200){
			if(dt.data){
				const data = {
					labels: dt.data.labels,
					datasets: [{
						label: label,
						backgroundColor: '#D0021B',
						borderColor: '#D0021B',
						data: dt.data.data,
					}]
				};

				const config = {
					type: 'line',
					data,
					options: {}
				};

				var myChart = new Chart(
					document.getElementById(idselector),
					config
				);
				$('#status_'+idselector).html('');

			}else{
				$('#status_'+idselector).html('Tidak ada data');
			}
		}else{
			$('#status_'+idselector).html('Tidak ada data');
		}
	}).fail(function(){
		$('#status_'+idselector).html('Tidak ada data');
	})
}

var url = '<?=base_url('api_front/order/statistic/');?>';
$.ajax({
	type: 'get',
	url: url,
	processData: false,
	contentType: false,
	success: function(respon){
		if(respon.status == 200){
			if(respon.data){
				var cod = respon.data.cod;
				var nominal_cod = respon.data.nominal_cod;
				var non_cod = respon.data.non_cod;
				if(cod){
					$.each(cod, function(k,v){
						if(k == 'all') $("#all_cod").text(v);
						$("#"+k).text(v);
					})
				}
				if(nominal_cod){
					$.each(nominal_cod, function(k,v){
						if(k == 'all') $("#nominal_all_cod").text("Rp. "+v);
						$("#nominal_"+k).text("Rp. "+v);
					})
				}
				if(non_cod){
					$.each(non_cod, function(k,v){
						$("#"+k+"_non_cod").text(v);
					})
				}
			}
		}else{
			growlPesan = '<h4>Gagal</h4><p>'+respon.message+'</p>';
			growlType = 'warning';
		}
		setTimeout(function(){
			$.bootstrapGrowl(growlPesan, {
				type: growlType,
				delay: 2500,
				allow_dismiss: true
			});
		}, 666);
	},
	error:function(){
		growlPesan = '<h4>Error</h4><p>Proses tambah data tidak bisa dilakukan, coba beberapa saat lagi</p>';
		growlType = 'danger';
		setTimeout(function(){
			$.bootstrapGrowl(growlPesan, {
				type: growlType,
				delay: 2500,
				allow_dismiss: true
			});
		}, 666);
		return false;
	}
});

