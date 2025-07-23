{include file="header.tpl"}
{include file="top_menu.tpl"}

<script src="js/groups.js"></script>

<form  method="POST" id=actfrm>
<input type=hidden id=action name=action value=''>
<input type=hidden id=fgrid name=fgrid value=''>
<input type=hidden id=fcontrid name=fcontrid value=''>

<table style='height: 90%; width: 100%; border: 2px solid #C0C0F0; margin: 1 px; padding: 1px;'>
<tr>
<td style='width: 600px; vertical-align: top;'>

	<input type=hidden id="g_count" value="{$groups|@count}">
	<b>Группы</b><br>
	{if $actres == 1}Добавлена группа "{$newgrpname}"<br>{/if}
	<div style="display: inline-block; height: 700px; width: 600px; overflow-y: auto;" id=grpdiv>
	<table class=portfrl>
	<tr>
	<td class=portftop>Номер</td>
	<td class=portftop>Наименование <input type=text id=fndtxt onkeyup="FindGrp()"> </td>
	</tr>
	{foreach from=$groups key=k item=v}
	<tr class={if $v.Id == $grid}repo1{else}portf1{/if} id=rw[{$k}]><td{if $v.Id == $grid} id=tdact{/if}>{$v.Id}</td>
	<td><a href='/groups.php?grid={$v.Id}'>{$v.GroupName}</a><input type=hidden id="ftxt[{$k}]" value='{$v.GroupName}'></td>
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
	<b>Группа № {$grid} "{$grname}"</b>{if $ia_8}&emsp;<input type=button class=butt_sl value="Удалить" onclick="SubmDelete('{$grid}')">{/if}<br>  
	<div style="display: inline-block; max-height: 400px; overflow-y: auto;">
	<table class=portfrl>
	<tr><td class=portftop>Эмитент</td><td></td></tr>
	{foreach from=$grpcont key=k item=v}
	<tr class=portf1 id=rwgc[{$k}]><td><a href={$sdh_c_lnk}{$v.contrid} target=_blank>{$v.cname}</a><input type=hidden id="ftxtgc[{$k}]" value='{$v.cname}'></td>
	<td>{if $ia_8}<u class=del onclick="SubmDeleteCont('{$grid}', '{$v.contrid}')">X</u>{/if}</td>
	</tr>
	{/foreach}
	</table>
	</div>
	<br>
	Поиск <input type=text id="csrch" class=srch onkeyup="FindContr()">&nbsp;<input type=checkbox id="filter" onclick="FindContr()">&nbsp;Фильтровать<br>
	<select name="contr" id="contr" class=slct></select>&nbsp;
	{if $ia_8}
	<input id=addgrpcont type=button class=butt value="Добавить в группу">
	{/if}
	{/if}

</td>

</tr></table>

</form>


{include file="footer.tpl"}