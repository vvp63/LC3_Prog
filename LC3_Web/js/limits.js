$(function() {

	$('#clientid').on('blur', function(){
		$('#cl_from').submit();
	});
	
	$('#limitid').on('change', function(){
		$('#cl_from').submit();
	});	
	
});	

function SaveCh(clid, limid) {
	let iaid = 'ia_' + clid + '_' + limid;
	let chuid = 'chu_' + clid + '_' + limid;
	
	let miid = 'mi_' + clid + '_' + limid;
	let lwid = 'lw_' + clid + '_' + limid;
	let uwid = 'uw_' + clid + '_' + limid;
	let mxid = 'mx_' + clid + '_' + limid;
	
	let iacheck = 0;
	
	if (document.getElementById(iaid).checked) {
		document.getElementById(chuid).style.display='';
		iacheck = 1;
	} else {
		document.getElementById(chuid).style.display='none';
	}
	
	xmlhttp=new XMLHttpRequest();
	var body = 	'clientid=' + encodeURIComponent(clid) + '&limitid=' + encodeURIComponent(limid) +
				'&isactive=' + encodeURIComponent(iacheck) +
				'&min=' + encodeURIComponent(document.getElementById(miid).value) + '&max=' + encodeURIComponent(document.getElementById(mxid).value) +
				'&lw=' + encodeURIComponent(document.getElementById(lwid).value) + '&uw=' + encodeURIComponent(document.getElementById(uwid).value);
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			const answarr = this.responseText.split(";");
			if (answarr.length > 4) {
				document.getElementById(miid).value = answarr[1];
				document.getElementById(mxid).value = answarr[2];
				document.getElementById(lwid).value = answarr[3];
				document.getElementById(uwid).value = answarr[4];
			}
		}
	}
	xmlhttp.open("POST", "./s_lm_change.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);			
}

function CheckLimit(clid, limid) {
	let link = './w_check_limit.php?clientid=' + clid + '&limitid=' + limid;
	if (document.getElementById("ch_model").checked) link = link + '&chmodel=1';
	window.open(link, "_blank", "left=50, top=20, width=1600, height=900");
}

function CheckAll() {
	let link = './w_check_all.php';
	if (document.getElementById("ch_model").checked) link = link + '?chmodel=1';
	window.open(link, "_blank", "left=50, top=20, width=1600, height=900");
}

function Open5Perc() {
	let link = './w_slcheck.php';
	window.open(link, "_blank", "left=50, top=20, width=900, height=900");
}