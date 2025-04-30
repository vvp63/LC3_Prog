<?php

include('./incl/incl.php');

$clients = array();
foreach($dbh->query("SELECT [КодКлиента] AS clientid, [НаименованиеКлиента] AS name, [ПолноеНаименование] AS fullname FROM [dbo].[_CL_Clients] WHERE [КодКлиента] > 0") as $row) {
	$clients[$row["clientid"]] = $row;
}

$limits = array();
foreach($dbh->query("SELECT [Id], [Name] FROM [_CL_CL] ORDER BY [Name]") as $row) $limits[$row["Id"]] = $row;

$cbtypes = array();
foreach($dbh->query("SELECT [Id], [Value], [Name] FROM [dbo].[CLlst_Types] ORDER BY [Id]") as $row) {
	$cbtypes[$row["Value"]] = $row["Name"];
}

$menu = array(  "/limits.php" => "Ограничения", 
				"/portfolio.php" => "Портфели клиентов",
				"/rl_universal.php" => "Лимитная ведомость",
				"/groups.php" => "Группы"
            );
	
$smarty->assign("menu", $menu);
$smarty->assign("script_name", $_SERVER['SCRIPT_NAME']);
$smarty->assign("clients", $clients);
$smarty->assign("limits", $limits);
$smarty->assign("cbtypes", $cbtypes);

?>