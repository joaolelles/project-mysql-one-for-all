DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(250) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_album VARCHAR(250) NOT NULL,
      artista_id INT,
      ano_de_lancamento YEAR NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musica(
      musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_musica VARCHAR(250) NOT NULL,
      duracao SMALLINT  NOT NULL,
      artista_id INT,
      album_id INT,
      FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
      FOREIGN KEY (album_id) REFERENCES album (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.plano(
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(250) NOT NULL,
    valor_plano DECIMAL (5,2) NOT NULL
) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_usuario VARCHAR(250) NOT NULL,
      idade TINYINT NOT NULL,
      data_assinatura DATE NOT NULL,
      plano_id INT,
      FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducao(
    data_reproducao DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musica (musica_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artista (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album (nome_album, artista_id, ano_de_lancamento)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

  INSERT INTO SpotifyClone.musica (nome_musica, duracao, artista_id, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO´S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don´t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 2, 3),
    ('Como Nossos Pais', 105, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    ('Samba em Paris', 267, 4, 6),
    ('The Bard´s Song', 244, 5, 7),
    ('Feeling Good', 100, 6, 8); 

    INSERT INTO SpotifyClone.plano (nome_plano, valor_plano)
  VALUES
    ('gratuito', 0,00),
    ('familiar', 7,99),
    ('universitário', 5,99),
    ('pessoal', 6,99);

    INSERT INTO SpotifyClone.usuario (nome_usuario, idade, data_assinatura, plano_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

    INSERT INTO SpotifyClone.reproducao (data_reproducao, usuario_id, musica_id)
  VALUES
    ('2022-02-28 10:45:55', 1, 8),
    ('2020-05-02 05:30:35', 1, 2),
    ('2020-03-06 11:22:33', 1, 10),
    ('2022-08-05 08:05:17', 2, 10),
    ('2020-01-02 07:40:33', 2, 7),
    ('2020-11-13 16:55:13', 3, 10),
    ('2020-12-05 18:38:30', 3, 2),
    ('2021-08-15 17:10:10', 4, 8),
    ('2022-01-09 01:44:33', 5, 8),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 6, 7),
    ('2017-10-12 12:35:20', 6, 1),
    ('2011-12-15 22:30:49', 7, 4),
    ('2012-03-17 14:56:41', 8, 4),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 10, 3);

    INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
  VALUES
    ( 1, 1),
    ( 1, 2),
    ( 1, 3),
    ( 2, 1),
    ( 2, 3),
    ( 3, 2),
    ( 4, 4),
    ( 5, 5),
    ( 5, 6),
    ( 6, 6),
    ( 6, 1),
    ( 7, 6),
    ( 9, 3),
    ( 10, 2);