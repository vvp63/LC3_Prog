<?

include("./incl/header.php");

$ia_check = is_admin(2) || is_admin(16);
if (!$ia_check) die("Недостаточно прав для проверки...");

$chmodel = ($_REQUEST["chmodel"]) && is_admin(4);
$modelft = '##ModelFt_'.$_SESSION["admin"]["id"];

$limitid = $_REQUEST["limitid"];
$clientid = $_REQUEST["clientid"];

if ($chmodel) $dbh->query("exec [WebModel_PrepareFT] @uid = ".$_SESSION["admin"]["id"]);

$check_res = array(); $i = 0;
$query = ($chmodel ? "exec CheckLimitOnTable @TableName = '".$modelft."', @LimitId =".$limitid.", @ClientCode = ".$clientid : "exec CheckLimit @LimitId =".$limitid.", @ClientCode = ".$clientid);
foreach($dbh->query($query) as $row) $check_res[$i++] = $row;

$instr_res = array(); $i = 0;
$query = "exec OpenLimitByInstruments @LimitId =".$limitid.", @ClientCode = ".$clientid.($chmodel ? ", @TableName = '".$modelft."'" : "");
foreach($dbh->query($query) as $row) $instr_res[$i++] = $row;

$fg = array("Percent", "SumPercent", "LimitValue", "spercent", "Price1", "Price2", "PercentREPO");
$fu = array("SummAsset", "MarketValue", "SumMarketValue", "smarketvalue", "Quantity", "SummREPO");
$fh = array("FailLevel", "LimitValue");


$smarty->assign("title", "LC3 Limits Check ".$clientid." ".$limitid.($chmodel ? ". Model portfolio" : ""));
$smarty->assign("fg", $fg);
$smarty->assign("fu", $fu);
$smarty->assign("fh", $fh);
$smarty->assign("limitid", $limitid);
$smarty->assign("clientid", $clientid);
$smarty->assign("check_res", $check_res);
$smarty->assign("check_res_h", arr_head($check_res));
$smarty->assign("instr_res", $instr_res);
$smarty->assign("instr_res_h", arr_head($instr_res));
$smarty->display("templates/check_limit.tpl");

?>