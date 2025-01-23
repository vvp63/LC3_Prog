<?php

include('incl/incl.php');

$answ = "";

if ( (is_admin(8)) && (isset($_POST["clientid"])) && (isset($_POST["limitid"])) ) {
	$query = "exec [CL_AddUpdateCL] @LimitId = ".$_POST["limitid"].", @ClientCode = ".$_POST["clientid"].", @IsActive = ".$_POST["isactive"];
	$query .= ", @MinValue = ".$_POST["min"].", @MaxValue = ".$_POST["max"].", @LowerWarning = ".$_POST["lw"].", @UpperWarning = ".$_POST["uw"];
	$dbh->query($query);
	$query = "SELECT [IsActive], [MinValue], [MaxValue], [LowerWarning], [UpperWarning] FROM [ClientsLimits] WHERE [LimitId] = ".$_POST["limitid"]." AND [ClientCode] = ".$_POST["clientid"];
	foreach($dbh->query($query) as $row) $answ = $row["IsActive"].";".sprintf("%g", $row["MinValue"]).";".sprintf("%g", $row["MaxValue"]).";".sprintf("%g", $row["LowerWarning"]).";".sprintf("%g", $row["UpperWarning"]).";";
}

print($answ."<br>");

?>