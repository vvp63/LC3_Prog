<?

include("./incl/header.php");

$rlrid = $_REQUEST["rlrid"];
$clientid = $_REQUEST["clientid"];
	
$restr = array(); $i = 0;
$query = "SELECT * FROM [RL_U_Restrictions] WHERE [ClientCode] = ".$clientid." AND rlid = '".$rlrid."'";
foreach($dbh->query($query) as $row) {
	$restr[$i++] = $row;
}

$portf = array(); $i = 0;
$query = "SELECT * FROM [RL_U_PortfWithRL] WHERE [ClientCode] = ".$clientid." ORDER BY [Issuer]";
foreach($dbh->query($query) as $row) {
	$isrestr = 0;
	foreach ($restr as $k=>$v) {
		if ( ($v["contrid"] == $row["contrid"]) && ($v["SecurityId"] == $row["SecurityId"]) ) $isrestr = 1;
	}
	$row["isrestr"] = $isrestr;
	$portf[$i++] = $row;
}

$smarty->assign("title", "LC3 Portfolio with restrictions. Client ".$clients[$clientid]["fullname"]);
$smarty->assign("portf", $portf);

$smarty->display("templates/w_portfolio_rl.tpl");

?>