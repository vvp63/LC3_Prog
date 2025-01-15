{include file="header.tpl"}
{include file="top_menu.tpl"}

<script>
	$(function() {
	
		$('#clientid').on('change', function(){
			$('#cl_from').submit();
		});
		
		$('#limitid').on('change', function(){
			$('#cl_from').submit();
		});	
		
	});	
	
</script>

<form method="POST" id="cl_from"> 
<b>Клиент</b>
<select name="clientid" id="clientid">
	{foreach from=$clients key=k item=v}
	<option value={$k}{if $k == $smarty.session.clientid} selected{/if}>{$v.fullname|trim}</option>
	{/foreach}
</select>
 &emsp; &emsp;
<b>Лимит</b>
<select name="limitid" id="limitid">
	{foreach from=$limits key=k item=v}
	<option value={$k}{if $k == $smarty.session.limitid} selected{/if}>{$v.Name|trim}</option>
	{/foreach}
</select>
<form>

<table>
<tr>
<td>Клиент</td>
<td>Лимит</td>
<td>Активен</td>
<td>Мин. значение</td>
<td>Нижний предел</td>
<td>Верхний предел</td>
<td>Мак. значение</td>
</tr>
{foreach from=$cl_limits key=k item=v}
	<tr>
	<td>{$v.ClientName}</td>
	<td>{$v.Name}</td>
	<td><input type=checkbox id=ia_{$v.ClientCode}_{$v.LimitId} value=1{if $v.IsActive == 1} checked{/if} onchange="SaveCh({$v.ClientCode}, {$v.LimitId})"></td>
	<td><input type=text id=mi_{$v.ClientCode}_{$v.LimitId} value='{$v.MinValue|string_format:"%g"}' onchange="SaveCh({$v.ClientCode}, {$v.LimitId})"></td>
	<td><input type=text id=lw_{$v.ClientCode}_{$v.LimitId} value='{$v.LowerWarning|string_format:"%g"}' onchange="SaveCh({$v.ClientCode}, {$v.LimitId})"></td>
	<td><input type=text id=lw_{$v.ClientCode}_{$v.LimitId} value='{$v.UpperWarning|string_format:"%g"}' onchange="SaveCh({$v.ClientCode}, {$v.LimitId})"></td>
	<td><input type=text id=mx_{$v.ClientCode}_{$v.LimitId} value='{$v.MaxValue|string_format:"%g"}' onchange="SaveCh({$v.ClientCode}, {$v.LimitId})"></td>
	</tr>
{/foreach}
</table>


{include file="footer.tpl"}