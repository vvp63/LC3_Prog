<?

include("./incl/header.php");

$clientid = $_REQUEST["clientid"];
	
$query = "SELECT [КодКлиента] AS [ClientCode]
      ,[Инструмент] AS [Instrument]
      ,[НаименованиеИнструмента] AS [InstrumentName]
      ,[Дата первой части сделки] AS [Date1]
      ,[СрокРепо] AS [Days]
      ,[Направление первой части] AS [Direction]
      ,[Количество] AS [Quantity]
      ,[Цена первой части] AS [Price1]
	  ,[Цена первой части] * [Количество] * [nominal] / 100 AS [Value1]
      ,[Цена второй части] AS [Price2]
	  ,[Цена второй части] * [Количество] * [nominal] / 100 AS [Value2]
      ,[nominal]
  FROM [REPODeals] ORDER BY [КодКлиента]";
  
$repodeals = array(); $i=0;
foreach ($dbh->query($query) as $row) {	$repodeals[$i++] = $row;}

$fg = array("Price1", "Price2", "nominal");
$fu = array("Quantity", "Value1", "Value2");

$smarty->assign("title", "LC3 REPO deals. Client ".$clients[$clientid]["fullname"]);
$smarty->assign("repodeals", $repodeals);
$smarty->assign("repodeals_h", arr_head($repodeals));
$smarty->assign("clientid", $clientid);
$smarty->assign("fg", $fg);
$smarty->assign("fu", $fu);

$smarty->display("templates/w_repodeals.tpl");


?>