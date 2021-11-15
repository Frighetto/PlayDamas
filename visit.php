<?php
include 'mysql.php';
echo time();
$username = "#Visitante-" . visitorCounter($mysqli);
saveUser($mysqli, $username, $username, 1);
$id = getUserId($mysqli, $username);
$temp_id = time();
saveOnlineUser($mysqli, $id, null, $temp_id);
$resultQuery = getLobby($mysqli, $id);
for ($row_no = $resultQuery->num_rows - 1; $row_no >= 0; $row_no--) {
    $resultQuery->data_seek($row_no);
    $row = $resultQuery->fetch_assoc();  
    
    echo $row['username'] . ", " . $row['skill'] . ", " . $row['owner_user'] . ', ' . $row['selected_user'] . ', ' . $row['category'] . '<br>';
}
?>