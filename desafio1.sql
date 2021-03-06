DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE `SpotifyClone`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;

USE `SpotifyClone`;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`plano_id`),
  UNIQUE INDEX `plano_id_UNIQUE` (`plano_id` ASC) VISIBLE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) VISIBLE,
  INDEX `plano_id_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `plano_usuario_id_fk` FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`plano` (`plano_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `album_artista_id_fk_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `album_artista_id_fk` FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`musica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musica` (
  `musica_id` INT NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(45) NOT NULL,
  `album_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`musica_id`),
  INDEX `album_id_idx` (`album_id` ASC) VISIBLE,
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `musica_album_id_fk` FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `musica_artista_id_fk` FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_reproducao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_reproducao` (
  `historico_reproducao_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`historico_reproducao_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `musica_ida_idx` (`musica_id` ASC) VISIBLE,
  CONSTRAINT `historico_usuario_id_fk` FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `historico_musica_id_fk` FOREIGN KEY (`musica_id`) REFERENCES `SpotifyClone`.`musica` (`musica_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `seguidores_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  PRIMARY KEY (`seguidores_id`),
  CONSTRAINT `seguidores_usuario_id_fk` FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seguidores_artista_id_fk` FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista` (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
INSERT INTO usuario (nome_usuario, idade, plano_id)
VALUES ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
INSERT INTO plano (nome_plano, valor)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
INSERT INTO artista (nome_artista)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
INSERT INTO album (nome_album, artista_id)
VALUES ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
INSERT INTO musica (nome_musica, album_id, artista_id)
VALUES ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 2, 1),
  ('Time Fireworks', 2, 1),
  ('Magic Circus', 3, 2),
  ('Honey, So Do I', 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ('She Knows', 3, 2),
  ('Fantasy For Me', 4, 3),
  ('Celebration Of More', 4, 3),
  ('Rock His Everything', 4, 3),
  ('Home Forever', 4, 3),
  ('Diamond Power', 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ('Thang Of Thunder', 5, 4),
  ('Words Of Her Life', 5, 4),
  ('Without My Streets', 5, 4);
INSERT INTO historico_reproducao (usuario_id, musica_id)
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
INSERT INTO seguidores (usuario_id, artista_id)
VALUES (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
