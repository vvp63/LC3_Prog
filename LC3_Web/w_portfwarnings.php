<?

include("./incl/header.php");

$ia_refr = is_admin(4) || is_admin(2) ;
if (!$ia_refr) die("Недостаточно прав для отображения...");


$check_res = array(); $i = 0;
$query = "exec CheckWarning";
foreach($dbh->query($query) as $row) $check_res[$i++] = $row;

$fd = array("SummAsset", "MarketValue", "SumMarketValue", "smarketvalue", "Quantity", "SummREPO");

$smarty->assign("title", "LC3 Portfolio Warnings");
$smarty->assign("fd", $fd);
$smarty->assign("check_res", $check_res);
$smarty->assign("check_res_h", arr_head($check_res));
$smarty->display("templates/w_portfwarnings.tpl");

?>