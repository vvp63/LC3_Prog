{include file="header.tpl"}

<b class=limcl >Лимит {$limits.$limitid.Name}. Клиент {$clients.$clientid.fullname}.<br><br></b>

{assign var="maxfl" value="0"}
{assign var="maxlv" value="0"}
<table class=checkres>
<tr>
{foreach from=$check_res_h key=kh item=vh}{if not $vh|in_array:$fh}<td class=checktop>{$vh}</td>{/if}{/foreach}
<td class=checktop>&nbsp;</td>
</tr>
{foreach from=$check_res key=k item=v}
<tr>
{foreach from=$check_res_h key=kh item=vh}
{if not $vh|in_array:$fh}
	<td>{if $vh|in_array:$fg}{($v.$vh)|string_format:"%g"}{else}{if $vh|in_array:$fu}{($v.$vh)|string_format:"%u"}{else}{$v.$vh}{/if}{/if}</td>
{/if}
{/foreach}
{if $v.FailLevel > 10}<td class=res_err>Х</td>{else}{if $v.FailLevel > 0}<td class=res_warn>!</td>{else}<td class=res_ok>OK</td>{/if}{/if}
{if $v.FailLevel > $maxfl}{assign var="maxfl" value=$v.FailLevel}{/if}
{if $v.LimitValue > $maxlv}{assign var="maxlv" value=$v.LimitValue}{/if}
</tr>
{/foreach}
</table>
<br>
<script>
	var chtd = 'chtd_{$clientid}_{$limitid}';
	window.opener.document.getElementById(chtd).className = '{if $maxfl > 10}res_err{else}{if $maxfl > 0}res_warn{else}res_ok{/if}{/if}';
	var chu = 'chu_{$clientid}_{$limitid}';
	window.opener.document.getElementById(chu).innerHTML =  '{$maxlv|string_format:"%.1f"} ({if $maxfl > 10}Х{else}{if $maxfl > 0}!{else}OK{/if}{/if})';	
</script>

Список ЦБ, подходящих под условие нарушения<br>
<table class=portfrl>
<tr>
{foreach from=$instr_res_h key=kh item=vh}<td class=portftop>{$vh}</td>{/foreach}
</tr>
{foreach from=$instr_res key=k item=v}
<tr class=portf0>
{foreach from=$instr_res_h key=kh item=vh}
<td>{if $vh|in_array:$fg}{($v.$vh)|string_format:"%g"}{else}{if $vh|in_array:$fu}{($v.$vh)|string_format:"%u"}{else}{$v.$vh}{/if}{/if}</td>
{/foreach}
</tr>
{/foreach}
</table>

<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}