<?

include("./incl/header.php");

$ia_8 = is_admin(8);

if ($_POST["action"] == "addgrp") {
	$dbh->query("exec CL_AddUpdate_Iss_Group @GroupName = '".$_POST["newgrp"]."'");
	$newid = '';
	foreach ($dbh->query("SELECT MAX([Id]) AS newid FROM [CL_Iss_Groups]") as $row) $newid = $row['newid'];
	header('Location: ./iss_groups.php?grid='.$newid); exit;	
}

if ($_POST["action"] == "delgrp") {
	$dbh->query("exec CL_Delete_Iss_Group @Id = ".$_POST["fgrid"]);
	header('Location: ./iss_groups.php'); exit;	
}


if ($_POST["action"] == "addgrpcont") {
	$dbh->query("exec CL_AddIssGroupContent @GroupId = ".$_REQUEST["grid"].", @issueid = '".$_POST["issues_list"]."'");
}


if ($_POST["action"] == "delgrpcont") {
	$dbh->query("exec CL_DeleteIssGroupContent @GroupId = ".$_POST["fgrid"].", @issueid = '".$_POST["fissueid"]."'");
}

$grid = 0; $grname = "";
if (isset($_REQUEST["grid"])) $grid = $_REQUEST["grid"];

$groups = array(); $i = 0;
foreach ($dbh->query("SELECT [Id],[Rid],[GroupName] FROM [CL_Iss_Groups]") as $row) {
	$groups[$i++] = $row;
	if ($row["Id"] == $grid) $grname = $row["GroupName"];
}

$grpcont = array(); $i = 0;
if ($grid != 0) {
	$query = "SELECT gc.[GroupId], gc.[issueid], c.[name], iss.[emitents_id], iss.[FullName] FROM [CL_Iss_GroupsContent] AS gc
		LEFT JOIN [_CL_URL_issues] AS iss ON (gc.issueid = iss.rid)	LEFT JOIN [_CL_Contragents] AS c ON (iss.emitents_id = c.rid) WHERE gc.GroupId = ".$grid." ORDER BY iss.[FullName]";
	foreach ($dbh->query($query) as $row) $grpcont[$i++] = $row;
}


$smarty->assign("title", "LC3 Issues Groups Manager");
$smarty->assign("ia_8", $ia_8);
$smarty->assign("groups", $groups);
$smarty->assign("grid", $grid);
$smarty->assign("grname", $grname);
$smarty->assign("grpcont", $grpcont);
$smarty->assign("newgrpname", $newgrpname);
$smarty->assign("sdh_c_lnk", "http://sdh/main?sysname=le_contragent_info&rid=");
$smarty->display("templates/iss_groups.tpl");

?>