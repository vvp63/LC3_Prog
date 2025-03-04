{include file="header.tpl"}

<table width=100% class=portfrl>
<tr>
	<td class=portftop>Инструмент</td>
	<td class=portftop>Эмитент</td>
	<td class=portftop>Тип инструмента</td>
	<td class=portftop>Количество</td>
	<td class=portftop>Рыночная оценка</td>
	<td class=portftop>% СЧА</td>
</tr>
{foreach from=$portf key=k item=v}
<tr class={if $v.isrestr == 1}restricted{else}portf{$k % 2}{/if}>
	<td>{$v.FullName}</td>
	<td>{$v.Issuer}</td>
	<td>{$v.InstrumentType}</td>
	<td>{$v.Quantity}</td>
	<td>{$v.MarketValue|string_format:"%d"}</td>
	<td>{$v.Percent|string_format:"%g"}</td>
</tr>
{/foreach}
</table>
<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}