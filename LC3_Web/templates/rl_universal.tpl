{include file="header.tpl"}

<script src="js/rl_universal.js"></script>


<form method="POST" id="cl_from"> 
<table width=100% class=main><tr><td class=client>
	<b>Клиент</b>
	<select name=client id=client>
		{foreach from=$clients key=k item=v}
			{if $k > 0}
			<option value={$k}{if $k==$smarty.session.client} selected{/if}>{$v.fullname}</option>
			{/if}
		{/foreach}
	</select>
</td></tr></table>
</form>

<div id="message">
{$message}
</div>
<br>


<form id="addupdate" method="POST" action="rl_universal.php">
<table width=100% class=addupdate>
<tr><td colspan=4 class=rltop id="addedittop">{if $ia_8}{if $aa.mode == "edit"}Редактировать ограничение{else}Добавить ограничение{/if}{/if}</td></tr>
<tr>
	<td class=rlsubtop>Ограничение</td>
	<td class=rlsubtop>Эмитент или группа</td>
	<td class=rlsubtop>Типы ЦБ или выпуск</td>
	<td class=rlsubtop>Величина ограничений</td>
</tr>
<tr>
	<td class=rlform>
	На <select name=CORG id=CORG>
			<option value=C{if $aa.fl == "1" and $aa.CORG == "C"} selected{/if}>Эмитента</option>
			<option value=G{if $aa.fl == "1" and $aa.CORG == "G"} selected{/if}>Группу</option>
		</select><br><br>
	Вид&nbsp;
		<select name=rtype id=rtype>
			<option value=S{if $aa.fl == "1" and $aa.rtype == "S"} selected{/if}{if $ad.fl != "1"} selected{/if}>Сумма всех бумаг указанных типов</option>
			<option value=A{if $aa.fl == "1" and $aa.rtype == "A"} selected{/if}>Любая бумага из указанных типов</option>
			<option value=I id=opti{if $aa.fl == "1" and $aa.rtype =="I"} selected{/if}>Конкретный выпуск</option>
		</select><br>	
	</td>
<td class=rlform>
	Поиск <input type=text id="search_txt" class=srch onkeyup="FindContr(this.value)"><br>
	<select name="corg_list" id="corg_list" class=slct onchange="SetFndStr(this.value)" onclick="SetFndStr(this.value)">
		{if $aa.fl == "1"}<option value="{$aa.cgrid}" selected>{$aa.cgname}</option>{/if}
	</select>
</td>
<td class=rlform>
	<div id=d_cbtypes class={if $aa.fl == "1" and $aa.rtype == "I"}unvis{else}vis{/if}>
		<select name=cbtypes[] id=cbtypes multiple size=10 class=slct>
			{foreach from=$cbtypes key=k item=v}
				<option value="{$k}"{if $aa.fl == "1" and $k|in_array:$aa.cbtypes} selected{/if}>{$v}</option>
			{/foreach}
		</select><br>
	</div>
	<div id=d_issues class={if $aa.fl == "1" and $aa.rtype == "I"}vis{else}unvis{/if}>
		<select name="issues_list" id="issues_list" class=slct{if $aa.fl == "1" and $aa.rtype == "I"} size=10{/if}>
		{if $aa.fl == "1"}
			{foreach $aa.issues key=k item=v}<option value="{$k}"{if $k == $aa.issueid} selected{/if}>{$v}</option>{/foreach}
		{/if}
		</select>
	</div>
</td>
<td class=rlform>
	{if $ia_8}
	Минимум&nbsp;&nbsp;<input type=text name=minval id=minval value="{if $aa.fl == "1"}{$aa.minval|string_format:"%g"}{else}0{/if}"><br><br>
	Максимум&nbsp;<input type=text name=maxval id=maxval value="{if $aa.fl == "1"}{$aa.maxval|string_format:"%g"}{else}0{/if}"><br><br>
	<select name="ltype" id="ltype">
		<option value=P{if $aa.fl == "1" and $aa.ltype == "P"} selected{/if}{if $aa.fl != "1"} selected{/if}>% от СЧА</option>
		<option value=R{if $aa.fl == "1" and $aa.ltype == "R"} selected{/if}>Рублей</option>
	</select><br><br>
	<input type=checkbox name="nobuy" id="nobuy" value="1"{if $aa.fl == "1" and $aa.nobuy == "1"} checked{/if}> Запрет покупки<br><br>
	<input type=hidden name="fl" id="fl" value="">
	<input type=hidden name="ed_rid" id="ed_rid" value="{if $aa.fl == "1"}{$aa.ed_rid}{/if}">
	<input type=button value="Сохранить" onclick="CheckRL()" class=butt>
	{if $aa.mode == "edit"}&nbsp;&nbsp;<input type=button value="Отмена редактирования" class=butt id="editreset">{/if}
	{/if}
