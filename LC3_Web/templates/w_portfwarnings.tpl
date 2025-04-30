{include file="header.tpl"}

<b class=limcl >Предупреждения по портфелям.<br><br></b>

<table class=checkres>
<tr>
{foreach from=$check_res_h key=kh item=vh}<td class=checktop>{$vh}</td>{/foreach}
</tr>
{foreach from=$check_res key=k item=v}
<tr>
{foreach from=$check_res_h key=kh item=vh}
	<td>{if $vh|in_array:$fd}{($v.$vh)|string_format:"%d"}{else}{$v.$vh}{/if}</td>
{/foreach}
</tr>
{/foreach}
</table>

<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}