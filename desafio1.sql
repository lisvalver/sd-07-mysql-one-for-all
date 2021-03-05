-- MySQL Script generated by MySQL Workbench
-- sex 05 mar 2021 18:49:47
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`planos` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_usuarios_planos_idx` ON `SpotifyClone`.`usuarios` (`plano_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artistas` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`albuns` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_albuns_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_albuns_artistas_idx` ON `SpotifyClone`.`albuns` (`artista_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios_artistas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usuarios_artistas` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios_artistas` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  CONSTRAINT `fk_usuarios_artistas_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_artistas_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_usuarios_artistas_artistas_idx` ON `SpotifyClone`.`usuarios_artistas` (`artista_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`cancoes` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cancoes_album`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_cancoes_album_idx` ON `SpotifyClone`.`cancoes` (`album_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios_cancoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usuarios_cancoes` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios_cancoes` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  CONSTRAINT `fk_usuarios_cancoes_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_cancoes_cancoes`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_usuarios_cancoes_cancoes_idx` ON `SpotifyClone`.`usuarios_cancoes` (`cancao_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`planos`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`planos` (`id`, `nome`, `valor`) VALUES (DEFAULT, 'gratuito', 0);
INSERT INTO `SpotifyClone`.`planos` (`id`, `nome`, `valor`) VALUES (DEFAULT, 'familiar', 7.99);
INSERT INTO `SpotifyClone`.`planos` (`id`, `nome`, `valor`) VALUES (DEFAULT, 'universitário', 5.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`usuarios` (`id`, `nome`, `idade`, `plano_id`) VALUES (DEFAULT, 'Thati', 23, 1);
INSERT INTO `SpotifyClone`.`usuarios` (`id`, `nome`, `idade`, `plano_id`) VALUES (DEFAULT, 'Cintia', 35, 2);
INSERT INTO `SpotifyClone`.`usuarios` (`id`, `nome`, `idade`, `plano_id`) VALUES (DEFAULT, 'Bill', 20, 3);
INSERT INTO `SpotifyClone`.`usuarios` (`id`, `nome`, `idade`, `plano_id`) VALUES (DEFAULT, 'Roger', 45, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`artistas` (`id`, `nome`) VALUES (DEFAULT, 'Walter Phoenix');
INSERT INTO `SpotifyClone`.`artistas` (`id`, `nome`) VALUES (DEFAULT, 'Peter Strong');
INSERT INTO `SpotifyClone`.`artistas` (`id`, `nome`) VALUES (DEFAULT, 'Lance Day');
INSERT INTO `SpotifyClone`.`artistas` (`id`, `nome`) VALUES (DEFAULT, 'Freedie Shannon');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`albuns` (`id`, `nome`, `artista_id`) VALUES (DEFAULT, 'Envious', 1);
INSERT INTO `SpotifyClone`.`albuns` (`id`, `nome`, `artista_id`) VALUES (DEFAULT, 'Exuberant', 1);
INSERT INTO `SpotifyClone`.`albuns` (`id`, `nome`, `artista_id`) VALUES (DEFAULT, 'Hallowed Steam', 2);
INSERT INTO `SpotifyClone`.`albuns` (`id`, `nome`, `artista_id`) VALUES (DEFAULT, 'Incandescent', 3);
INSERT INTO `SpotifyClone`.`albuns` (`id`, `nome`, `artista_id`) VALUES (DEFAULT, 'Temporary Culture', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`usuarios_artistas`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (1, 3);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (1, 4);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (2, 1);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (2, 3);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (3, 1);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (3, 2);
INSERT INTO `SpotifyClone`.`usuarios_artistas` (`usuario_id`, `artista_id`) VALUES (4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Soul For Us', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Reflections Of Magic', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Dance With Her Own', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Troubles Of My Inner Fire', 2);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Time Fireworks', 2);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Magic Circus', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Honey, So Do I', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Sweetie, Let\'s Go Wild', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'She Knows', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Fantasy For Me', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Celebration Of More', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Rock His Everything', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Home Forever', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Diamond Power', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Honey, Let\'s Be Silly', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Thang Of Thunder', 5);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Words Of Her Life', 5);
INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `album_id`) VALUES (DEFAULT, 'Without My Streets', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`usuarios_cancoes`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (1, 6);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (1, 14);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (1, 16);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (2, 13);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (2, 17);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (2, 6);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (2, 15);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (3, 16);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (3, 6);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (4, 3);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (4, 18);
INSERT INTO `SpotifyClone`.`usuarios_cancoes` (`usuario_id`, `cancao_id`) VALUES (4, 11);

COMMIT;
