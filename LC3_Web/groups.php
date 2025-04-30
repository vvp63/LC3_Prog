<?

include("./incl/header.php");

$ia_8 = is_admin(8);


if ($_POST["action"] == "addgrp") {
	$dbh->query("exec CL_AddUpdate_Group @GroupName = '".$_POST["newgrp"]."'");
	$newid = '';
	foreach ($dbh->query("SELECT MAX([Id]) AS newid FROM [CL_Groups]") as $row) $newid = $row['newid'];
	header('Location: ./groups.php?grid='.$newid); exit;	
}

if ($_POST["action"] == "delgrp") {
	$dbh->query("exec CL_Delete_Group @Id = ".$_POST["fgrid"]);
	header('Location: ./groups.php'); exit;	
}

if ($_POST["action"] == "addgrpcont") {
	$dbh->query("exec CL_AddGroupContent @GroupId = ".$_REQUEST["grid"].", @contrid = '".$_POST["contr"]."'");
}

if ($_POST["action"] == "delgrpcont") {
	$dbh->query("exec CL_DeleteGroupContent @GroupId = ".$_POST["fgrid"].", @contrid = '".$_POST["fcontrid"]."'");
}

$grid = 0; $grname = "";
if (isset($_REQUEST["grid"])) $grid = $_REQUEST["grid"];

$groups = array(); $i = 0;
foreach ($dbh->query("SELECT [Id],[Rid],[GroupName] FROM [CL_Groups]") as $row) {
	$groups[$i++] = $row;
	if ($row["Id"] == $grid) $grname = $row["GroupName"];
}

$grpcont = array(); $i = 0;
if ($grid != 0) {
	$query = "SELECT gc.[GroupId], gc.[contrid], ISNULL(c.[name], '&nbsp;') AS cname FROM [CL_GroupsContent] AS gc LEFT JOIN [Cache_Contragents] AS c ON (gc.contrid = c.rid) WHERE gc.GroupId = ".$grid;
	foreach ($dbh->query($query) as $row) $grpcont[$i++] = $row;
}

$smarty->assign("title", "LC3 Groups Manager");
$smarty->assign("ia_8", $ia_8);
$smarty->assign("groups", $groups);
$smarty->assign("grid", $grid);
$smarty->assign("grname", $grname);
$smarty->assign("grpcont", $grpcont);
$smarty->assign("newgrpname", $newgrpname);
$smarty->assign("sdh_c_lnk", "http://sdh/main?sysname=le_contragent_info&rid=");
$smarty->display("templates/groups.tpl");

?>