<?php

include('incl/incl.php');

$res_code = 0;
$query = "";

if (isset($_POST["client"]) && ($_POST["client"] > 0)) {
	
	if ( ($_POST["corgid"] == "") || ($_POST["minval"] == "") || ($_POST["maxval"] == "")
		|| (($_POST["rtype"] != 'I') && ($_POST["cbtypes"] == "")) || (($_POST["rtype"] == 'I') && ($_POST["issueid"] == "")) ) {
		$res_code = 2; //	Не заданы все необходимые параметры
	}
	else {
		$query = "SELECT id, min, max FROM RL_Universal WHERE ClientId = ".$_POST["client"]." AND CORG = '".$_POST["CORG"]."'".
				" AND CORGid = '".$_POST["corgid"]."' AND LimitType = '".$_POST["ltype"]."' AND RestrictType = '".$_POST["rtype"]."' AND ".
				($_POST["rtype"] == 'I' ? "IssueRid = '".$_POST["issueid"]."'" : "TypesList = '".$_POST["cbtypes"]."'");
		foreach ($dbh->query($query) as $row) {
			$res_code = 3; $rl_ex = $row;
		}
	}
}
else
{
	$res_code = 1; //	Не задан клиент
}

print($res_code.";");
switch ($res_code) {
    case 1:
        print("Не задан клиент");
        break;
    case 2:
        print("Не заданы все необходимые параметры - эмитент или группа, выпуск или список типов, величина ограничений");
        break;
    case 3:
        print("Ограничения с заданными параметрами существуют. Минимум ".$rl_ex["min"].", максимум ".$rl_ex["max"]);
        break;
}




?>