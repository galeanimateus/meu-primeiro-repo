USE sprint1;

CREATE TABLE atleta(
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

INSERT INTO atleta VALUES 
(DEFAULT, 'Lebron James', 'Basquete', 6),
(DEFAULT, 'Stephen Curry', 'Basquete', 5),
(DEFAULT, 'Mike Tayson', 'MMA', 4),
(DEFAULT, 'Anderson Silva', 'MMA', 3),
(DEFAULT, 'Cristiano Ronaldo', 'Futebol', 5),
(DEFAULT, 'Endrick', 'Futebol', 1),
(DEFAULT, 'Lucarelli', 'Volei', 2),
(DEFAULT, 'Serginho', 'Volei', 3);

SELECT * FROM atleta;

UPDATE atleta SET qtdMedalha = 7
WHERE idAtleta = 1;

UPDATE atleta SET qtdMedalha = 6
WHERE idAtleta IN (2,3);

UPDATE atleta SET nome = 'Mateus Galeani'
WHERE idAtleta = 4;

ALTER TABLE atleta ADD COLUMN dtNascimento DATE;

UPDATE atleta SET dtNascimento = '2000-01-01'
WHERE idAtleta = 1;

UPDATE atleta SET dtNascimento = '1986-02-01'
WHERE idAtleta = 2;

UPDATE atleta SET dtNascimento = '1990-03-01'
WHERE idAtleta = 3;

UPDATE atleta SET dtNascimento = '2005-06-04'
WHERE idAtleta = 4;

UPDATE atleta SET dtNascimento = '1980-04-01'
WHERE idAtleta = 5;

UPDATE atleta SET dtNascimento = '1971-05-01'
WHERE idAtleta = 6;

UPDATE atleta SET dtNascimento = '1955-06-01'
WHERE idAtleta = 7;

UPDATE atleta SET dtNascimento = '1995-07-01'
WHERE idAtleta = 8;

DELETE FROM atleta 
WHERE idAtleta = 5;

SELECT * FROM atleta 
WHERE modalidade <> 'Natação';

SELECT * FROM atleta 
WHERE qtdMedalha >= 3;

ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);

DESCRIBE atleta;

TRUNCATE atleta;

USE sprint1;

