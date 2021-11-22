CREATE TABLE skills (id SERIAL, label VARCHAR(255) NOT NULL);
INSERT INTO skills (label) VALUES ('Beginner');
INSERT INTO skills (label) VALUES ('Medium');
INSERT INTO skills (label) VALUES ('Professional');
CREATE TABLE users (id SERIAL, username VARCHAR(15) UNIQUE NOT NULL, pass VARCHAR(15) NOT NULL, skill BIGINT UNSIGNED);
ALTER TABLE users ADD FOREIGN KEY (skill) REFERENCES skills(id); 

CREATE TABLE games (id SERIAL, player1_id BIGINT UNSIGNED NOT NULL, player2_id BIGINT UNSIGNED NOT NULL, player_turn BIGINT UNSIGNED NOT NULL, player_winner BIGINT UNSIGNED, game_state VARCHAR(255) NOT NULL);
ALTER TABLE games ADD FOREIGN KEY (player1_id) REFERENCES users(id);
ALTER TABLE games ADD FOREIGN KEY (player2_id) REFERENCES users(id);
ALTER TABLE games ADD FOREIGN KEY (player_turn) REFERENCES users(id);
ALTER TABLE games ADD FOREIGN KEY (player_winner) REFERENCES users(id);

CREATE TABLE games_watchers(game_id BIGINT UNSIGNED NOT NULL, user BIGINT UNSIGNED NOT NULL, PRIMARY KEY(game_id, user));

CREATE TABLE messages_chanels (id SERIAL, label VARCHAR(255) NOT NULL);
INSERT INTO messages_chanels (label) VALUES ('Private');
INSERT INTO messages_chanels (label) VALUES ('Lobby');
INSERT INTO messages_chanels (label) VALUES ('Game');
CREATE TABLE messages (user BIGINT UNSIGNED PRIMARY KEY, id SERIAL, messagestring VARCHAR(255) NOT NULL, sender BIGINT UNSIGNED NOT NULL, chanel BIGINT UNSIGNED NOT NULL, message_time TIMESTAMP NOT NULL);
ALTER TABLE messages ADD FOREIGN KEY (user) REFERENCES users(id);
ALTER TABLE messages ADD FOREIGN KEY (sender) REFERENCES users(id);
ALTER TABLE messages ADD FOREIGN KEY (chanel) REFERENCES messages_chanels(id);

CREATE TABLE categories_of_users_lists (id SERIAL, label VARCHAR(255) NOT NULL);
INSERT INTO categories_of_users_lists (label) VALUES ('Challenge');
INSERT INTO categories_of_users_lists (label) VALUES ('Contact');
INSERT INTO categories_of_users_lists (label) VALUES ('Block');

CREATE TABLE users_lists (owner_user BIGINT UNSIGNED NOT NULL, selected_user BIGINT UNSIGNED NOT NULL, PRIMARY KEY(owner_user, selected_user), category BIGINT UNSIGNED NOT NULL);
ALTER TABLE users_lists ADD FOREIGN KEY (owner_user) REFERENCES users(id);
ALTER TABLE users_lists ADD FOREIGN KEY (selected_user) REFERENCES users(id);
ALTER TABLE users_lists ADD FOREIGN KEY (category) REFERENCES categories_of_users_lists(id);

CREATE TABLE online_users (user BIGINT UNSIGNED NOT NULL UNIQUE, game_id BIGINT unsigned, temp_id VARCHAR(255) UNIQUE NOT NULL, access_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL);
ALTER TABLE online_users ADD FOREIGN KEY (user) REFERENCES users(id);
ALTER TABLE online_users ADD FOREIGN KEY (game_id) REFERENCES games(id);