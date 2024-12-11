{include file="header.tpl"}

<table width=100% class=portfrl>
<tr>
	<td class=rlsubtop>Инструмент</td>
	<td class=rlsubtop>Эмитент</td>
	<td class=rlsubtop>Тип инструмента</td>
	<td class=rlsubtop>Количество</td>
	<td class=rlsubtop>Рыночная оценка</td>
	<td class=rlsubtop>% СЧА</td>
</tr>
{foreach $portf key=k item=v}
<tr class={if $v.isrestr == 1}restricted{else}rllist{$k % 2}{/if}>
	<td>{$v.FullName}</td>
	<td>{$v.Issuer}</td>
	<td>{$v.InstrumentType}</td>
	<td>{$v.Quantity}</td>
	<td>{$v.MarketValue}</td>
	<td>{$v.Percent|string_format:"%g"}</td>
</tr>
{/foreach}
</table>
<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}