DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans( id INTEGER PRIMARY KEY AUTO_INCREMENT, account VARCHAR(100) NOT NULL, price DOUBLE(6,2) NOT NULL) engine = InnoDB;

CREATE TABLE singers( id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL) engine = InnoDB;

CREATE TABLE users(id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL, age INTEGER NOT NULL, plan_id INTEGER, FOREIGN KEY(plan_id) REFERENCES plans(id)) engine = InnoDB;

CREATE TABLE albuns(id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL, artist_id INTEGER  NOT NULL, FOREIGN KEY(artist_id) REFERENCES singers(id)) engine = InnoDB;

CREATE TABLE musical_track(id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL, album_id INTEGER NOT NULL, FOREIGN KEY(album_id) REFERENCES albuns(id)) engine = InnoDB;

CREATE TABLE user_history_songs(user_id INTEGER, songs_id INTEGER, PRIMARY KEY(user_id, songs_id), FOREIGN KEY(user_id) REFERENCES users(id), FOREIGN KEY(songs_id) REFERENCES musical_track(id)) engine = InnoDB;

CREATE TABLE following_artists(user_id INTEGER NOT NULL, artist_id INTEGER NOT NULL, PRIMARY KEY(user_id, artist_id), FOREIGN KEY(user_id) REFERENCES users(id), FOREIGN KEY(artist_id) REFERENCES singers(id)) engine = InnoDB;

INSERT INTO SpotifyClone.plans(account, price)
VALUES
('gratuito', 9), ('familiar', 7.99), ('universitário', 5.99);

INSERT INTO SpotifyClone.singers(name)
VALUES
('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

INSERT INTO SpotifyClone.users(name, age, plan_id)
VALUES
('Thati', 23, 1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);

INSERT INTO SpotifyClone.albuns(name, artist_id)
VALUES
('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);

INSERT INTO SpotifyClone.musical_track(name, album_id)
VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO SpotifyClone.user_history_songs(user_id, songs_id)
VALUES
(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);

INSERT INTO SpotifyClone.following_artists(user_id, artist_id)
VALUES
(1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