CREATE TABLE musica(
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO musica VALUES
(DEFAULT, 'DONA', 'Luan Santana', 'Sertanejo'),
(DEFAULT, 'Te Vivo', 'Luan Santana', 'Sertanejo'),
(DEFAULT, 'Timeless', 'The Weekend', 'Pop'),
(DEFAULT, 'Reminder', 'The Weekend', 'Pop'),
(DEFAULT, 'In Da Club', '50 Cent', 'Hip Hop'),
(DEFAULT, 'New Rules', 'Dua Lipa', 'Pop'),
(DEFAULT, 'Ô Queiroz', 'Grupo Revelação', 'Samba');

SELECT * FROM musica;

ALTER TABLE musica ADD COLUMN curtida INT;

UPDATE musica SET curtida = 185000
WHERE idMusica = 1;

UPDATE musica SET curtida = 13300000
WHERE idMusica = 2;

UPDATE musica SET curtida = 2000000
WHERE idMusica = 3;

UPDATE musica SET curtida = 3700000
WHERE idMusica = 4;

UPDATE musica SET curtida = 14000000
WHERE idMusica = 5;

UPDATE musica SET curtida = 18000000
WHERE idMusica = 6;

UPDATE musica SET curtida = 199000
WHERE idMusica = 7;

ALTER TABLE musica MODIFY COLUMN artista VARCHAR(80);

UPDATE musica SET curtida = 1000000
WHERE idMusica = 1;

UPDATE musica SET curtida = 1000000
WHERE idMusica IN (2,3);

UPDATE musica SET titulo = 'Te esperando'
WHERE idMusica = 5;

DELETE FROM musica 
WHERE idMusica = 4;

SELECT titulo FROM musica 
WHERE genero <> 'Funk';

SELECT * FROM musica 
WHERE curtida >= 20;

DESCRIBE musica;

TRUNCATE musica;
DROP TABLE musica;

USE sprint1;

CREATE TABLE filme(
idFilme INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

INSERT INTO filme VALUES
(DEFAULT, 'As Branquelas', 'Comédia', 'Keenen Ivory Wayans'),
(DEFAULT, 'Gente Grande', 'Comédia', 'Dennis Dugan'),
(DEFAULT, 'Dois Papas', 'Drama', 'Fernando Meirelles'),
(DEFAULT, 'Cidade de Deus', 'Drama', 'Fernando Meirelles'),
(DEFAULT, 'Zootopia 2', 'Aventura', 'Jared Bush'),
(DEFAULT, 'Interestellar', 'Ficção CIentífica', 'Christopher Nolan'),
(DEFAULT, 'Shrek', 'Fantasia', 'Andrew Adamson');

SELECT * FROM filme;

ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50);

UPDATE filme SET protagonista = 'Marlon Wayans'
WHERE idFilme = 1;

UPDATE filme SET protagonista = 'Adam Sandler'
WHERE idFilme = 2;

UPDATE filme SET protagonista = 'Jonathan Pryce'
WHERE idFilme = 3;

UPDATE filme SET protagonista = 'Douglas Silva'
WHERE idFilme = 4;

UPDATE filme SET protagonista = 'Nick Wilde'
WHERE idFilme = 5;

UPDATE filme SET protagonista = 'Matthew McConaughey'
WHERE idFilme = 6;

UPDATE filme SET protagonista = 'Shrek'
WHERE idFilme = 7;

ALTER TABLE filme MODIFY COLUMN diretor VARCHAR(150);

UPDATE filme SET diretor = 'Mateus Galeani'
WHERE idFilme = 5;

UPDATE filme SET diretor = 'Bananinha Moranguinho'
WHERE idFilme IN (2,7);

UPDATE filme SET titulo = 'Ataque da bananinha'
WHERE idFilme = 6;

DELETE FROM filme 
WHERE idFilme = 3;

SELECT titulo FROM filme 
WHERE genero <> 'Drama';

SELECT * FROM filme
WHERE genero = 'Suspense';

DESCRIBE filme;

TRUNCATE TABLE filme;
DROP TABLE filme;

USE sprint1;

CREATE TABLE professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);

INSERT INTO professor VALUES 
(DEFAULT, 'Edvaldo', 'Matemática', '1965-12-31'),
(DEFAULT, 'Nilzete', 'Literatura', '1905-04-01'),
(DEFAULT, 'Thiago', 'Gramática', '1985-12-24'),
(DEFAULT, 'Patrícia', 'Gramática', '1980-10-12'),
(DEFAULT, 'Mateus', 'Matemática', '2005-06-04'),
(DEFAULT, 'Djanary', 'Inglês', '1996-10-31');

SELECT * FROM professor;

ALTER TABLE professor ADD COLUMN funcao VARCHAR(50);

ALTER TABLE professor ADD CONSTRAINT chFuncao
	CHECK(funcao = 'monitor' OR funcao = 'assistente' OR funcao = 'titular');

UPDATE professor SET funcao = 'monitor'
WHERE idProfessor IN (1,3,5);

UPDATE professor SET funcao = 'assistente'
WHERE idProfessor IN (2,4);

UPDATE professor SET funcao = 'titular'
WHERE idProfessor = 6;

INSERT INTO professor VALUES
(DEFAULT, 'Professor Bananinha', 'Algoritmos', '1988-09-23', 'titular');

DELETE FROM professor
WHERE idProfessor = 5;

SELECT nome FROM professor 
WHERE funcao = 'titular';

SELECT especialidade, dtNasc FROM professor
WHERE funcao = 'monitor';

