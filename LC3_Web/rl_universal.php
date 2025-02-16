<?

include("./incl/header.php");

$_SESSION["clientid"] = ($_POST["client"] ? $_POST["client"] : ($_SESSION["clientid"] ? $_SESSION["clientid"] : 1));

$ia_8 = is_admin(8); 

$message = "";

$aa["CORG"] = $_POST["CORG"]; $aa["rtype"] = $_POST["rtype"];
$aa["cbtypes"] = $_POST["cbtypes"]; $aa["ltype"] = $_POST["ltype"]; 
$aa["minval"] = $_POST["minval"]; $aa["maxval"] = $_POST["maxval"]; $aa["nobuy"] = $_POST["nobuy"];
$aa["cgrid"] = $_POST["corg_list"]; $aa["issueid"] = $_POST["issues_list"];
$aa["fl_cgrt"] = $_POST["fl_cgrt"]; $aa["fl_cgid"] = $_POST["fl_cgid"];  $aa["fl_tliss"] = $_POST["fl_tliss"];

if ( ($ia_8) && ($_POST["fl"] == "del") && (isset($_POST["ed_rid"])) ) {
	$aa["fl"] = 1;
	$query = "DELETE FROM RL_Universal WHERE id = '".$_POST["ed_rid"]."'";
	$dbh->query($query);
	$message .= "Ограничение удалено";
}

//	Вход в редактирование записи
if ( ($ia_8) && ($_POST["fl"] == "edit")) {
	if (isset($_SESSION["clientid"]) && ($_SESSION["clientid"] > 0)) {
		$aa["fl"] = 1; $aa["mode"] = "edit"; $aa["ed_rid"] = $_POST["ed_rid"];
	
		$query = "SELECT CORG, CORGid, RestrictType, IssueRid, TypesList, LimitType, Min, Max, NoBuy
						FROM RL_Universal WHERE id = '".$aa["ed_rid"]."' AND ClientId = '".$_SESSION["clientid"]."'";
		foreach($dbh->query($query) as $row) {
			$aa["CORG"] = $row["CORG"]; $aa["rtype"] = $row["RestrictType"];
			$aa["cbtypes"] = explode(";", $row["TypesList"]); $aa["ltype"] = $row["LimitType"]; 
			$aa["minval"] = $row["Min"]; $aa["maxval"] = $row["Max"]; $aa["nobuy"] = $row["NoBuy"];
			$aa["cgrid"] = $row["CORGid"]; $aa["issueid"] = $row["IssueRid"];
		}
	} else {
		$message = "Клиент не выбран.";
	}	
}

//	Добавление или редактирование записи
if ( ($ia_8) && ($_POST["fl"] == "add")) {
	if (isset($_SESSION["clientid"]) && ($_SESSION["clientid"] > 0)) {	
		$cbt = ""; foreach ($aa["cbtypes"] as $t) $cbt .= $t.";";
		$aa["fl"] = 1;

		if (!isset($_POST["corg_list"]) || (($_POST["rtype"] == 'I') && !isset($_POST["issues_list"])) ||
			(($_POST["rtype"] != 'I') && ($cbt == "")) || !isset($_POST["minval"]) || !isset($_POST["minval"])) {
				$message .= "Не заданы все обязательные параметры (эмитент или группа, список типов бумаг или выпуск, размер ограничений)";
			} else {			
				$query = "EXEC [RL_U_AddUpdate] @ClientId = ".$_SESSION["clientid"].", @CORG = '".$_POST["CORG"]. "', @CORGid = '".$_POST["corg_list"]."'".
						", @RestrictType = '".$_POST["rtype"]."', @IssueRid = ".($_POST["rtype"] == 'I' ? "'".$_POST["issues_list"]."'" : 'NULL').
						", @TypesList = ".($_POST["rtype"] == 'I' ? "NULL" : "'".$cbt."'").", @LimitType = '".$_POST["ltype"]."'".
						", @Min = ".$_POST["minval"].", @Max = ".$_POST["maxval"].
						", @NoBuy = ".((isset($_POST["nobuy"]) && ($_POST["nobuy"] == 1)) ? "1" : "0").
						( (isset($_POST["ed_rid"]) && ($_POST["ed_rid"] != "")) ? ", @Ridtodel = '".$_POST["ed_rid"]."'" : "");					
				$dbh->query($query);
				$message .= "Ограничение сохранено";					
			}
	} else {
		$message = "Клиент не выбран.";
	}
}

