<?

include("./incl/header.php");

if (!is_admin(16)) die("Недостаточно прав");

$evdate = $_POST["sldate"];
$cb = $_POST["cb"];
$username = $_SESSION["admin"]["UserName"];

$query = "exec SL_ReadEventWeb @CB = '".$cb."', @EvDate = '".$evdate."', @Username = '".$username."'";
$dbh->query($query);

print($query);

?>