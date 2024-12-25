{include file="header.tpl"}
{include file="top_menu.tpl"}

<script src="js/portfolio.js"></script>

<form method="POST" id="cl_from"> 
<table width=100% class=main><tr><td class=client>
	<b>Клиент</b>
	<select name=client id=client>
		{foreach from=$clients key=k item=v}
			{if $k > 0}
			<option value={$k}{if $k==$smarty.session.client} selected{/if}>{$v.fullname|trim}</option>
			{/if}
		{/foreach}
	</select>
</td>
</tr></table>
<br>

<table width=100% class=main><tr>
<td class=scha>
{if $portf|@count > 0}
&emsp;Счет клиента:&nbsp;<b>{$portf.0.ClientAccount}</b>&emsp;СЧА:&nbsp;<b>{$portf.0.SummAsset|string_format:"%d"}</b>&emsp;
{/if}
</td>
<td class=flt>Сортировка по:&nbsp; 
	<select name="ordby" id="ordby">
		{foreach from=$ord_var key=k item=v}
		<option value="{$k}"{if $k==$smarty.session.ordby} selected{/if}>{$v}</option>
		{/foreach}
	</select>
&emsp;&emsp;
Фильтр:&nbsp;<input class="srch" type="text" id="flt_txt" name="flt_txt" value="{$flt_txt}">&emsp;
<input type="checkbox" name="fl_hide" id="fl_hide" value="1"{if $smarty.session.fl_hide == "1"} checked{/if}>&nbsp;Скрывать
&emsp;&emsp;
</td>
<td><input type=button class=butt value="Статистика портфеля" onclick="StatOpen({$smarty.session.client})">
</td>
</tr></table>
</form>

<input type=hidden id="p_count" value="{$portf|@count}">
<table width=100% class=portfrl>
<tr>
	<td width=10></td>
	{foreach from=$fields key=k item=v}
	{if not $v|in_array:$fhide}<td class=portftop>{$v}</td>{/if}
	{/foreach}
</tr>
{foreach from=$portf key=k item=v}
<tr id="lstrows[{$k}]" class=portf{$k % 2}>
	<td width=10>
		<input type=hidden id="ftxt[{$k}]" value='{foreach from=$fields key=fk item=fv}{if $fv|in_array:$ffind}{$v.$fv} {/if}{/foreach}'>
	</td>
	{foreach from=$fields key=fk item=fv}
	{if not $fv|in_array:$fhide}
	<td>{if $fv == "Issuer"}<a target="_blank" href="{$sdh_c_lnk}{$v.contrid}">{/if}
{if $fv|in_array:$fbold}<b>{/if}{if $fv|in_array:$fg}{($v.$fv)|string_format:"%g"}{else}{if $fv|in_array:$fd}{($v.$fv)|date_format:"%Y-%m-%d"}{else}{$v.$fv}{/if}{/if}{if $fv|in_array:$fbold}</b>{/if}
{if $fv == "Issuer"}</a>{/if}</td>
	{/if}
	{/foreach}
</tr>
{/foreach}
</table>
<br><br>

{include file="footer.tpl"}