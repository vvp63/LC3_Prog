{include file="header.tpl"}
{include file="top_menu.tpl"}

<script>

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

</script>

<form  method="POST" id=actfrm>
<input type=hidden id=action name=action value=''>
<input type=hidden id=fgrid name=fgrid value=''>
<input type=hidden id=fissueid name=fissueid value=''>

<table style='height: 90%; width: 100%; border: 2px solid #C0C0F0; margin: 1 px; padding: 1px;'>
<tr>
<td style='width: 600px; vertical-align: top;'>

	<input type=hidden id="g_count" value="{$groups|@count}">
	<b>Группы</b><br>
	{if $actres == 1}Добавлена группа "{$newgrpname}"<br>{/if}
	<div style="display: inline-block; height: 700px; width: 600px; overflow-y: auto;" id=grpdiv>
	{if not $grid|in_array:$groups.Id}<input type=hidden id=tdact>{/if}
	<table class=portfrl>
	<tr>
	<td class=portftop>Номер</td>
	<td class=portftop>Наименование <input type=text id=fndtxt onkeyup="FindGrp()"> </td>
	</tr>
	{foreach from=$groups key=k item=v}
	<tr class={if $v.Id == $grid}repo1{else}portf1{/if} id=rw[{$k}]><td{if $v.Id == $grid} id=tdact{/if}>{$v.Id}</td>
	<td><a href='/iss_groups.php?grid={$v.Id}'>{$v.GroupName}</a><input type=hidden id="ftxt[{$k}]" value='{$v.GroupName}'></td>
	</tr>
	{/foreach}
	</table>
	</div>
	{if $ia_8}
	<br><br>Новая группа:<br>
	<input type=text name=newgrp>&nbsp;<input type=button class=butt id=addgrpbutt value="Добавить">
	{/if}

</td>

<td style='width: 100%; vertical-align: top; padding-left: 20px;'>


	{if $grid != 0}
	<input type=hidden id="gс_count" value="{$grpcont|@count}">
	<b>Группа № {$grid} "{$grname}"</b>{if $ia_8}&emsp;<input type=button class=butt_sl value="Удалить" onclick="SubmDelete('{$grid}')">{/if}<br><br> 
	
	<div style="display: inline-block; max-height: 400px; overflow-y: auto;">
	<table class=portfrl>
	<tr><td class=portftop>Эмитент</td><td class=portftop>Выпуск</td><td></td></tr>
	{foreach from=$grpcont key=k item=v}
	<tr class=portf1 id=rwgc[{$k}]><td><a href={$sdh_c_lnk}{$v.emitents_id} target=_blank>{$v.name}</a><input type=hidden id="ftxtgc[{$k}]" value='{$v.cname}'></td>
	<td>{$v.FullName}</td>
	<td>{if $ia_8}<u class=del onclick="SubmDeleteCont('{$grid}', '{$v.issueid}')">X</u>{/if}</td>
	</tr>
	{/foreach}
	</table>
	</div>
	<br><br>
	<b>Добавить в группу</b><br>
	Эмитент <input type=text id="search_txt" class=srch onkeyup="FindContr(this.value)" style='width:427px;'><br>
	<select name="corg_list" id="corg_list" class=slct onchange="SetFndStr(this.value)" onclick="SetFndStr(this.value)">
	</select><br>
	<select name="issues_list" id="issues_list" class=slct size=10>
	</select><br>	
	{if $ia_8}
	<input id=addgrpcont type=button class=butt value="Добавить в группу">
	{/if}	
	
	{/if}


</td>

</tr></table>

</form>


{include file="footer.tpl"}