</td>
</tr>

<tr>
	<td class=rlsubtop><input type="checkbox" name="fl_cgrt" id="fl_cgrt" value="1"{if $aa.fl == "1" and $aa.fl_cgrt == "1"} checked{/if}>&nbsp;Фильтровать</td>
	<td class=rlsubtop><input type="checkbox" name="fl_cgid" id="fl_cgid" value="1"{if $aa.fl == "1" and $aa.fl_cgid == "1"} checked{/if}>&nbsp;Фильтровать</td>
	<td class=rlsubtop><input type="checkbox" name="fl_tliss" id="fl_tliss" value="1"{if $aa.fl == "1" and $aa.fl_tliss == "1"} checked{/if}>&nbsp;Фильтровать</td>
	<td class=rlsubtop></td>
</tr>

</table>
<br><br>

<input type=hidden id="rlu_count" value="{$rlu|@count}">
<table width=100% class=main>
<tr><td colspan=11 class=rltop>Список существующих ограничений</td></tr>
<tr>
	<td class=rlsubtop><input type=checkbox id=cb_all onchange="CheckAll(this.checked)"></td>
	<td class=rlsubtop>Ограничение на</td>
	<td class=rlsubtop>Эмитент или группа</td>
	<td class=rlsubtop>Список типов или выпуск</td>
	<td class=rlsubtop>Минимум</td>
	<td class=rlsubtop>Максимум</td>
	<td class=rlsubtop>% СЧА / руб.</td>
	<td class=rlsubtop>Запрет покупки</td>
	<td class=rlsubtop>В портфеле</td>	
	<td class=rlsubtop>&nbsp;</td>
	<td class=rlsubtop>&nbsp;</td>
</tr>

{foreach $rlu key=k item=v}
<tr id="lstrows[{$v@iteration}]" class=rllist{$v@iteration % 2}>
	<td>
		<input type=checkbox id="cb[{$v@iteration}]" name="cb[{$v@iteration}]">
		<input type=hidden id="rid[{$v@iteration}]" value="{$k}" name="rid[{$v@iteration}]">
		<input type=hidden id="hidd[{$v@iteration}]" value="0">
	</td>
	<td>
		<input type=hidden id="hiddcgrt[{$v@iteration}]" value="{$v.CORG}{$v.RestrictType}">
		{($v.RestrictType == "I") ? "Конкретный выпуск" : (($v.RestrictType == "A") ? "Любая бумага" : "Сумма всех бумаг")} 
		{($v.CORG == "C") ? "эмитента" : "группы"}
	</td>
	<td><input type=hidden id="hiddcgid[{$v@iteration}]" value="{$v.CORGid}">
		{if $v.CORG == "C"}
			<a target="_blank" href="{$sdh_c_lnk}{$v.CORGid}">{$v.CORGname}</a>
		{else}
			{$v.CORGname}
		{/if}
	</td>
	<td>
		<input type=hidden id="hiddtl[{$v@iteration}]" value="{$v.TypesList}">
		<input type=hidden id="hiddiss[{$v@iteration}]" value="{$v.IssueRid}">
		{($v.RestrictType == "I") ? $v.Issue : $v.TLNames}
	</td>
	<td><input type=text{if not $ia_8} disabled{/if} id="lim_i[{$v@iteration}]" value="{$v.Min|string_format:"%g"}" onchange="SetIX('i', {$v@iteration}, '{$k}')"></td>
	<td><input type=text{if not $ia_8} disabled{/if} id="lim_x[{$v@iteration}]" value="{$v.Max|string_format:"%g"}" onchange="SetIX('x', {$v@iteration}, '{$k}')"></td>
	<td>{($v.LimitType == "P") ? "% от СЧА" : "руб."}</td>
	<td>{if $v.NoBuy == "1"}<b class=nobuy>&nbsp;Запрещено!&nbsp;</b>{/if}</td>
	<td><u onclick="PortfOpen({$smarty.session.client}, '{$k}')">{$v.Percent|string_format:"%g"}</u></td>
	<td>{if $ia_8}<input type=button class=butt_edit value="" onclick="SubmEdit('{$k}')">{/if}</td>
	<td>{if $ia_8}<input type=button class=butt_del value="" onclick="SubmDelete('{$k}')">{/if}</td>
</tr>
{/foreach}

</table>
<br>
{if $ia_8}
Скопировать отмеченные на клиента 
<select name="copytocl" id="copytocl" class=slct>
	{foreach from=$clients key=k item=v}
		{if $k > 0}
		<option value={$k}{if $k==$smarty.session.client} disabled{/if}>{$v.fullname}</option>
		{/if}
	{/foreach}
</select>
<input type=button value="Копировать" class=butt id="copy_all">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type=button value="Удалить отмеченные" class=butt_delch id="delch">
{/if}

</form>

{include file="footer.tpl"}