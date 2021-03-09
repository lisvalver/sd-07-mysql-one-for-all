DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS Plano;
CREATE TABLE Plano (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Artista;
CREATE TABLE Artista (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Album;
CREATE TABLE Album (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.Artista (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idade INT,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES SpotifyClone.Plano (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Seguindo;
CREATE TABLE Seguindo (
    usuario_id INT,
    artista_id INT,
    PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.Usuario (id),
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.Artista (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Cancao;
CREATE TABLE Cancao (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.Album (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Historico;
CREATE TABLE Historico (
    usuario_id INT,
    cancao_id INT,
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    FOREIGN KEY (cancao_id)
        REFERENCES SpotifyClone.Cancao (id)
) ENGINE = InnoDB;

INSERT INTO Plano(tipo, valor)
VALUES("gratuito", 0), ("familiar", 7.99), ("universitário", 5.99);

INSERT INTO Artista(nome)
VALUES("Walter Phoenix"), ("Peter Strong"), ("Lancy Day"), ("Freedie Shannon");

INSERT INTO Album(nome, artista_id)
VALUES("Envious", 1), ("Exuberant", 2), ("Hallowed Steam", 3), ("Incandescent", 4), ("Temporary Culture", 5);
    
INSERT INTO Usuario(nome, idade, plano_id )
VALUES("Thati", 23, 1 ), ("Cintia", 35, 2), ("Bill", 20, 3), ("Roger", 45, 1);

INSERT INTO Seguindo(usuario_id, artista_id )
VALUES(1, 1), (1, 3), (1, 4), (2, 1), (2, 3), (3, 1), (3, 2), (4, 4);
    
INSERT INTO Cancao(nome, album_id)
VALUES("Soul For Us", 1 ), ("Reflections Of Magic", 1), ("Dance With Her Own", 1), ("Troubles Of My Inner Fire", 2), ("Time Fireworks", 2), ("Magic Circus", 3), ("Honey, So Do I", 3), ("Sweetie, Let's Go Wild", 3), ("She Knows", 3), ("Fantasy For Me", 4), ("Celebration Of More", 4), ("Rock His Everything", 4), ("Home Forever", 4), ("Diamond Power", 4), ("Honey, Let's Be Silly", 4), ("Thang Of Thunder", 5), ("Words Of Her Life", 5), ("Without My Streets", 5);
        
INSERT INTO Historico(usuario_id, cancao_id)
VALUES(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2), (2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);
