<?

include("./incl/header.php");

$sldate = $_REQUEST["sldate"];

$sldata = array(); $i = 0;
$query = "SELECT [CB_Name] + ' (' + [CB] + ')' AS [CB], [SummQty], [announced_volume], [Percent] FROM [SL_Data]
			WHERE [SLDate] >= '".$sldate."' AND [SLDate] <= DATEADD(day, 1, '".$sldate."') ORDER BY [CB_Name]";
foreach($dbh->query($query) as $row) $sldata[$i++] = $row;

$smarty->assign("sldata", $sldata);
$smarty->display("templates/s_sldata.tpl");


?>