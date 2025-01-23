<?

include("./incl/header.php");

$ia_check = is_admin(2) || is_admin(16);
if (!$ia_check) die("Недостаточно прав для проверки...");

$limitid = $_REQUEST["limitid"];
$clientid = $_REQUEST["clientid"];

$check_res = array(); $i = 0;
foreach($dbh->query("exec CheckLimit @LimitId =".$limitid.", @ClientCode = ".$clientid) as $row) $check_res[$i++] = $row;


$instr_res = array(); $i = 0;
foreach($dbh->query("exec OpenLimitByInstruments @LimitId =".$limitid.", @ClientCode = ".$clientid) as $row) $instr_res[$i++] = $row;

$fg = array("SummAsset", "Percent", "MarketValue", "SumPercent", "SumMarketValue", "LimitValue", "smarketvalue", "spercent", "Price1", "Price2", "Quantity", "SummREPO", "PercentREPO");
$fh = array("FailLevel", "LimitValue");


$smarty->assign("title", "LC3 Limits Check ".$clientid." ".$limitid);
$smarty->assign("fg", $fg);
$smarty->assign("fh", $fh);
$smarty->assign("limitid", $limitid);
$smarty->assign("clientid", $clientid);
$smarty->assign("check_res", $check_res);
$smarty->assign("check_res_h", arr_head($check_res));
$smarty->assign("instr_res", $instr_res);
$smarty->assign("instr_res_h", arr_head($instr_res));
$smarty->display("templates/check_limit.tpl");

?>