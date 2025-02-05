{include file="header.tpl"}

<script>

{if $res == 1}
window.addEventListener('load', () => {
	window.opener.location.reload();
});
{/if}

function FindInstr(str) {
	if (str.length < 2) {
		document.getElementById("instr_list").innerHTML="";
		return;
	}
	xmlhttp=new XMLHttpRequest();
	var body = 'search_txt=' + encodeURIComponent(str);
	xmlhttp.onreadystatechange=function() {
		if (this.readyState==4 && this.status==200) {
			document.getElementById("instr_list").innerHTML=this.responseText;
		}
	}
	xmlhttp.open("POST", "./s_modelinstr.php", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlhttp.send(body);
}

function AddSubm() {
	document.getElementById("add_subm").disabled=true;
	document.getElementById("addfrm").submit();
}

</script>

{if $res == 2}<b class=nobuy>Параметры сделки заданы некорректно</b><br>{/if}
<form method="post" id="addfrm">
<table class=main width=100%>
<tr>
<td class=client colspan=2>Клиент: <b>{$clients.$clientid.fullname}<b></td>
</tr>
<tr>
<td class=client colspan=2>
	Инструмент: <input type=text id="search_txt" class=srch onkeyup="FindInstr(this.value)" style='width: 700px'><br>
	<select name="instr_list" id="instr_list" class=slct style='width: 820px'>
	</select>
</td>
</tr>
<tr>
<td class=client>Количество <input type=text id="quantity" name="quantity" class=srch style='width: 200px'></td>
<td class=client>Объем <input type=text id="value" name="value" class=srch style='width: 200px'></td>
</tr>
<tr>
<td class=cnt colspan=2>
<input type=hidden name="add" value="ok">
<input type=button class=butt_model id=add_subm value="Добавить сделку" onclick="AddSubm()">
</td>
</tr>
</table>
</form>


<br><br>
<center>
<input type=button class=butt value="Закрыть окно" onclick="window.close()">
</center>

{include file="footer.tpl"}