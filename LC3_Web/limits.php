<?

include("./incl/header.php");

$_SESSION["clientid"] = (isset($_SESSION["clientid"]) ? (isset($_POST["clientid"]) ? $_POST["clientid"] : $_SESSION["clientid"]) : 0);
$_SESSION["limitid"] = (isset($_SESSION["limitid"]) ? (isset($_POST["limitid"]) ? $_POST["limitid"] : $_SESSION["limitid"]) : 0);

$limits = array();
foreach($dbh->query("SELECT [Id], [Name] FROM [_CL_CL] ORDER BY [Name]") as $row) {
	$limits[$row["Id"]] = $row;
}

$cl_limits = array();

$query = "SELECT [Id], [LimitId], [Name], [ClientCode], [ClientName], [IsActive], [MinValue], [MaxValue], [LowerWarning], [UpperWarning] FROM [_CL_ClientLimits] WHERE ";
if ( ($_SESSION["clientid"] == 0) && ($_SESSION["limitid"] == 0) ) {
	$query .= "[IsActive] <> 0 ORDER BY [ClientCode], [Name]";
} else {
	if ( ($_SESSION["clientid"] != 0) && ($_SESSION["limitid"] != 0) ) {
		$query .= "[ClientCode] = ".$_SESSION["clientid"]." AND [LimitId] = ".$_SESSION["limitid"];
	} else {
		if ($_SESSION["clientid"] != 0) {
			$query .= "[ClientCode] = ".$_SESSION["clientid"]." ORDER BY [IsActive] desc, [Name]";
		} else {
			$query .= "[LimitId] = ".$_SESSION["limitid"]." ORDER BY [IsActive] desc, [ClientCode]";
		}
	}
}

$i = 0;
foreach ($dbh->query($query) as $row) {	$cl_limits[$i++] = $row; }


$smarty->assign("cl_limits", $cl_limits);
$smarty->assign("limits", $limits);
$smarty->display("templates/limits.tpl");

?>