<?php
include 'mysql.php';

$temp_id;
if(isset($_REQUEST['temp_id'])){
    $temp_id = $_REQUEST['temp_id'];
} else {
    session_start();
    $temp_id = $_SESSION['temp_id'];    
}

$id = getUserIdFromTempId($mysqli, $temp_id);
//saveOnlineUser($mysqli, $id, null, $temp_id);
if(onGame($mysqli, $temp_id)){    
    echo "onGame";
} else {
    $resultQuery = getLobby($mysqli, $temp_id);

    $myArray = array();
    while($row = $resultQuery->fetch_array(MYSQLI_ASSOC)) {
        $myArray[] = $row;
    }
    echo json_encode($myArray);
}
?>