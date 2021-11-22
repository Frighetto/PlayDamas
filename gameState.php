<?php
include 'mysql.php';

$temp_id = $_REQUEST['temp_id'];
$id = getUserIdFromTempId($mysqli, $temp_id);
//saveOnlineUser($mysqli, $id, null, $temp_id);

?>