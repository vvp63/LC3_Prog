<?

include("./incl/header.php");

$ia_4 = is_admin(4);
if (!$ia_4) die("У вас нет прав управлять модельным портфелем.");

$clientid = $_SESSION["clientid"];

$res = 0;

if ($_POST["add"] == "ok") {
	if ( ($_POST["instr_list"]) && ($_POST["quantity"]) && ($_POST["value"]) ) {
		$query = "exec [WebModel_AddDeal] @uid = ".$_SESSION["admin"]["id"].", @DClientCode = ".$clientid;
		$query .= ", @DSecurityId = '".$_POST["instr_list"]."', @DQuantity = ".$_POST["quantity"].", @DMarketValue = ".$_POST["value"];
		$dbh->query($query);
		$res = 1;
	} else {
		$res = 2;
	}
}

$smarty->assign("title", "LC3 Add model deal");
$smarty->assign("ia_4", $ia_4);
$smarty->assign("res", $res);
$smarty->assign("clientid", $clientid);
$smarty->display("templates/modeldeal.tpl");


?>