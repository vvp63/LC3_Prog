{include file="header.tpl"}

<div style="display: inline-block; height: 92%; width: 100%; overflow-y: auto;">

<table>
<tr>
<td class=pstat>Статистика по типам ЦБ</td>
<td class=pstat>Статистика по эмитентам</td>
</tr><tr>
<td class=pstat>
<table class=portfrl>
{foreach from=$stat_t key=k item=v}
<tr>
	<td class=portftop>{$v.InstrumentType}</td>
	<td class=portftop>{$v.sPercent|string_format:"%.4g"} %</td>
	<td class=portftop><nobr>{($v.sMarketValue)|number_format:0:"":" "}</nobr></td>	
</tr>
	{foreach from=$stat_ts key=sk item=sv}
		{if $v.InstrumentType == $sv.InstrumentType}
<tr class=portf0>
	<td>{$sv.InstrumentSubtype}</td>
	<td>{$sv.sPercent|string_format:"%.4g"} %</td>
	<td><nobr>{($sv.sMarketValue)|number_format:0:"":" "}</nobr></td>		
</tr>
		{/if}
	{/foreach}
{/foreach}
</table>

</td><td class=pstat>

<table class=portfrl>
<tr>
<td class=portftop>Эмитент</td>
<td class=portftop>% СЧА</td>
<td class=portftop>Оценка</td>
</tr>
{foreach from=$stat_iss key=k item=v}
<tr class=portf{$k % 2}>
	<td>{$v.Issuer}</td>
	<td>{$v.sPercent|string_format:"%.4g"} %</td>
	<td><nobr>{($v.sMarketValue)|number_format:0:"":" "}</nobr></td>	
</tr>
{/foreach}
</table>

</td>
</tr>
</table>

</div>

<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}