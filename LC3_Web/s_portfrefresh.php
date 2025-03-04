<?

include("./incl/header.php");

$ia_refr = is_admin(4);
if (!$ia_refr) die("Недостаточно прав для обновления...");

$dbh->query("exec Caching_ALL");

print("Портфель обновлен");

?>