//	Массовое копирование
if ( ($ia_8) && ($_POST["fl"] == "copyall")) {
	$aa["fl"] = 1;
	$aa["cb"] = $_POST["cb"];
	foreach ($aa["cb"] as $k => $v) {
		$query = "EXEC [RL_U_CopyToClient] @Rid = '".$_POST["rid"][$k]."', @ClientTo = ".$_POST["copytocl"];
		$dbh->query($query);
	}
	$message .= "Ограничения скопированы(".count($aa["cb"]).")";
}

//	Удаление отмеченных
if ( ($ia_8) && ($_POST["fl"] == "delch")) {
	$aa["fl"] = 1;
	$aa["cb"] = $_POST["cb"];
	foreach ($aa["cb"] as $k => $v) {
		$query = "DELETE FROM [RL_Universal] WHERE id = '".$_POST["rid"][$k]."'";
		$dbh->query($query);
	}
	$message .= "Ограничения удалены (".count($aa["cb"]).")";
}

//	Получаем названия для контрагентов или групп и выпусков
if ( ($ia_8) && ($aa["fl"] == 1)) {
	if ($aa["CORG"] == "G") { 
		$query = "SELECT [Rid] AS [rid], [GroupName] AS [name] FROM [dbo].[CL_Groups] WHERE [Rid] = '".$aa["cgrid"]."'";
	} else {  
		$query = "SELECT [rid], [name] FROM [dbo].[_CL_Contragents] WHERE [rid] = '".$aa["cgrid"]."'";
	}
	foreach($dbh->query($query) as $row) $aa["cgname"] = $row["name"];		
	if ($aa["rtype"] == 'I') {
		$query = "SELECT [rid], [FullName] FROM [dbo].[_CL_URL_issues] WHERE [emitents_id]='".$aa["cgrid"]."' ORDER BY [FullName]";
		foreach($dbh->query($query) as $row) $aa["issues"][$row["rid"]] = $row["FullName"];		
	}
}

//	Получаем спосок текущих ограничений

$query = "SELECT  rl.[id], rl.[ClientId], rl.[CORG], rl.[CORGid], CASE WHEN rl.[CORG] = 'C' THEN c.name ELSE g.GroupName END AS CORGname
			,rl.[RestrictType], rl.[IssueRid], CASE WHEN rl.RestrictType = 'I' THEN i.FullName ELSE NULL END AS Issue
			,rl.[TypesList], rl.[LimitType], rl.[Min], rl.[Max], rl.[NoBuy]
			FROM [RL_Universal] AS rl LEFT JOIN [_CL_Contragents] AS c ON (c.rid = rl.CORGid)
			LEFT JOIN [CL_Groups] AS g ON (g.Rid = rl.CORGid) LEFT JOIN [_CL_URL_issues] AS i ON (i.rid = rl.IssueRid) WHERE rl.[ClientId] = ".$_SESSION["clientid"].
			" ORDER BY rl.[CORG], rl.[RestrictType], CORGname, rl.[TypesList], Issue";
$rlu = array();
foreach($dbh->query($query) as $row) {
	$cb_types = explode(";", $row["TypesList"]);
	$row["TLNames"] = "";
	foreach ($cb_types as $k => $v) if ($v != "") $row["TLNames"] .= $cbtypes[$v]."<br>";
	$rlu[$row["id"]] = $row;	
}


$query = "SELECT [id], [Percent], [MarketValue] FROM [RL_U_CurrPos] WHERE [ClientId] = ".$_SESSION["clientid"];
foreach($dbh->query($query) as $row) {
	$rlu[$row["id"]]["Percent"] = $row["Percent"];
	$rlu[$row["id"]]["MarketValue"] = $row["MarketValue"];
}

$smarty->assign("title", "LC3 Universal Restrict List");
$smarty->assign("message", $message);
$smarty->assign("aa", $aa);
$smarty->assign("rlu", $rlu);
$smarty->assign("ia_8", $ia_8);
$smarty->assign("sdh_c_lnk", "http://sdh/main?sysname=le_contragent_info&rid=");

$smarty->display("templates/rl_universal.tpl");


?>