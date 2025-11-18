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

function FindContr(str) {	
	if (str.length < 2) {
		document.getElementById("corg_list").innerHTML="";
		return;
	}
	xmlhttp=new XMLHttpRequest();
	var body = 'search_txt=' + encodeURIComponent(str) + '&CORG=C';
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			document.getElementById("corg_list").innerHTML=this.responseText;
			document.getElementById("corg_list").size = 10;
		}
	}
	xmlhttp.open("POST", "./s_contr_find.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);
}	

function SetFndStr(contrid) {
	document.getElementById("corg_list").size = 1;
	xmlhttp=new XMLHttpRequest();
	var body = 'contrid=' + encodeURIComponent(contrid);
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			document.getElementById("issues_list").innerHTML=this.responseText;
			document.getElementById("issues_list").size = 10;
		}
	}
	xmlhttp.open("POST", "./s_issue_find.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);		
}

function SubmDeleteCont(grid, contrid)	{
	if (confirm("Удалить выпуск из группы?")) {
		document.getElementById("action").value = "delgrpcont";
		document.getElementById("fgrid").value = grid;
		document.getElementById("fissueid").value = contrid;
		document.getElementById("actfrm").submit();			
	}
}