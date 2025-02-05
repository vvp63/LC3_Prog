<?php

include('incl/incl.php');

$instr = array();

$query = "SELECT [rid],[Fullname] FROM [Model_Tools] WHERE [Fullname] LIKE '%".$_POST["search_txt"]."%'";
foreach($dbh->query($query) as $row) { $instr[$row["rid"]] = $row; }

foreach ($instr as $k=>$v) print("<option value='".$k."'>".$v["Fullname"]."</option>");




?>