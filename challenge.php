<?php
include 'mysql.php';

$temp_id = $_REQUEST['temp_id'];
$player = $_REQUEST['player'];
$option = $_REQUEST['option'];
$user = getUserIdFromTempId($mysqli, $temp_id);
checkChallenge($mysqli, $user, $player, $option);
session_start();
$_SESSION['temp_id'] = $temp_id;
header("Location: lobbyPlayers.php");
die();
?>