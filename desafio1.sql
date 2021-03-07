DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `plano` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_plano` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_usuario` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `artista` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `album` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `musica` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_musica` VARCHAR(45) NOT NULL,
  `album_id` INT NOT NULL,
  FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `historico_reproducao` (
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `musica_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`musica_id`) REFERENCES `musica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `seguidores` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO `plano` (`nome_plano`, `valor`)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO `usuario` (`nome_usuario`, `idade`, `plano_id`)
VALUES ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO `artista` (`nome_artista`)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO `album` (`nome_album`, `artista_id`)
VALUES ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO `musica` (`nome_musica`, `album_id`)
VALUES ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);
INSERT INTO `historico_reproducao` (`usuario_id`, `musica_id`)
VALUES (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`)
VALUES (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
