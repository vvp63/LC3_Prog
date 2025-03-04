$(function() {

	FilteredPortf();

	$('#client').on('change', function(){
		$('#cl_from').submit();
	});
	
	$('#ptype').on('change', function(){
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
		var ismod = 'ismod[' + i +']';
		var flt_txt = document.getElementById("flt_txt").value;
		var flt_result = -1;
		if (flt_txt.length > 0) {
			flt_result = document.getElementById(ftxt).value.toLowerCase().search(flt_txt.toLowerCase());
		} 
		if (flt_result < 0) {
			if (document.getElementById(ismod).value == "0") {
				document.getElementById(rid).className = 'portf' + i % 2;
			} else {
				document.getElementById(rid).className = 'modpos';
			}
			if ( (flt_txt.length > 0) && (document.getElementById("fl_hide").checked) ) {
				document.getElementById(rid).style.display='none';
			} else {
				document.getElementById(rid).style.display='';
			}
		} else {
			document.getElementById(rid).style.display='';
			document.getElementById(rid).className = 'restricted';
		}			
	}
}

function StatOpen(clientid) {
	var link = './portf_stat.php?clientid=' + clientid;
	window.open(link, "_blank", "left=50, top=20, width=1500, height=900");
}

function RepoOpen(clientid) {
	var link = './repodeals.php?clientid=' + clientid;
	window.open(link, "_blank", "left=50, top=20, width=1500, height=900");
}	


function CopyModel() {
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			alert(this.responseText);
			location.reload();
		}
	}
	xmlhttp.open("POST", "./s_copymodel.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send('');
}

function ModelDeal(clientid) {
	var link = './modeldeal.php?clientid=' + clientid;
	window.open(link, "_blank", "left=300, top=100, width=900, height=500");
}

function PortfolioWarnings() {
	var link = './portfwarnings.php';
	window.open(link, "_blank", "left=300, top=100, width=1200, height=800");
}

function PortfolioRefresh() {
	if (confirm("Вы уверены, что хотите обновить портфель?")) {
		document.getElementById("rfbt").value = '...Ждите...';
		document.getElementById("rfbt").disabled = true;
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function() {
			if (this.readyState==4 && this.status==200) {
				alert(this.responseText);
				document.getElementById("rfbt").value = 'Обновить';
				document.getElementById("rfbt").disabled = false;
				PortfolioWarnings();
			}
		}
		xmlhttp.open("POST", "./portfrefresh.php", true);
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xmlhttp.send('');			
	}
}