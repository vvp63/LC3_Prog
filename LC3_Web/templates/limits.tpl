{include file="header.tpl"}
{include file="top_menu.tpl"}

<script src="js/limits.js"></script>

<form method="POST" id="cl_from"> 
<table class=main>
<tr>
	<td class=rlsubtop>Клиент<br>
	<select name="cl_lst[]" id="clientid" multiple size=5>
		{foreach from=$clients key=k item=v}
		<option value={$k}{if $k|in_array:$smarty.session.cl_lst} selected{/if}>{$v.fullname|trim}</option>
		{/foreach}
	</select>
	</td>
	<td class=rlsubtop>Лимит<br>
	<select name="limitid" id="limitid">
		{foreach from=$limits key=k item=v}
		<option value={$k}{if $k == $smarty.session.limitid} selected{/if}>{$v.Name|trim}</option>
		{/foreach}
	</select>
	
	<br><br>
	<input type="checkbox" name="ch_model" id="ch_model" value="1"{if not $ia_4} disabled{/if}>&nbsp;Проверять модельный портфель
	</td>
	<td class=rlsubtop>Активен</td>
	<td class=rlsubtop>Мин. значение</td>
	<td class=rlsubtop>Нижний предел</td>
	<td class=rlsubtop>Верхний предел</td>
	<td class=rlsubtop>Макс. значение</td>
	<td class=rlsubtop>Проверка<br><br>{if $ia_2 || $ia_16}<input type="button" class="butt_chall" value="Check All" onclick="CheckAll()">{/if}</td>
</tr>
{foreach from=$cl_limits key=k item=v}
<tr class=rllist{if $v.IsActive != 1}_na{else}{$k % 2}{/if}>
	<td>{$v.ClientName}</td>
	<td>{$v.Name}</td>
	<td class=cnt><input type=checkbox id=ia_{$v.ClientCode}_{$v.LimitId} value=1{if $v.IsActive == 1} checked{/if}{if $ia_16} onchange='SaveCh({$v.ClientCode}, {$v.LimitId})'{else} disabled{/if}></td>
	<td class=cnt><input type=text class=limval id=mi_{$v.ClientCode}_{$v.LimitId} value='{$v.MinValue|string_format:"%g"}'{if $ia_16} onchange='SaveCh({$v.ClientCode}, {$v.LimitId})'{else} disabled{/if}></td>
	<td class=cnt><input type=text class=limval id=lw_{$v.ClientCode}_{$v.LimitId} value='{$v.LowerWarning|string_format:"%g"}'{if $ia_16} onchange='SaveCh({$v.ClientCode}, {$v.LimitId})'{else} disabled{/if}></td>
	<td class=cnt><input type=text class=limval id=uw_{$v.ClientCode}_{$v.LimitId} value='{$v.UpperWarning|string_format:"%g"}'{if $ia_16} onchange='SaveCh({$v.ClientCode}, {$v.LimitId})'{else} disabled{/if}></td>
	<td class=cnt><input type=text class=limval id=mx_{$v.ClientCode}_{$v.LimitId} value='{$v.MaxValue|string_format:"%g"}'{if $ia_16} onchange='SaveCh({$v.ClientCode}, {$v.LimitId})'{else} disabled{/if}></td>
	<td class=cnt id=chtd_{$v.ClientCode}_{$v.LimitId}>
	{if $ia_2 || $ia_16}<u{if $v.IsActive != 1} style='display: none'{/if} id=chu_{$v.ClientCode}_{$v.LimitId} onclick="CheckLimit({$v.ClientCode}, {$v.LimitId})">Check</u>{/if}
	</td>	
</tr>
{/foreach}
</table>
<form>

{include file="footer.tpl"}