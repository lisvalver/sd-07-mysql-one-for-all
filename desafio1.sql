-- MySQL Workbench Synchronization
-- Generated: 2021-03-05 16:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Fernando Freire

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(45) NOT NULL,
  `idade` INT(11) ZEROFILL NULL DEFAULT NULL,
  `plano_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_plano_id_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_plano_id`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT(11) NOT NULL AUTO_INCREMENT,
  `plano_tipo` VARCHAR(45) NOT NULL,
  `plano_preço` DECIMAL NOT NULL,
  PRIMARY KEY (`plano_id`),
  UNIQUE INDEX `plano_tipo_UNIQUE` (`plano_tipo` ASC) VISIBLE,
  UNIQUE INDEX `plano_id_UNIQUE` (`plano_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducao` (
  `usuario_id` INT(11) NOT NULL,
  `musica_id` INT(11) NOT NULL,
  INDEX `fk_historico_de_reproducao_1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_historico_de_reproducao_2_idx` (`musica_id` ASC) VISIBLE,
  CONSTRAINT `fk_historico_de_reproducao_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_de_reproducao_2`
    FOREIGN KEY (`musica_id`)
    REFERENCES `SpotifyClone`.`musicas` (`musica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musicas` (
  `musica_id` INT(11) NOT NULL AUTO_INCREMENT,
  `musica_titulo` VARCHAR(100) NOT NULL,
  `album_id` INT(11) NOT NULL,
  `artista_id` INT(11) NOT NULL,
  PRIMARY KEY (`musica_id`),
  UNIQUE INDEX `musica_id_UNIQUE` (`musica_id` ASC) VISIBLE,
  INDEX `fk_musicas_1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_musicas_2_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_musicas_1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musicas_2`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`albuns_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `albuns_id` INT(11) NOT NULL AUTO_INCREMENT,
  `album_title` VARCHAR(45) NOT NULL,
  `artista_id` INT(11) NOT NULL,
  PRIMARY KEY (`albuns_id`),
  INDEX `fk_albuns_1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_albuns_1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artista_nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_seguidores` (
  `usuario_id` INT(11) NOT NULL,
  `artista_id` INT(11) NOT NULL,
  INDEX `fk_historico_de_seguidores_1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_historico_de_seguidores_2_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_historico_de_seguidores_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_de_seguidores_2`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into SpotifyClone.usuarios(usuario_nome, idade, plano_id)
values ('Thati', '23', 1),('Cintia', 35, 2),('Bill', 20, 3), ('Roger', '45', 1);

insert into SpotifyClone.planos (plano_tipo, plano_preco)
values ('gratuito', 0), ('familiar', 7,99),('universitário', 5,99);

insert into SpotifyClone.artistas(artista_nome)
values ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

insert into SpotifyClone.historico_de_seguidores(usuario_id, artista_id)
values(1, 1), (1, 4), (1,3),(2,1),(2,3),(3,2),(3,1),(4,4);

insert into SpotifyClone.albuns(album_title, artista_id)
values('Envious', 1),('Exuberant',1),('Hallowed Steam',2), ('Incandescent',3), ('Temporary Culture',4);

insert into SpotifyClone.musicas(album_id, artista_id, musica_titulo)
values (1,1,'Soul For Us'),(1,1,'Reflections of Magic'), (1,1,'Dance with her own'),(2,1,'Troubles Of My Inner Fire'),(2,1,'Time Fireworks'),
(3,2, 'Magic Circus'), (3,2,'Honey, So Do I'),(3,2,'Sweetie, Let\'s Go Wild'), (3,2,'She Knows'), (4,3,'Fantasy for Me'), (4,3,'Celebration Of More'),
(4,3,'Rock His Everything'), (4,3,'Home Forever'),(4,3,'Diamond Power'), (4,3,'Honey, Let\'s Be Silly'), (5,4,'Thang Of Thunder'),(5,4,'Words Of Her Life'),
(5,4,'Without My Streets');
