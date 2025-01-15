<?php

include('incl/incl.php');

$issues = array();

$query = "SELECT [rid], [emitents_id], [FullName] FROM [dbo].[_CL_URL_issues] WHERE [emitents_id]='".$_REQUEST["contrid"]."' ORDER BY [FullName]";

foreach ($dbh->query($query) as $row) {
	$issues[$row[rid]] = $row;
}

foreach ($issues as $k=>$v) print("<option value='".$k."'>".$v["FullName"]."</option>");


?>