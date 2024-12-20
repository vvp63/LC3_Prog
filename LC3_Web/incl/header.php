<?php

include('./incl/incl.php');

$clients = array();
foreach($dbh->query("SELECT [КодКлиента] AS clientid, [НаименованиеКлиента] AS name, [ПолноеНаименование] AS fullname FROM [dbo].[_CL_Clients]") as $row) {
	$clients[$row["clientid"]] = $row;
}

$cbtypes = array();
foreach($dbh->query("SELECT [Id], [Value], [Name] FROM [dbo].[CLlst_Types] ORDER BY [Id]") as $row) {
	$cbtypes[$row["Value"]] = $row["Name"];
}

include('./smarty/libs/Smarty.class.php');
$smarty = new Smarty;

$menu = array(  "/rl_universal.php" => "Лимитная ведомость", 
				"/portfolio.php" => "Портфели клиентов"
            );
	
$smarty->assign("menu", $menu);
$smarty->assign("script_name", $_SERVER['SCRIPT_NAME']);
$smarty->assign("clients", $clients);
$smarty->assign("cbtypes", $cbtypes);

?>