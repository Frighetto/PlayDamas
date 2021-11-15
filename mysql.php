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

    $mysqli->multi_query("CREATE TABLE skills (id SERIAL, label VARCHAR(255) NOT NULL);
        INSERT INTO skills (label) VALUES ('Beginner');
        INSERT INTO skills (label) VALUES ('Medium');
        INSERT INTO skills (label) VALUES ('Professional');
        CREATE TABLE users (id SERIAL, username VARCHAR(15) UNIQUE NOT NULL, pass VARCHAR(15) NOT NULL, skill BIGINT UNSIGNED);
        ALTER TABLE users ADD FOREIGN KEY (skill) REFERENCES skills(id); 

        CREATE TABLE games (id SERIAL, player1_id BIGINT UNSIGNED NOT NULL, player2_id BIGINT UNSIGNED NOT NULL, player_turn BIGINT UNSIGNED NOT NULL, player_winner BIGINT UNSIGNED, gamestate VARCHAR(255) NOT NULL);
        ALTER TABLE games ADD FOREIGN KEY (player1_id) REFERENCES users(id);
        ALTER TABLE games ADD FOREIGN KEY (player2_id) REFERENCES users(id);
        ALTER TABLE games ADD FOREIGN KEY (player_turn) REFERENCES users(id);
        ALTER TABLE games ADD FOREIGN KEY (player_winner) REFERENCES users(id);

        CREATE TABLE messages_chanels (id SERIAL, label VARCHAR(255) NOT NULL);
        INSERT INTO messages_chanels (label) VALUES ('Private');
        INSERT INTO messages_chanels (label) VALUES ('Lobby');
        INSERT INTO messages_chanels (label) VALUES ('Game');
        CREATE TABLE messages (user BIGINT UNSIGNED PRIMARY KEY, id SERIAL, messagestring VARCHAR(255) NOT NULL, sender BIGINT UNSIGNED NOT NULL, chanel BIGINT UNSIGNED NOT NULL, messagetime TIMESTAMP NOT NULL);
        ALTER TABLE messages ADD FOREIGN KEY (user) REFERENCES users(id);
        ALTER TABLE messages ADD FOREIGN KEY (sender) REFERENCES users(id);
        ALTER TABLE messages ADD FOREIGN KEY (chanel) REFERENCES messages_chanels(id);

        CREATE TABLE categories_of_users_lists (id SERIAL, label VARCHAR(255) NOT NULL);
        INSERT INTO categories_of_users_lists (label) VALUES ('Contact');
        INSERT INTO categories_of_users_lists (label) VALUES ('Block');
        INSERT INTO categories_of_users_lists (label) VALUES ('Challenge');
        CREATE TABLE users_lists (owner_user BIGINT UNSIGNED NOT NULL, selected_user BIGINT UNSIGNED NOT NULL, PRIMARY KEY(owner_user, selected_user), category BIGINT UNSIGNED NOT NULL);
        ALTER TABLE users_lists ADD FOREIGN KEY (owner_user) REFERENCES users(id);
        ALTER TABLE users_lists ADD FOREIGN KEY (selected_user) REFERENCES users(id);
        ALTER TABLE users_lists ADD FOREIGN KEY (category) REFERENCES categories_of_users_lists(id);

        CREATE TABLE online_users (user BIGINT UNSIGNED NOT NULL, game_id BIGINT unsigned, temp_id VARCHAR(255) NOT NULL);
        ALTER TABLE online_users ADD FOREIGN KEY (user) REFERENCES users(id);
        ALTER TABLE online_users ADD FOREIGN KEY (game_id) REFERENCES games(id);");                    
} else {    
    $mysqli = new mysqli($ip, $username, $password, $database, $port);
}

function visitorCounter($mysqli){
    $result = $mysqli->query("SELECT COUNT(*) FROM users WHERE username LIKE '#%'")->fetch_row();
    return $result[0];
}

function saveUser($mysqli, $username, $pass, $skill){
    $mysqli->query("INSERT INTO users (username, pass, skill) VALUES ('$username', '$pass', $skill)");    
}

function getUserId($mysqli, $username){
    $result = $mysqli->query("SELECT id FROM users WHERE username = '$username'")->fetch_row();
    return $result[0];
}

function saveOnlineUser($mysqli, $user, $game_id, $temp_id){
    $mysqli->query("INSERT INTO online_users (user, game_id, temp_id) VALUES ('$user', null, '$temp_id')");
    $mysqli->error;
}
//TODO: check if there is already a category listed to the same users echo "Error:" . $mysqli->error;
function updateUsersLists($mysqli, $owner_user, $selected_user, $category){
    $mysqli->query("INSERT INTO users_list (owner_user, selected_user, category) VALUES ('$owner_user', '$selected_user', '$category')");
}

function getLobby($mysqli, $user){
    return $mysqli->query(" SELECT users.username, 
                            users.skill, 
                            users_lists.owner_user,
                            users_lists.selected_user,
                            users_lists.category 
                            FROM online_users                                 
                            LEFT JOIN users_lists ON online_users.user = $user
                                                        OR (online_users.user = users_lists.owner_user 
                                                        AND users_lists.selected_user = $user
                                                        AND users_lists.category != 1)                                                         
                            LEFT JOIN users ON online_users.user = users.id                                
                            WHERE online_users.game_id IS NULL
                            AND online_users.user != $user");   
}

?>