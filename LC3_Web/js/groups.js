$(function() {

	scrolltoact();	

	$('#addgrpbutt').on('click', function(){
		$('#action').val('addgrp');
		$('#actfrm').submit();
	});

	$('#addgrpcont').on('click', function(){
		$('#action').val('addgrpcont');
		$('#actfrm').submit();
	});

});

function FindGrp() {
	var gcount = document.getElementById("g_count").value;
	for (let i = 0; i < gcount; i++) {
		var rid = 'rw[' + i +']';
		var ftxt = 'ftxt[' + i +']';
		var flt_txt = document.getElementById("fndtxt").value;
		var flt_result = -1;
		if (flt_txt.length > 0) {
			flt_result = document.getElementById(ftxt).value.toLowerCase().search(flt_txt.toLowerCase());
			if (flt_result < 0) {
				document.getElementById(rid).style.display='none';
			} else {
				document.getElementById(rid).style.display='';
			}
		} 
		else {
			document.getElementById(rid).style.display='';
		}			
	}
}


function FindContr() {	
	var gccount = document.getElementById("gс_count").value;
	let str = document.getElementById("csrch").value;
	for (let i = 0; i < gccount; i++) {
		var rid = 'rwgc[' + i +']';
		var ftxt = 'ftxtgc[' + i +']';
		var flt_result = -1;
		if ((str.length > 0) && (document.getElementById("filter").checked) ) {
			flt_result = document.getElementById(ftxt).value.toLowerCase().search(str.toLowerCase());
			if (flt_result < 0) {
				document.getElementById(rid).style.display='none';
			} else {
				document.getElementById(rid).style.display='';
			}
		} 
		else {
			document.getElementById(rid).style.display='';
		}			
	}
	
	if (str.length < 2) {
		document.getElementById("contr").innerHTML="";
		return;
	}
	
	xmlhttp=new XMLHttpRequest();
	var body = 'search_txt=' + encodeURIComponent(str) + '&CORG=C';
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			document.getElementById("contr").innerHTML=this.responseText;
		}
	}
	xmlhttp.open("POST", "./s_contr_find.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);
}

function scrolltoact() {
	var elmnt = document.getElementById('tdact');
	elmnt.scrollIntoView();
}

function SubmDelete(grid) {
	if (confirm("Вы уверены, что хотите удалить группу?")) {
		document.getElementById("action").value = "delgrp";
		document.getElementById("fgrid").value = grid;
		document.getElementById("actfrm").submit();			
	}
}

function SubmDeleteCont(grid, contrid)	{
	if (confirm("Удалить эмитента из группы?")) {
		document.getElementById("action").value = "delgrpcont";
		document.getElementById("fgrid").value = grid;
		document.getElementById("fcontrid").value = contrid;
		document.getElementById("actfrm").submit();			
	}
}
