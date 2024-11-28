<?php

session_start();

$dbh = null;

try {
    $dbh = new PDO('sqlsrv:server=co1-vp-lc1 ; Database=LC3_dev', 'lc_web', 'lc_web_123');     
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

unset($_SESSION["admin"]);
foreach ($dbh->query("select * from UserAccess_Web where AccessMode > 0 and LOWER(UserName) = LOWER('".$_SERVER['LOGON_USER']."')") as $row) $_SESSION["admin"] = $row;

function is_admin($level) {
    return (($level & $_SESSION["admin"]["AccessMode"]) > 0);
}


?>