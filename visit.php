<?php
include 'mysql.php';
echo time();
$username = "#Visitante-" . visitorCounter($mysqli);
saveUser($mysqli, $username, $username, 1);
$id = getUserId($mysqli, $username);
$temp_id = time();
saveOnlineUser($mysqli, $id, null, $temp_id);
session_start();
$_SESSION['temp_id'] = $temp_id;
header("Location: lobby.php");
die();
?>