$(function() {

	scrolltoact();	

});

function FindLim() {
	var lcount = document.getElementById("l_count").value;
	for (let i = 0; i < lcount; i++) {
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

function EDQlist() {
	if (document.getElementById("cmplx").checked) {
		document.getElementById("qrylst").disabled = true;
	} else {
		document.getElementById("qrylst").disabled = false;
	}
}

function DeleteCL(limid) {
	if (confirm("Вы уверены, что хотите удалить лимит " + limid + "?")) {
		document.getElementById("action").value = "del_cl";
		document.getElementById("cl_form").submit();			
	}
}

function DeleteObj(limid, objid, objname) {
	if (confirm("Вы уверены, что хотите удалить объект " + objid + " (" + objname + ")?")) {
		document.getElementById("action_obj").value = "del_obj";
		document.getElementById("obj_form").submit();			
	}
}

function ClickArrow(vparam) {
	var rid = 'div_' + vparam;
	var hid = 'hid_' + vparam;
	var bid = 'btn_' + vparam;
	if (document.getElementById(hid).value=='0') {
		HideAll();
		document.getElementById(rid).style.display='block';
		document.getElementById(hid).value='1';
		document.getElementById(bid).value='^';
	} else {
		document.getElementById(rid).style.display='none';
		document.getElementById(hid).value='0';
		document.getElementById(bid).value='>';
	}
}

function FillInpVal(pid) {
	var cidpref = 'valarr_' + pid + '_';
	var cnt = 'vac_' + pid;
	var inp = 'vallst_' + pid;
	var res = "";
	for (let i = 1; i <= document.getElementById(cnt).value; i++) {
		var cid = cidpref + i;
		if (document.getElementById(cid).checked) {
			res = res + "'" + document.getElementById(cid).value + "' ,";
		}
	}
	document.getElementById(inp).value = res.slice(0, -2);
}

function ParamUsed(pid) {
	var trid = 'param_' + pid;
	var rid = 'rel_' + pid;
	if (document.getElementById(rid).value != "") {
		document.getElementById(trid).className = "set1";
	} else {
		document.getElementById(trid).className = "set0";
	}
}