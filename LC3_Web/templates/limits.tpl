{include file="header.tpl"}
{include file="top_menu.tpl"}

<script>

	$(function() {
	
		$('#clientid').on('blur', function(){
			$('#cl_from').submit();
		});
		
		$('#limitid').on('change', function(){
			$('#cl_from').submit();
		});	
		
	});	
	
	function SaveCh(clid, limid) {
		let iaid = 'ia_' + clid + '_' + limid;
		let chuid = 'chu_' + clid + '_' + limid;
		
		let miid = 'mi_' + clid + '_' + limid;
		let lwid = 'lw_' + clid + '_' + limid;
		let uwid = 'uw_' + clid + '_' + limid;
		let mxid = 'mx_' + clid + '_' + limid;
		
		let iacheck = 0;
		
		if (document.getElementById(iaid).checked) {
			document.getElementById(chuid).style.display='';
			iacheck = 1;
		} else {
			document.getElementById(chuid).style.display='none';
		}
		
		xmlhttp=new XMLHttpRequest();
		var body = 	'clientid=' + encodeURIComponent(clid) + '&limitid=' + encodeURIComponent(limid) +
					'&isactive=' + encodeURIComponent(iacheck) +
					'&min=' + encodeURIComponent(document.getElementById(miid).value) + '&max=' + encodeURIComponent(document.getElementById(mxid).value) +
					'&lw=' + encodeURIComponent(document.getElementById(lwid).value) + '&uw=' + encodeURIComponent(document.getElementById(uwid).value);
		xmlhttp.onreadystatechange=function() {
			if (this.readyState==4 && this.status==200) {
				const answarr = this.responseText.split(";");
				if (answarr.length > 4) {
					document.getElementById(miid).value = answarr[1];
					document.getElementById(mxid).value = answarr[2];
					document.getElementById(lwid).value = answarr[3];
					document.getElementById(uwid).value = answarr[4];
				}
			}
		}
		xmlhttp.open("POST", "./s_lm_change.php", true);
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xmlhttp.send(body);			
	}
	
	function CheckLimit(clid, limid) {
		let link = './check_limit.php?clientid=' + clid + '&limitid=' + limid;
		window.open(link, "_blank", "left=50, top=20, width=1600, height=900");
	}
	
	function CheckAll() {
		let link = './check_all.php';
		window.open(link, "_blank", "left=50, top=20, width=1600, height=900");
	}
	
</script>

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