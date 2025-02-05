<?php

include('incl/incl.php');

if (is_admin(4)) {
	if ($dbh->query("EXEC [WebModel_CopyFT] @uid = ".$_SESSION["admin"]["id"])) {
		print("Модельный портфель скопирован для ".$_SESSION["admin"]["UserName"]." (".$_SESSION["admin"]["id"].")");
	} else {
		print("Ошибка копирования модельного портфеля");
	}
} else {
	print("Недостаточно прав для создания модельного портфеля");
}





?>