<table class=portfrl>
<tr>
	<td class=portftop>ЦБ</td>
	<td class=portftop>Количество</td>
	<td class=portftop>Объем выпуска</td>
	<td class=portftop>% от объема</td>
</tr>
{foreach from=$sldata key=k item=v}
<tr class=portf0>
	<td>{$v.CB}</td>
	<td>{$v.SummQty}</td>
	<td>{$v.announced_volume|string_format:"%u"}</td>		
	<td>{$v.Percent|string_format:"%6.f"}</td>
</tr>
{/foreach}
</table>