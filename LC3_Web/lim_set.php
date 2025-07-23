<?

include("./incl/header.php");

$ia_32 = is_admin(32);

$limid = (isset($_REQUEST["limid"]) ? $_REQUEST["limid"] : 0);

$limits = array();
foreach ($dbh->query("SELECT [Id], [Name], [GroupByEmit], [GroupByInstr], [IsComplex], [LimitQuery], [FTId] FROM [CL]") as $row) {
	$limits[$row["Id"]] = $row;
}

$ftlst = array();
foreach ($dbh->query("SELECT [Id], [TableName], [Comment] FROM [FactTablesList]") as $row) {
	$ftlst[$row["Id"]] = $row;
}

$qlst = array(); $i = 0;
foreach ($dbh->query("SELECT [name] FROM [CL_queries_list] ORDER BY [name]") as $row) {
	$qlst[$i++] = $row["name"];
}



$smarty->assign("title", "LC3 Limits settings");
$smarty->assign("ia_32", $ia_32);
$smarty->assign("limits", $limits);
$smarty->assign("limid", $limid);
$smarty->assign("ftlst", $ftlst);
$smarty->assign("qlst", $qlst);
$smarty->display("templates/lim_set.tpl");


?>