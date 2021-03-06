DROP database if exists SpotifyClone;
CREATE database SpotifyClone;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

DROP TABLE IF EXISTS `plano`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano_nome` VARCHAR(45) NOT NULL,
  `valor_plano` FLOAT NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;

LOCK TABLES `plano` WRITE;

INSERT INTO `plano` (`plano_nome`, `valor_plano`)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

UNLOCK TABLES;

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `plano_id_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `plano_id_usuario_fk`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `usuario` WRITE;

INSERT INTO `usuario` (`usuario_nome`, `idade`, `plano_id`)
VALUES ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

UNLOCK TABLES;

DROP TABLE IF EXISTS `artista`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

LOCK TABLES `artista` WRITE;

INSERT INTO `artista` (`artista_nome`)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

UNLOCK TABLES;

DROP TABLE IF EXISTS `album`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `artista_id_album_fk`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `album` WRITE;

INSERT INTO `album` (`album_nome`, `artista_id`)
VALUES ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

UNLOCK TABLES;

DROP TABLE IF EXISTS `musica`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musica` (
  `musica_id` INT NOT NULL AUTO_INCREMENT,
  `musica_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`musica_id`),
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  INDEX `album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `artista_id_musica_fk`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `album_id_musica_fk`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `musica` WRITE;

INSERT INTO `musica` (`musica_nome`, `artista_id`, `album_id`)
VALUES ("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 1, 2),
  ("Time Fireworks", 1, 2),
  ("Magic Circus", 2, 3),
  ("Honey, So Do I", 2, 3),
  ("Sweetie, Let's Go Wild", 2, 3),
  ("She Knows", 2, 3),
  ("Fantasy For Me", 3, 4),
  ("Celebration Of More", 3, 4),
  ("Rock His Everything", 3, 4),
  ("Home Forever", 3, 4),
  ("Diamond Power", 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ("Thang Of Thunder", 4, 5),
  ("Words Of Her Life", 4, 5),
  ("Without My Streets", 4, 5);

UNLOCK TABLES;

DROP TABLE IF EXISTS `historico`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `historico_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`historico_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `musica_id_idx` (`musica_id` ASC) VISIBLE,
  CONSTRAINT `usuario_id_historico_fk`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `musica_id_historico_fk`
    FOREIGN KEY (`musica_id`)
    REFERENCES `SpotifyClone`.`musica` (`musica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `historico` WRITE;

INSERT INTO `historico` (`usuario_id`, `musica_id`)
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

UNLOCK TABLES;

DROP TABLE IF EXISTS `seguindo`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo` (
  `seguindo_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`seguindo_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `usuario_id_seguindo_fk`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `artista_id_seguindo_fk`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `seguindo` WRITE;

INSERT INTO `seguindo` (`usuario_id`, `artista_id`)
VALUES (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
