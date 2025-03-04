<?

include("./incl/header.php");

$ia_2 = is_admin(2); 
$ia_4 = is_admin(4); 
$ia_16 = is_admin(16);

$_SESSION["limitid"] = (isset($_POST["limitid"]) ? $_POST["limitid"] : ($_SESSION["limitid"] ? $_SESSION["limitid"] : 0));
if ($_POST["cl_lst"]) {
	$_SESSION["cl_lst"] = $_POST["cl_lst"];
	$dbh->query("exec WebParam_AddUpdate @user = '".$_SERVER['LOGON_USER']."', @param = 'clntlst', @value = '".serialize($_SESSION["cl_lst"])."'");
} else {
	if (!$_SESSION["cl_lst"]) {
		$clntlst = "";
		foreach ($dbh->query("exec WebParam_Get @user = '".$_SERVER['LOGON_USER']."', @param = 'clntlst'") as $row) $clntlst = $row["value"];
		if ($clntlst != "") {
			$_SESSION["cl_lst"] = unserialize($clntlst);
		} else {
			$clarr = array(); $i = 0;
			foreach ($clients as $k=>$v) $clarr[$i++] = $k;
			$_SESSION["cl_lst"] = $clarr;
		}
	}
}

$cl_str = "";
foreach ($_SESSION["cl_lst"] as $k => $v) $cl_str .= ($k == 0 ? "" : ", ").$v;

$cl_limits = array();
$cl_count = count($_SESSION["cl_lst"]);
$query = "SELECT [Id], [LimitId], [Name], [ClientCode], [ClientName], [IsActive], [MinValue], [MaxValue], [LowerWarning], [UpperWarning] FROM [_CL_ClientLimits] WHERE ";
if ( ($cl_count > 1) && ($_SESSION["limitid"] == 0) ) {
	$query .= "[IsActive] <> 0 AND [ClientCode] IN (".$cl_str.") ORDER BY [ClientCode], [Name]";
} else {
	if ( ($cl_count == 1) && ($_SESSION["limitid"] != 0) ) {
		$query .= "[ClientCode] IN (".$cl_str.") AND [LimitId] = ".$_SESSION["limitid"];
	} else {
		if ($cl_count == 1) {
			$query .= "[ClientCode] IN (".$cl_str.") ORDER BY [IsActive] desc, [Name]";
		} else {
			$query .= "[LimitId] = ".$_SESSION["limitid"]." AND [ClientCode] IN (".$cl_str.") ORDER BY [IsActive] desc, [ClientCode]";
		}
	}
}

$i = 0;
foreach ($dbh->query($query) as $row) $cl_limits[$i++] = $row;

$slunread = 0;
foreach ($dbh->query("exec SL_GetUnreaded") as $row) $slunread = 1;

$smarty->assign("title", "LC3 Checking Limits");
$smarty->assign("ia_2", $ia_2);
$smarty->assign("ia_4", $ia_4);
$smarty->assign("ia_16", $ia_16);
$smarty->assign("cl_limits", $cl_limits);
$smarty->assign("limits", $limits);
$smarty->assign("slunread", $slunread);
$smarty->display("templates/limits.tpl");

?>