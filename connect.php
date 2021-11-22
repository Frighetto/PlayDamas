<?php
$ip = "127.0.0.1";
$username = "root";
$password = "";
$database = "checkers";
$port = 3306;

$mysqli = new mysqli($ip, $username, $password, null, $port);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

if ($mysqli->query("CREATE DATABASE " . $database) === TRUE) {   
    $mysqli->close();
    $mysqli = new mysqli($ip, $username, $password, $database, $port);    

    $mysqli->multi_query(fread(fopen("create.sql", "r"), filesize("create.sql")));                    
} else {    
    $mysqli = new mysqli($ip, $username, $password, $database, $port);
}

?>