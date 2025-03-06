{include file="header.tpl"}

<script>

$(function() {

	FillByDate();
	
	$('#evdate').on('change', function(){
		FillByDate();
	});	

});	

function FillByDate() {
	var sldt = document.getElementById("evdate").value;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			document.getElementById("portf").innerHTML = this.responseText;
		}
	}
	xmlhttp.open("POST", "./s_sldata.php?sldate=" + sldt, true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send('');
}

function SetReaded(vCB, vDate) {
	var body = 'cb=' + encodeURIComponent(vCB) + '&sldate=' + encodeURIComponent(vDate);
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			location.reload();
		}
	}
	xmlhttp.open("POST", "./s_evreaded.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);
}

</script>

<b>Переход через 5% барьер.<br><br></b>

<div style="display: inline-block; height: 250px; overflow-y: auto;">
<table class=portfrl>
<tr>
	<td class=portftop>Дата</td>
	<td class=portftop>ЦБ</td>
	<td class=portftop>Текущее</td>
	<td class=portftop>Предыдущее</td>
	<td class=portftop></td>
</tr>
{foreach from=$events key=k item=v}
<tr class={if $v.Readed == 0}restricted{else}portf0{/if}>
	<td>{$v.Date|date_format:"%Y-%m-%d"}</td>
	<td>{$v.CBFull}</td>
	<td>{$v.PCurr|string_format:"%6.f"}</td>
	<td>{$v.PPrev|string_format:"%6.f"}</td>	
	{assign var="evdate" value=$v.Date|date_format:"%Y%m%d"}
	<td>{if $v.Readed == 0}<u onclick="SetReaded('{$v.CB}', '{$evdate}')">Readed</u>{/if}</td>
</tr>
{/foreach}
</table>
</div>
<br><br>

<b>Портфель на дату&nbsp;</b>
<select id=evdate>
{foreach from=$evdates key=k item=v}
<option {if $k == 1}selected {/if}value="{$v|date_format:"%Y%m%d"}">{$v|date_format:"%Y-%m-%d"}</option>
{/foreach}
</select><br>

<div id=portf style="display: inline-block; height: 450px; overflow-y: auto;">
</div>

<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}