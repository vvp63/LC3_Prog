{include file="header.tpl"}

<script>

function ShowHide(fchecked) {
	let cnt = {$repodeals|count};
	for (let i = 0; i < cnt; i++) {
		var rid = 'r[' + i +']';
		var shid = 'sh[' + i +']';
		if (!fchecked) {
			document.getElementById(rid).style.display='';
		} else {
			if (document.getElementById(shid).value == "0") {
				document.getElementById(rid).style.display='none';
			} else {
				document.getElementById(rid).style.display='';
			}
		}
	}
}

</script>

<input type=checkbox onchange=ShowHide(this.checked)> Показывать только сделки клиента {$clients.$clientid.fullname|trim}
<br><br>

<div style="display: inline-block; height: 88%; width: 100%; overflow-y: auto;">

<table class=portfrl>
<tr>
{foreach from=$repodeals_h key=kh item=vh}<td class=portftop>{$vh}</td>{/foreach}
</tr>
{foreach from=$repodeals key=k item=v}
<tr id=r[{$k}] class={if $v.ClientCode == $clientid}repo{else}portf{/if}{$k % 2}>
<input type=hidden id=sh[{$k}] value={if ($v.ClientCode == $clientid) or ($clientid == 0)}1{else}0{/if}>
{foreach from=$repodeals_h key=kh item=vh}
	<td{if $vh|in_array:$fu} class=num{/if}>{if $vh|in_array:$fg}{($v.$vh)|string_format:"%.4g"}{else}{if $vh|in_array:$fu}{($v.$vh)|number_format:0:"":" "}{else}{$v.$vh}{/if}{/if}</td>
{/foreach}
</tr>
{/foreach}
</table>

</div>

<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}