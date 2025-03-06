<?

include("./incl/header.php");

$ia_refr = is_admin(4) || is_admin(2) ;
if (!$ia_refr) die("Недостаточно прав для отображения...");

$events = array(); $i = 0;
$query = "SELECT [Date], [CB], [CB_Name] + ' (' + [CB] + ')' AS [CBFull], [ID_CB_SDH], [PCurr], [PPrev], [Readed] FROM SL_Events ORDER BY [Date] DESC";
foreach($dbh->query($query) as $row) $events[$i++] = $row;

$evdates = array();
$query = "SELECT [SLDate],[DateNum] FROM [SL_Dates] ORDER BY [DateNum]";
foreach($dbh->query($query) as $row) $evdates[$row["DateNum"]] = $row["SLDate"];

$smarty->assign("title", "LC3 5% Check");
$smarty->assign("events", $events);
$smarty->assign("evdates", $evdates);
$smarty->display("templates/w_slcheck.tpl");

?>