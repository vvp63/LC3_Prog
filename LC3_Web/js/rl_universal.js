	$(function() {
	
		ShowFilteredList();
	
		$('#client').on('change', function(){
			$('#cl_from').submit();
		});	
				
		$('#CORG').on('change', function(){
			$('#search_txt').val('');
			$("#corg_list").attr("size", 1);
			$("#corg_list").html('');	
			if ($('#CORG').val() == 'G') { 
				$("#opti").attr('disabled', true); 
				$('#rtype').val('S');
				$("#d_issues").hide();
				$('#d_cbtypes').show();					
			} else { 
				$("#opti").attr('disabled', false); 
			} 
			ShowFilteredList();
		});
				
		$('#rtype').on('change', function(){
			if ($('#rtype').val() == 'I') { 
				$('#d_cbtypes').hide();				
				$("#d_issues").show(); 
			} else { 
				$("#d_issues").hide();
				$('#d_cbtypes').show();				
			} 
			ShowFilteredList();
		});
		
		$("#corg_list").on('change', function(){
			ShowFilteredList();
		});
		
		$("#cbtypes").on('change', function(){
			ShowFilteredList();
		});	
		
		$("#issues_list").on('change', function(){
			ShowFilteredList();
		});			
								
		$('#fl_cgrt').on('change', function(){
			ShowFilteredList();
		});
		
		$('#fl_cgid').on('change', function(){
			ShowFilteredList();
		});		
		
		$('#fl_tliss').on('change', function(){
			ShowFilteredList();
		});	

		$('#editreset').on('click', function(){
			$('#editreset').hide();
			$('#ed_rid').val('');
			$('#addedittop').html('Добавить ограничение');
		});
		
		$('#copy_all').on('click', function(){
			if (confirm("Выполнить копирование? Существующие ограничения будут заменены")) {
				$('#fl').val('copyall');
				$('#addupdate').submit();
			}
		});
		
		$('#delch').on('click', function(){
			if (confirm("Удалить все отмеченные ограничения?")) {
				$('#fl').val('delch');
				$('#addupdate').submit();
			}
		});	
								
	});
	

	function FindContr(str) {	
		if (str.length < 2) {
			document.getElementById("corg_list").innerHTML="";
			return;
		}
		xmlhttp=new XMLHttpRequest();
		var body = 'search_txt=' + encodeURIComponent(str) + '&CORG=' + encodeURIComponent(document.getElementById("CORG").value);
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
	
	function TypesListStr() {
		var ct = '';
		const options = document.getElementById('cbtypes').options;
		for (let opt of options) {
			if (opt.selected) ct = ct + opt.value + ';';
		}
		return ct;
	}
	
	function CheckRL() {
		var cbtypes = TypesListStr();
		xmlhttp=new XMLHttpRequest();
		var body = 	'CORG=' + encodeURIComponent(document.getElementById("CORG").value) + '&rtype=' + encodeURIComponent(document.getElementById("rtype").value) +
					'&corgid=' + encodeURIComponent(document.getElementById("corg_list").value) + '&cbtypes=' + encodeURIComponent(cbtypes) + 
					'&issueid=' + encodeURIComponent(document.getElementById("issues_list").value) + '&client=' + encodeURIComponent(document.getElementById("client").value) + 
					'&minval=' + encodeURIComponent(document.getElementById("minval").value) + '&maxval=' + encodeURIComponent(document.getElementById("maxval").value) +
					'&ltype=' + encodeURIComponent(document.getElementById("ltype").value);	
		xmlhttp.onreadystatechange=function() {
			if (this.readyState==4 && this.status==200) {
				var resp = this.responseText;
				const res = resp.split(';');
				if (res[0] != 0) {
					if (res[0] == 3) {
						if (confirm(res[1])) {
							document.getElementById("fl").value = "add";
							document.getElementById("addupdate").submit();
						}
					} else {
						alert(res[1]);
					}
				} else {
					document.getElementById("fl").value = "add";
					document.getElementById("addupdate").submit();
				}
			}
		}
		xmlhttp.open("POST", "./s_check_rl.php", true);
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xmlhttp.send(body);
	}		
	
	
	function ShowFilteredList() {
		var lstcount = document.getElementById("rlu_count").value;;
		var flCGRL = document.getElementById("CORG").value + document.getElementById("rtype").value;
		for (let i = 1; i <= lstcount; i++) {
			var flt_result = 1;
			var rid = 'lstrows[' + i +']';
			var flcgrt = 'hiddcgrt[' + i +']';
			var flcgid = 'hiddcgid[' + i +']';
			var fltl = 'hiddtl[' + i +']';
			var fliss = 'hiddiss[' + i +']';
			var hidd = 'hidd[' + i +']';
			var cb = 'cb[' + i +']';
			if ( (document.getElementById("fl_cgrt").checked) && (document.getElementById(flcgrt).value != flCGRL) ) {
				flt_result = 0;
			}

			if ( (document.getElementById("fl_cgid").checked) && (document.getElementById("corg_list").value != "") && 
					(document.getElementById("corg_list").value != document.getElementById(flcgid).value) ) {
				flt_result = 0;
			}	
			
			if (document.getElementById("fl_tliss").checked) {
				if (document.getElementById("rtype").value == 'I')  {
					if ( (document.getElementById("issues_list").value != "") &&  (document.getElementById("issues_list").value != document.getElementById(fliss).value) )
						flt_result = 0;
				} else {
					var cbtypes = TypesListStr();
					if (document.getElementById(fltl).value != cbtypes) flt_result = 0;
				}
			}

			if (flt_result == 0) {
				document.getElementById(rid).style.display='none';
				document.getElementById(hidd).value = '1';
				document.getElementById(cb).checked = false;
			} else {
				document.getElementById(rid).style.display='';
				document.getElementById(hidd).value = '0';
			}			
		}
	}
	
	function SubmEdit(rid) {
		document.getElementById("fl").value = "edit";
		document.getElementById("ed_rid").value = rid;
		document.getElementById("addupdate").submit();	
	}
	
	function SubmDelete(rid) {
		if (confirm("Вы уверены, что хотите удалить запись?")) {
			document.getElementById("fl").value = "del";
			document.getElementById("ed_rid").value = rid;
			document.getElementById("addupdate").submit();			
		}
	}
	
	function SetIX(ix_type, itt, rid) {
		var iid = 'lim_' + ix_type + '[' + itt +']';
		xmlhttp=new XMLHttpRequest();
		var body = 	'rid=' + encodeURIComponent(rid) + '&ix=' + encodeURIComponent(ix_type) +
					'&val=' + encodeURIComponent(document.getElementById(iid).value);	
		xmlhttp.onreadystatechange=function() {
			if (this.readyState==4 && this.status==200) {
				document.getElementById(iid).value = this.responseText;
			}
		}
		xmlhttp.open("POST", "./s_ix_change.php", true);
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xmlhttp.send(body);		
	}
	
	function CheckAll(val) {
		var lstcount = document.getElementById("rlu_count").value;
		for (let i = 1; i <= lstcount; i++) {
			var hidd = 'hidd[' + i +']';
			var cb = 'cb[' + i +']';
			document.getElementById(cb).checked = val && (document.getElementById(hidd).value == '0');			
		}
	}
	
	function PortfOpen(clientid, rlrid) {
		var link = './portfolio_rl.php?clientid=' + clientid + '&rlrid=' + rlrid;
		window.open(link, "_blank", "left=50, top=20, width=1500, height=900");
	}