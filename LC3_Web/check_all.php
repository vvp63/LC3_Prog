<?

include("./incl/header.php");

$ia_check = is_admin(2) || is_admin(16);
if (!$ia_check) die("Недостаточно прав для проверки...");

$cl_str = "";
foreach ($_SESSION["cl_lst"] as $k => $v) $cl_str .= ($k == 0 ? "" : ", ").$v;

$chall = array(); 
$j = 0;

$cl_count = count($_SESSION["cl_lst"]);
$query = "SELECT [ClientCode], [LimitId] FROM [_CL_ClientLimits] WHERE [IsActive] <> 0 ";
if ( ($cl_count > 1) && ($_SESSION["limitid"] == 0) ) {
	$query .= "AND [ClientCode] IN (".$cl_str.") ORDER BY [ClientCode], [Name]";
} else {
	if ( ($cl_count == 1) && ($_SESSION["limitid"] != 0) ) {
		$query .= "AND [ClientCode] IN (".$cl_str.") AND [LimitId] = ".$_SESSION["limitid"];
	} else {
		if ($cl_count == 1) {
			$query .= "AND [ClientCode] IN (".$cl_str.") ORDER BY [Name]";
		} else {
			$query .= "AND [ClientCode] IN (".$cl_str.") AND [LimitId] = ".$_SESSION["limitid"]." ORDER BY [ClientCode]";
		}
	}
}

foreach ($dbh->query($query) as $row) {
	$chall[$j]["clientid"] = $row["ClientCode"];
	$chall[$j++]["limitid"] = $row["LimitId"];
}

foreach ($chall as $k=>$v) {
	$check_res = array(); $i = 0;
	foreach($dbh->query("exec CheckLimit @LimitId =".$v["limitid"].", @ClientCode = ".$v["clientid"]) as $row) $check_res[$i++] = $row;
	$chall[$k]["res"] = $check_res;
	$chall[$k]["reshead"] = arr_head($check_res);
}

$fg = array("SummAsset", "Percent", "MarketValue", "SumPercent", "SumMarketValue", "LimitValue", "smarketvalue", "spercent", "Price1", "Price2", "Quantity", "SummREPO", "PercentREPO");
$fh = array("FailLevel", "LimitValue");

$smarty->assign("title", "LC3 All Limits Check");
$smarty->assign("fg", $fg);
$smarty->assign("fh", $fh);
$smarty->assign("chall", $chall);
$smarty->display("templates/check_all.tpl");

?>