<?php
include 'mysql.php';

$temp_id = $_REQUEST['temp_id'];
leaveGame($mysqli, $temp_id);
session_start();
$_SESSION['temp_id'] = $temp_id;
header("Location: lobby.php");
die();
?>