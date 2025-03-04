<?

include("./incl/header.php");

$clientid = $_REQUEST["clientid"];

if ($clientid > 0) {
	$condition = "WHERE ClientCode = ".$clientid;
} else {
	$condition = "";
}

$query = "SELECT t.* FROM (SELECT InstrumentType, SUM(MarketValue) AS sMarketValue, SUM([Percent]) AS sPercent
				FROM FT_View ".$condition." GROUP BY InstrumentType) AS t ORDER BY t.sPercent DESC";
$stat_t = array(); $i=0;
foreach($dbh->query($query) as $row) {	$stat_t[$i++] = $row;}

$query = "SELECT t.* FROM (SELECT InstrumentType, InstrumentSubtype, SUM(MarketValue) AS sMarketValue, SUM([Percent]) AS sPercent 
				FROM FT_View ".$condition." GROUP BY InstrumentType, InstrumentSubtype) AS t ORDER BY t.sPercent DESC";

$stat_ts = array(); $i=0;
foreach($dbh->query($query) as $row) {	$stat_ts[$i++] = $row;}


$query = "SELECT t.* FROM (SELECT Issuer, contrid, SUM(MarketValue) AS sMarketValue, SUM([Percent]) AS sPercent
				FROM FT_View ".$condition." GROUP BY Issuer, contrid) AS t ORDER BY t.sPercent DESC";

$stat_iss = array(); $i=0;
foreach($dbh->query($query) as $row) {	$stat_iss[$i++] = $row;}

	
$smarty->assign("title", "LC3 Portfolio statistic. Client ".$clients[$clientid]["fullname"]);
$smarty->assign("stat_t", $stat_t);
$smarty->assign("stat_ts", $stat_ts);
$smarty->assign("stat_iss", $stat_iss);

$smarty->display("templates/portf_stat.tpl");

?>