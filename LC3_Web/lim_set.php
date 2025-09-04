<?

include("./incl/header.php");

$ia_32 = is_admin(32);

$limid = (isset($_REQUEST["limid"]) ? $_REQUEST["limid"] : 0);
$objid = (isset($_REQUEST["objid"]) ? $_REQUEST["objid"] : 0);

if ( ($objid <> 0) && ($limid == 0)) {
	foreach ($dbh->query("SELECT [CLId] FROM [CL_Objects] WHERE [Id] = ".$objid) as $row) $limid = $row["CLId"];	
}

if (($_POST["action"] == "addupd_cl") && ($ia_32)) {
	$query = "exec CL_UpdateLimit @LimitId = ".$_POST["limid"].", @Name = '".$_POST["lim_name"]."',
					@GroupByEmit = ".($_POST["lim_emit"] == "on" ? 1 : 0).", @GroupByInstr = ".($_POST["lim_instr"] == "on" ? 1 : 0).",
					@IsComplex = ".($_POST["lim_complex"] == "on" ? 1 : 0).", @LimitQuery = '".$_POST["lim_query"]."', @FtId = ".$_POST["lim_portf"];
	$dbh->query($query);
}

if (($_POST["action_obj"] == "addupd_obj") && ($ia_32)) {
	$query = "exec CL_UpdateObject @ObjectId = ".$_POST["objid"]." , @Name = '".$_POST["lim_name"]."', @LimitId = ".$_POST["limid"];
	$dbh->query($query);
}

if (($_POST["action"] == "del_cl") && ($ia_32)) {
	$query = "exec CL_DeleteLimit @LimitId = ".$_POST["limid"];
	$dbh->query($query);
	$limid = 0;
}

if (($_POST["action_obj"] == "del_obj") && ($ia_32)) {
	$query = "exec CL_DeleteObject @ObjectId = ".$_POST["objid"];
	$dbh->query($query);
	$objid = 0;
}

if (($_POST["action_set"] == "addupd_set") && ($ia_32)) {
	$dbh->query("DELETE FROM [CL_Conditions] WHERE [ObjectId] = ".$objid);
	foreach ($_POST["relation"] as $k=>$v) {
		if ($v <> "") {
			$vallist = "";
			if (isset($_POST["valarr"][$k])) {
				foreach ($_POST["valarr"][$k] as $j=>$s) $vallist .= "''".$s."'' ,";
				$vallist = mb_substr($vallist, 0, -2);
			} else {
				$vallist = $_POST["valueslist"][$k];
			}
			$inclnull = ($_POST["includenull"][$k] == 1 ? 1 : 0);
			$query = "INSERT INTO [CL_Conditions] ([ObjectId], [ParamId], [Relation], [ValuesList], [IncludeNull]) VALUES (".$objid.", ".$k.", '".$v."', '".$vallist."', ".$inclnull.")";
			$dbh->query($query);
		}
	}
	$dbh->query("EXEC [CL_FormCondition] @LimitId = ".$limid);
}


$limits = array();
foreach ($dbh->query("SELECT [Id], [Name], [GroupByEmit], [GroupByInstr], [IsComplex], [LimitQuery], [FTId] FROM [CL]") as $row) {
	$limits[$row["Id"]] = $row;
}

$objects = array();
if ($limid > 0) {
	foreach ($dbh->query("SELECT [Id], [CLId], [Name] FROM [CL_Objects] WHERE [CLId] = ".$limid) as $row) {
		$objects[$row["Id"]] = $row;
	}
}

$ftlst = array();
foreach ($dbh->query("SELECT [Id], [TableName], [Comment] FROM [FactTablesList]") as $row) {
	$ftlst[$row["Id"]] = $row;
}

$qlst = array(); $i = 0;
foreach ($dbh->query("SELECT [name] FROM [CL_queries_list] ORDER BY [name]") as $row) {
	$qlst[$i++] = $row["name"];
}

$params = array();
foreach ($dbh->query("SELECT [Id], [ColumnName], [Name], [ListTable] FROM [CL_Params] ORDER BY [Id]") as $row) {
	$pid = $row["Id"];
	$params[$pid] = $row;
	foreach ($dbh->query("SELECT [Id], [Value], [Name] FROM ".$params[$pid]["ListTable"]) as $prow) {
		$params[$pid]["plst"][$prow["Id"]] = $prow;
	}
}

$conditions = array();
if ($objid > 0) {
	foreach ($dbh->query("SELECT [Id], [ObjectId], [ParamId], [Relation], [ValuesList], [IncludeNull] FROM [CL_Conditions] WHERE [ObjectId] = ".$objid) as $row) {
		$conditions[$row["ParamId"]] = $row;
	}
	foreach ($conditions as $i=>$v) {
		$arr=explode(' ,', $v["ValuesList"]);
		foreach ($arr as $j=>$va) $arr[$j] = mb_substr($va, 1, -1);
		$conditions[$i]["ValArr"] = $arr;
	}
}


$smarty->assign("title", "LC3 Limits settings");
$smarty->assign("ia_32", $ia_32);
$smarty->assign("limits", $limits);
$smarty->assign("objects", $objects);
$smarty->assign("params", $params);
$smarty->assign("conditions", $conditions);
$smarty->assign("limid", $limid);
$smarty->assign("objid", $objid);
$smarty->assign("ftlst", $ftlst);
$smarty->assign("qlst", $qlst);
$smarty->display("templates/lim_set.tpl");


?>