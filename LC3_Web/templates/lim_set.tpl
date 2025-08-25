{include file="header.tpl"}
{include file="top_menu.tpl"}

<script>

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

</script>


<table style='height: 90%; width: 100%; border: 2px solid #C0C0F0; margin: 1 px; padding: 1px;'>
<tr>
<td style='width: 430px; vertical-align: top;'>
	<input type=hidden id="l_count" value="{$limits|@count}">
	<div style="display: inline-block; height: 700px; width: 420px; overflow-y: auto;" id=grpdiv>
	<table class=portfrl style='width: 400px;'>
	<tr>
	<td class=portftop>Номер</td>
	<td class=portftop>Лимит <input type=text id=fndtxt onkeyup="FindLim()"></td>
	</tr>
	{foreach from=$limits key=k item=v}
	<tr class={if $k == $limid}repo1{else}portf1{/if} id=rw[{$k}]>
	<td{if $k == $limid} id=tdact{/if}>{$k}</td>
	<td class=nowrp><a href='./lim_set.php?limid={$k}'>{$v.Name}</a><input type=hidden id="ftxt[{$k}]" value='{$v.Name}'></td>
	</tr>
	{/foreach}
	</table>
	</div>

</td>

<td style='width: 400px; vertical-align: top;'>

<form action='./lim_set.php?limid={$limid}' method=post id=cl_form>
<table class=addupdate>
<tr><td class=rlsubtop>
{if $limid > 0}<b>Лимит {$limid}.</b> &emsp; <a href='./lim_set.php'>Новый</a>{else}<b>Новый лимит</b>{/if}
</td></tr>
<tr class=rllist0><td style='font-size: 14px;'>
<input type=text class=liminp name=lim_name{if $limid > 0} value='{$limits.$limid.Name}'{/if}><br>
Портфель <select name=lim_portf>
{foreach from=$ftlst key=k item=v}<option value={$k}{if $k == $limits.$limid.FTId} selected{/if}>{$v.Comment}</option>{/foreach}
</select><br>
<input type=checkbox name=lim_emit{if $limits.$limid.GroupByEmit == 1} checked{/if}> По эмитентам &emsp;
<input type=checkbox name=lim_instr{if $limits.$limid.GroupByInstr == 1} checked{/if}> По инструментам<br>
<input type=checkbox id=cmplx onclick="EDQlist()" name=lim_complex{if ($limits.$limid.IsComplex == 1) or ($limid == 0)} checked{/if}> Составной &emsp;
Запрос
<select name=lim_query id=qrylst{if ($limits.$limid.IsComplex == 1) or ($limid == 0)} disabled{/if}>
{foreach from=$qlst key=k item=v}<option value={$v}{if $v == $limits.$limid.LimitQuery} selected{/if}>{$v}</option>{/foreach}
</select>

</td></tr>
</table>
<br>
<input type=hidden name=action id=action value='addupd_cl'>
<input type=hidden name=limid value={$limid}>
<input type=submit class=butt value='Сохранить'>
{if $limid > 0}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type=button class=butt_sl value='Удалить' onclick="DeleteCL({$limid})">{/if}
</form><br>


{if $limid > 0}

<b>Объекты лимита</b><br>

<table class=portfrl style='width: 400px;'>
{foreach from=$objects key=k item=v}
<tr class={if $k == $objid}repo1{else}portf1{/if}>
<td class=nowrp><a href='./lim_set.php?limid={$limid}&objid={$k}'>{$v.Name}</a></td>
</tr>
{/foreach}
</table>
<br>

<form action='./lim_set.php?limid={$limid}&objid={$objid}' method=post id=obj_form>
<table class=addupdate>
<tr><td class=rlsubtop>
{if $objid > 0}<b>Объект {$objid}.</b> &emsp; <a href='./lim_set.php?limid={$limid}'>Новый</a>{else}<b>Новый объект</b>{/if}
</td></tr>
<tr class=rllist0><td style='font-size: 14px;'>
<input type=text class=liminp id=lim_name name=lim_name{if $objid > 0} value='{$objects.$objid.Name}'{/if}><br>
</td></tr>
</table>
<br>
<input type=hidden name=action_obj id=action_obj value='addupd_obj'>
<input type=hidden name=objid value={$objid}>
<input type=hidden name=limid value={$limid}>
<input type=submit class=butt value='Сохранить'>
{if $objid > 0}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type=button class=butt_sl value='Удалить' onclick="DeleteObj({$limid}, {$objid}, '{$objects.$objid.Name}')">{/if}
</form><br>

{/if}

</td>

<td style='width: 100%; vertical-align: top; padding-left: 20px;'>

{if $objid > 0}
<table>
{foreach from=$params key=k item=v}
<tr>
<td>{$v.Name}</td>
<td>
{if $v.ListTable == ""}
<input type=text>
{else}
<select>
<option>...</option>
{foreach from=$v.plst key=ko item=vo}<option>{$vo.Name}</option>{/foreach}
</select>
{/if}
</td></tr>
{/foreach}
</table>
{/if}

&nbsp;
</td>

</tr></table>

{include file="footer.tpl"}