UPDATE professor SET dtNasc = '1978-10-30'
WHERE idProfessor = 3;

TRUNCATE TABLE professor;
DROP TABLE professor;

USE sprint1;

CREATE TABLE curso (
idCurso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
sigla CHAR(3),
coordenador VARCHAR(50));

INSERT INTO curso VALUES 
(DEFAULT, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Bananinha da Silva'),
(DEFAULT, 'Ciência da Computação', 'CCO', 'Moranguinho da Rocha'),
(DEFAULT, 'Inteligência Artificial em Sistemas da Informação', 'SIS', 'Manguinha Jr');

SELECT * FROM curso;

SELECT coordenador FROM curso;

SELECT * FROM curso 
WHERE sigla = 'ADS';

SELECT * FROM curso ORDER BY nome;

SELECT * FROM curso ORDER BY coordenador DESC;

SELECT * FROM curso 
WHERE nome LIKE 'C%';

SELECT * FROM curso 
WHERE nome LIKE '%s';

SELECT * FROM curso 
WHERE nome LIKE '_n%';

SELECT * FROM curso 
WHERE nome LIKE '%ã_';

DROP TABLE curso;

USE sprint1;

CREATE TABLE revista(
idRevista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(30)
);

INSERT INTO revista (idRevista, nome) VALUES 
(DEFAULT, 'Veja'),
(DEFAULT, 'Epoca'),
(DEFAULT, 'Quatro Rodas'),
(DEFAULT, 'Claudia');

SELECT * FROM revista;

UPDATE revista SET categoria = 'Moda'
WHERE idRevista = 1;

UPDATE revista SET categoria = 'Culinária'
WHERE idRevista = 2;

UPDATE revista SET categoria = 'Cinência'
WHERE idRevista = 3;

SELECT * FROM revista;

DESCRIBE revista;

ALTER TABLE revista MODIFY COLUMN categoria VARCHAR(40);

DESCRIBE revista;

ALTER TABLE revista ADD COLUMN periodicidade VARCHAR(15);

SELECT * FROM revista;

ALTER TABLE revista DROP COLUMN periodicidade;

USE sprint1;

CREATE TABLE carro(
idCarro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
placa CHAR(7)  NOT NULL UNIQUE
) AUTO_INCREMENT = 1000;

INSERT INTO carro VALUES
(DEFAULT, 'Celta', '1234567'),
(DEFAULT, 'SpaceFox', '1A2B3C4'),
(DEFAULT, 'Fox', 'A1B2C34'),
(DEFAULT, 'Fiesta', '7654321');

SELECT * FROM carro;

ALTER TABLE carro MODIFY COLUMN placa CHAR(7);

INSERT INTO carro (nome, placa) VALUES
('320I'),
('A3'),
('C180');

SELECT * FROM carro;

DESCRIBE carro;

ALTER TABLE carro MODIFY COLUMN nome VARCHAR(28);

DESCRIBE carro;

ALTER TABLE carro ADD COLUMN ano CHAR(4);

SELECT * FROM carro;

UPDATE carro SET placa = 'ABCDEFG'
WHERE idCarro = '1004';

UPDATE carro SET placa = 'GFEDCBA'
WHERE idCarro = '1005';

UPDATE carro SET placa = 'BANANA1'
WHERE idCarro = '1006';

UPDATE carro SET ano = '2005'
WHERE idCarro = '1000';

UPDATE carro SET ano = '2008'
WHERE idCarro = '1001';

UPDATE carro SET ano = '2020'
WHERE idCarro = '1002';

UPDATE carro SET ano = '2011'
WHERE idCarro = '1003';

UPDATE carro SET ano = '2023'
WHERE idCarro = '1004';

UPDATE carro SET ano = '2025'
WHERE idCarro = '1005';

UPDATE carro SET ano = '2026'
WHERE idCarro = '1006';

SELECT * FROM carro;

DROP TABLE carro;

DROP TABLE revista;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE aluno, atleta;