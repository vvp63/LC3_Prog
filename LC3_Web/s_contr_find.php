<?php

include('incl/incl.php');

$contr = array();

if ($_POST["CORG"] == "G") {
	$query = "SELECT [Rid] AS [rid], [GroupName] AS [name] FROM [dbo].[CL_Groups] WHERE [GroupName] LIKE '%".$_POST["search_txt"]."%'";
}
else {
	$query = "SELECT [rid], [name] FROM [dbo].[_CL_Contragents] WHERE [name] LIKE '%".$_POST["search_txt"]."%'";
}

foreach($dbh->query($query) as $row) {
	$contr[$row["rid"]] = $row;
}

foreach ($contr as $k=>$v) print("<option value='".$k."'>".$v["name"]."</option>");




?>