<?php
require 'connect.php';

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

function getUserIdFromTempId($mysqli, $temp_id){
    $result = $mysqli->query("SELECT user FROM online_users WHERE temp_id = '$temp_id'")->fetch_row();
    return $result[0] == NULL ? NULL : $result[0];
}

function saveOnlineUser($mysqli, $user, $game_id, $temp_id){
    $game_id = $game_id == null ? "null" : "'" + $game_id + "'";    
    $result = $mysqli->query("SELECT COUNT(*) > 0 FROM online_users WHERE temp_id = '$temp_id'")->fetch_row();     
    if($result[0]){
        $mysqli->query("UPDATE online_users SET game_id = $game_id, time = CURRENT_TIMESTAMP WHERE temp_id = '$temp_id'");       
    } else {
        $mysqli->query("INSERT INTO online_users (user, game_id, temp_id, time) VALUES ('$user', $game_id, '$temp_id', CURRENT_TIMESTAMP)");
    }
}

function onGame($mysqli, $temp_id){
    $result = $mysqli->query("SELECT COUNT(*) > 0 FROM online_users WHERE temp_id = '$temp_id' AND game_id IS NOT NULL")->fetch_row();   
    return $result[0];
}

function leaveGame($mysqli, $temp_id){
    $user = getUserIdFromTempId($mysqli, $temp_id);
    $mysqli->query("DELETE FROM games_watchers WHERE user = $user");
    $mysqli->query("UPDATE online_users SET game_id = NULL WHERE user = $user");
}

function checkChallenge($mysqli, $user, $player, $option){
    if($option == "Assistir"){
        $result = $mysqli->query("SELECT game_id FROM online_users WHERE user = $player")->fetch_row();
        $game_id = $result[0];
        $mysqli->query("INSERT INTO games_watchers (game_id, user) VALUES ($game_id, $user)");
        $mysqli->query("UPDATE online_users SET game_id = $game_id WHERE user = $user"); 
    } else if($option == "Desafiar"){
        $mysqli->query("INSERT INTO users_lists (owner_user, selected_user, category) VALUES ($user, $player, 1)");
    } else if($option == "Aceitar"){
        $mysqli->query("DELETE FROM users_lists WHERE (owner_user = $user OR owner_user = $player OR selected_user = $user OR selected_user = $player) AND category = 1");
        $random_boolen = time() % 2;
        $player1 = $random_boolen ? $user : $player;
        $player2 = $random_boolen ? $player : $user;        
        $mysqli->query("INSERT INTO games (player1_id, player2_id, player_turn, game_state) VALUES ($player1, $player2, $player1, 'new')");
        $result = $mysqli->query("SELECT id FROM games WHERE player1_id = $player1 AND player2_id = $player2 ORDER BY id DESC LIMIT 1")->fetch_row();
        $game_id = $result[0];
        $mysqli->query("UPDATE online_users SET game_id = $game_id WHERE user = $player1 OR user = $player2");        
    } else if($option == "Cancelar"){       
        $mysqli->query("DELETE FROM users_lists WHERE owner_user = $user AND selected_user = $player AND category = 1");
    }    
}

//TODO: check if there is already a category listed to the same users echo "Error:" . $mysqli->error;
function updateUsersLists($mysqli, $owner_user, $selected_user, $category){
    $mysqli->query("INSERT INTO users_list (owner_user, selected_user, category) VALUES ('$owner_user', '$selected_user', '$category')");
}

function getLobby($mysqli, $temp_id){
    $user = getUserIdFromTempId($mysqli, $temp_id);
    return $mysqli->query(" SELECT 
            users.id,
            users.username,     
            users.skill,
            CASE WHEN online_users.game_id IS NOT NULL THEN 'Assistir'
                 WHEN users_lists.owner_user = $user THEN 'Cancelar'
                 WHEN users_lists.selected_user = $user THEN 'Aceitar' 
                 ELSE 'Desafiar'    
            END AS challenge_option          
            FROM online_users
            LEFT JOIN users_lists 
                ON (users_lists.owner_user = $user
                    AND online_users.user = users_lists.selected_user
                    AND users_lists.category != 3)
                OR (users_lists.selected_user = $user
                    AND online_users.user = users_lists.owner_user
                    AND users_lists.category != 3)                
            LEFT JOIN users ON online_users.user = users.id
            WHERE users.id <> $user");   
}

?>