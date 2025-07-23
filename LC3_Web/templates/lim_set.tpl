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

<form action='./lim_set.php?limid={$limid}' method=post>
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
<input type=checkbox id=cmplx name=lim_complex{if ($limits.$limid.IsComplex == 1) or ($limid == 0)} checked{/if}> Составной &emsp;
Запрос
<select name=lim_query id=qrylst{if ($limits.$limid.IsComplex == 1) or ($limid == 0)} disabled{/if}>
{foreach from=$qlst key=k item=v}<option value={$v}{if $v == $limits.$limid.LimitQuery} selected{/if}>{$v}</option>{/foreach}
</select>

<tr><td>
</table>

</form>


</td>


<td style='width: 100%; vertical-align: top; padding-left: 20px;'>
&nbsp;
</td>

</tr></table>

{include file="footer.tpl"}