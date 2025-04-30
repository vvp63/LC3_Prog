{include file="header.tpl"}
{include file="top_menu.tpl"}

<script src="js/portfolio.js"></script>

<form method="POST" id="cl_from"> 
<table width=100% class=main><tr>
<td class=client>
	<b>Клиент</b>
	<select name=client id=client disabled>
		<option value=0{if $smarty.session.clientid==0} selected{/if}>...Все...</option>
		{foreach from=$clients key=k item=v}
		<option value={$k}{if $k==$smarty.session.clientid} selected{/if}>{$v.fullname|trim}</option>
		{/foreach}
	</select>
	&emsp;&emsp;Портфель 
	<select name=ptype id=ptype disabled>
		{foreach from=$ptype_lst key=k item=v}
		<option value="{$k}"{if $smarty.session.ptype == $k} selected{/if}>{$v}</option>
		{/foreach}
	</select>
	&emsp;<input type=button class=butt value="Сделки РЕПО" onclick="RepoOpen({$smarty.session.clientid})">
</td>

<td class=scha>
{if $ia_4}<input type=button class=butt_model value="Портфель >> Модельный" onclick="CopyModel()">
&emsp;<input type=button class=butt_model value="Модельная сделка" onclick="ModelDeal({$smarty.session.clientid})">
{/if}
</td>
<td class=client>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td class=scha>
	<input type=button id="rfbt" class="butt_chall" value="Обновить" onclick="PortfolioRefresh()">&emsp;
	<input type=button class="butt_model" value="Предупреждения" onclick="PortfolioWarnings()">
</td>

</tr></table>
<br>

<table width=100% class=main><tr>
<td class=scha>
{if ($portf|@count > 0) and ($smarty.session.clientid != 0)}
&emsp;Счет клиента:&nbsp;<b>{$portf.0.ClientAccount}</b>&emsp;СЧА:&nbsp;<b>{$portf.0.SummAsset|number_format:0:"":" "}</b>&emsp;
{/if}
</td>
<td class=flt>Сортировка по:&nbsp; 
	<select name="ordby" id="ordby" disabled>
		{foreach from=$ord_var key=k item=v}
		<option value="{$k}"{if $k==$smarty.session.ordby} selected{/if}>{$v}</option>
		{/foreach}
	</select>
&emsp;&emsp;
Фильтр:&nbsp;<input class="srch" type="text" id="flt_txt" name="flt_txt" value="{$flt_txt}">&emsp;
<input type="checkbox" name="fl_hide" id="fl_hide" value="1"{if $smarty.session.fl_hide == "1"} checked{/if}>&nbsp;Скрывать
&emsp;&emsp;
</td>
<td><input type=button class=butt value="Статистика портфеля" onclick="StatOpen({$smarty.session.clientid})">
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
<tr id="lstrows[{$k}]" class={if ($v.InstrumentName)|substr:0:3 == '(M)'}repo{else}portf{/if}{$k % 2}>
	<td width=10>
		<input type=hidden id="ftxt[{$k}]" value='{foreach from=$fields key=fk item=fv}{if $fv|in_array:$ffind}{$v.$fv} {/if}{/foreach}'>
		<input type=hidden id="ismod[{$k}]" value="{if ($v.InstrumentName)|substr:0:3 == '(M)'}1{else}0{/if}">
	</td>
{foreach from=$fields key=fk item=fv}
{if not $fv|in_array:$fhide}
	<td{if $fv|in_array:$fu} class=num{/if}>{if $fv == "Issuer"}<a target="_blank" href="{$sdh_c_lnk}{$v.contrid}">{/if}{if $fv|in_array:$fbold}<b>{/if}
{if $fv|in_array:$fu}{($v.$fv)|number_format:0:"":" "}{else}{if $fv|in_array:$fg}{($v.$fv)|string_format:"%.4g"}{else}{if $fv|in_array:$fd}{($v.$fv)|date_format:"%Y-%m-%d"}{else}{$v.$fv}{/if}{/if}{/if}
{if $fv|in_array:$fbold}</b>{/if}{if $fv == "Issuer"}</a>{/if}</td>
{/if}
{/foreach}
</tr>
{/foreach}
</table>
<br><br>

{include file="footer.tpl"}