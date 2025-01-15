	$(function() {
	
		FilteredPortf();
	
		$('#client').on('change', function(){
			$('#cl_from').submit();
		});
		
		$('#ordby').on('change', function(){
			$('#cl_from').submit();
		});
		
		$('#flt_txt').on('keyup', function(){
			FilteredPortf();
		});

		$('#fl_hide').on('change', function(){
			FilteredPortf();
		});			
		
	});	
	
	
	function FilteredPortf() {
		var pcount = document.getElementById("p_count").value;
		for (let i = 0; i < pcount; i++) {
			var rid = 'lstrows[' + i +']';
			var ftxt = 'ftxt[' + i +']';
			var flt_txt = document.getElementById("flt_txt").value;
			var flt_result = -1;
			if (flt_txt.length > 0) {
				flt_result = document.getElementById(ftxt).value.toLowerCase().search(flt_txt.toLowerCase());
			} 
			if (flt_result < 0) {
				document.getElementById(rid).className = 'portf' + i % 2;
				if ( (flt_txt.length > 0) && (document.getElementById("fl_hide").checked) ) {
					document.getElementById(rid).style.display='none';
				} else {
					document.getElementById(rid).style.display='';
				}
			} else {
				document.getElementById(rid).style.display='';
				document.getElementById(rid).className = 'restricted';
				/*
				if (document.getElementById("fl_hide").checked) {
					document.getElementById(rid).className = 'portf' + i % 2;
				} else {
					document.getElementById(rid).className = 'restricted';
				}
				*/
			}			
		}
	}
	
	function StatOpen(clientid) {
		var link = './portf_stat.php?clientid=' + clientid;
		window.open(link, "_blank", "left=50, top=20, width=1500, height=900");
	}