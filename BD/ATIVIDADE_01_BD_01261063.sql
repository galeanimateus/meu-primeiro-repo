CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE atleta (
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modalidade VARCHAR(40),
qntMedalha INT
);

DESCRIBE atleta;

INSERT INTO atleta VALUES 
(DEFAULT, 'Mateus Galeani', 'Volei', 3),
(DEFAULT, 'Murillo Toscano', 'Volei', 1),
(DEFAULT, 'Erick Matsuda', 'Natação', 2),
(DEFAULT, 'Pedro Depole', 'Natação', 1);

INSERT INTO atleta VALUES
(DEFAULT, 'Luiz Parreira', 'Tênis de Mesa', 1),
(DEFAULT, 'Otávio Louzada', 'Tênis de Mesa', 2);

SELECT * FROM atleta;

SELECT nome, qntMedalha FROM atleta;

SELECT * FROM atleta WHERE modalidade = 'Volei';

SELECT * FROM atleta ORDER BY modalidade;
SELECT * FROM atleta ORDER BY qntMedalha DESC;

SELECT * FROM atleta WHERE nome LIKE '%s%';
SELECT * FROM atleta WHERE nome LIKE 'm%';
SELECT * FROM atleta WHERE nome LIKE '%o';
SELECT * FROM atleta WHERE nome LIKE '%r_';

DROP TABLE atleta;

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

DESCRIBE filme;

SELECT * FROM filme;
SELECT titulo, diretor FROM filme;
SELECT * FROM filme WHERE genero = 'Fantasia';
SELECT * FROM filme WHERE diretor = 'Fernando Meirelles';
SELECT * FROM filme ORDER BY titulo;
SELECT * FROM filme ORDER BY diretor DESC;
SELECT * FROM filme WHERE titulo LIKE 'Z%';
SELECT * FROM filme WHERE diretor LIKE '%h';
SELECT * FROM filme WHERE genero LIKE '_o%';
SELECT * FROM filme WHERE titulo LIKE '%u_';

DROP TABLE filme;

USE sprint1;

CREATE TABLE musica(
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO musica VALUES 
(DEFAULT, 'Ordinary', 'Alex Warren', 'Chamber Pop'),
(DEFAULT, 'In This Shit', 'The Irrepressibles', 'Chamber Pop'),
(DEFAULT, 'Te Vivo', 'Luan Santana', 'Sertanejo'),
(DEFAULT, 'Chuva de Arroz', 'Luan Santana', 'Sertanejo'),
(DEFAULT, '1406', 'Mamonas Assasinas', 'Rock Alternativo'),
(DEFAULT, 'Robocop Gay', 'Mamonas Assasinas', 'Rock Alternativo'),
(DEFAULT, 'Window Shopper', '50 Cent', 'Hip Hop');

SELECT * FROM musica;

SELECT titulo, artista FROM musica;

SELECT * FROM musica WHERE genero = 'Hip Hop';

SELECT * FROM musica WHERE artista = 'Mamonas Assasinas';

SELECT * FROM musica ORDER BY titulo;
SELECT * FROM musica ORDER BY artista DESC;
SELECT * FROM musica WHERE titulo LIKE 'R%';
SELECT * FROM musica WHERE artista LIKE '%a';
SELECT * FROM musica WHERE genero LIKE '_h%';
SELECT * FROM musica WHERE titulo LIKE '%v_';

DROP TABLE musica;

USE sprint1;

CREATE TABLE professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc CHAR(10)
);

INSERT INTO professor VALUES 
(DEFAULT, 'Edvaldo', 'Matemática', '1965-12-31'),
(DEFAULT, 'Nilzete', 'Literatura', '1905-04-01'),
(DEFAULT, 'Thiago', 'Gramática', '1985-12-24'),
(DEFAULT, 'Patrícia', 'Gramática', '1980-10-12'),
(DEFAULT, 'Mateus', 'Matemática', '2005-06-04'),
(DEFAULT, 'Djanary', 'Inglês', '1996-10-31');

SELECT * FROM professor;
SELECT especialidade FROM professor;
SELECT * FROM professor WHERE especialidade = 'Matemática';
SELECT * FROM professor ORDER BY nome;
SELECT * FROM professor ORDER BY dtNasc DESC;
SELECT * FROM professor WHERE nome LIKE 'M%';
SELECT * FROM professor WHERE nome LIKE '%s';
SELECT * FROM professor WHERE nome LIKE '_a%';
SELECT * FROM professor WHERE nome LIKE '%u_';

DROP TABLE professor;

USE sprint1;

CREATE TABLE jogo(
idJogo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);

INSERT INTO jogo VALUES
(DEFAULT, 'Minecraft', 'Jogo muito bom, completo, com inúmeros tipos diferentes de jogatinas e estimula a criatividade', 1),
(DEFAULT, 'CS:GO', 'Jogo de FPS bem interativo, desenvolve o senso de estratégico, precisão, liderança e constância', 2),
(DEFAULT, 'Super Mario Odyssey', 'Um jogo de mundo aberto para estimular a criatividade e senso lógico', 3),
(DEFAULT, 'It Takes Two', 'Ótimo jogo para treinar a capacidade de trabalhar em equipe, exigindo comunicaão e e cooperação com a sua dupla', 4),
(DEFAULT, 'Astroneer', 'Um jogo muito pacífico, com intuito de desenvolver a capacidade de organização, automação e exploração', 5);

SELECT * FROM jogo;
SELECT nome FROM jogo;
SELECT comentario FROM jogo WHERE nome = 'Minecraft';
SELECT * FROM jogo ORDER BY nome;
SELECT * FROM jogo ORDER BY ranking DESC;
SELECT * FROM jogo WHERE nome LIKE 'C%';
SELECT * FROM jogo WHERE nome LIKE '%r';
SELECT * FROM jogo WHERE nome LIKE '_t%';
SELECT * FROM jogo WHERE nome LIKE '%e_';
SELECT * FROM jogo WHERE nome <> 'Minecraft';

DROP TABLE jogo;