{include file="header.tpl"}

<table class=portfrl>
<tr>
{foreach from=$repodeals_h key=kh item=vh}<td class=portftop>{$vh}</td>{/foreach}
</tr>
{foreach from=$repodeals key=k item=v}
<tr class={if $v.ClientCode == $clientid}repo{else}portf{/if}{$k % 2}>
{foreach from=$repodeals_h key=kh item=vh}
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