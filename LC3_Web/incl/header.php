<?php

include('./incl/incl.php');

include('./smarty/libs/Smarty.class.php');

if (!is_admin(1)) die("Вы, наверное, не являетесь пользователем Контроля Лимитов...");

$smarty = new Smarty;

?>