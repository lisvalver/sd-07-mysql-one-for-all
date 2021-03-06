SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `SpotifyClone` ;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

DROP TABLE IF EXISTS `SpotifyClone`.`planos` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `plano_UNIQUE` (`plano` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`artistas` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`albuns` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `artistas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albuns_artistas_idx` (`artistas_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_albuns_artistas`
    FOREIGN KEY (`artistas_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`cancoes` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NOT NULL,
  `albuns_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cancoes_albuns1_idx` (`albuns_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (`albuns_id`)
    REFERENCES `SpotifyClone`.`albuns` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` TINYINT UNSIGNED ZEROFILL NOT NULL,
  `planos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_usuarios_planos1_idx` (`planos_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_planos1`
    FOREIGN KEY (`planos_id`)
    REFERENCES `SpotifyClone`.`planos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`seguidores` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `artistas_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`artistas_id`, `usuarios_id`),
  INDEX `fk_artistas_has_usuarios_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_artistas_has_usuarios_artistas1_idx` (`artistas_id` ASC) VISIBLE,
  CONSTRAINT `fk_artistas_has_usuarios_artistas1`
    FOREIGN KEY (`artistas_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artistas_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `SpotifyClone`.`historico` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `cancoes_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`, `usuarios_id`),
  INDEX `fk_cancoes_has_usuarios_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_cancoes_has_usuarios_cancoes1_idx` (`cancoes_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_has_usuarios_cancoes1`
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancoes_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO planos (plano, valor)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO artistas (artista)
VALUES
    ('Walter Phoenix'), ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns (album, artistas_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancoes (cancao, albuns_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ('Sweetie, Let''s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey, Let''s Be Silly', 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

INSERT INTO usuarios (usuario, idade, planos_id)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

INSERT INTO seguidores (usuarios_id, artistas_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);

INSERT INTO historico (usuarios_id, cancoes_id)
VALUES
    (1, 1),
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
    (4,18),
    (4, 11);
