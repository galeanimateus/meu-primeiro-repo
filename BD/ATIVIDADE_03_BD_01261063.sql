CREATE DATABASE game_store;

USE game_store;

CREATE TABLE jogo (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
diretor VARCHAR(30),
genero VARCHAR(30),
lançamento CHAR(4),
nota FLOAT, 
CONSTRAINT chNota
    CHECK(nota BETWEEN 0 AND 10),
quantidadeDisponivel INT
);

INSERT INTO jogo (nome, diretor, genero, lançamento, nota, quantidadeDisponivel) VALUES 
('Mario Odyssey', 'Kenta Motokura', 'Aventura', '2017', 9.7, 250),
('Mario Strickers Battle League', 'Mike Inglehart', 'Espostes', '2022', 7, 450),
('Super Mario Bros', 'Shigeru Miyamoto', 'Plataforma', '1985', 8.8, 1000),
('Super Mario Bros Wonder', 'Shiro Mourio', 'Plataforma', '2023', 9.2, 350),
('Donkey Kong Bananza', 'Kazuya Takahashi', 'Plataforma', '2025', 9, 560);

ALTER TABLE jogo ADD COLUMN midia VARCHAR(10) 
	CONSTRAINT chMidia CHECK(midia IN ('Fisica', 'Digital'));
    
UPDATE jogo SET midia = 'Fisica' 
WHERE id IN (7,8);

UPDATE jogo SET midia = 'Digital' 
WHERE id IN (6,9,10);

SELECT * FROM jogo WHERE lançamento >= 2015;

SELECT * FROM jogo WHERE nome LIKE '%a%' AND midia = 'Fisica';

SELECT * FROM jogo WHERE diretor NOT LIKE '%e%'; 

SELECT * FROM jogo WHERE genero = 'Plataforma' AND quantidadeDisponivel > 0;

DELETE FROM jogo WHERE id > 5 AND quantidadeDisponivel > 0;

ALTER TABLE jogo RENAME COLUMN diretor TO criador;

DESCRIBE jogo;

CREATE DATABASE olimpiadas;

USE olimpiadas;

CREATE TABLE esporte (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(20),
CONSTRAINT chCategoria
	CHECK (categoria IN ('Individual', 'Coletivo')),
numJogadores TINYINT,
estreia DATE,
paisOrigem VARCHAR(30)
);

INSERT INTO esporte (nome, categoria, numJogadores, estreia, paisOrigem) VALUES 
('Futebol', 'Coletivo', 11, '1930-10-25', 'Inglaterra'),
('Volei', 'Coletivo', 6, '1922-05-22', 'Brasil'),
('Tênis de Mesa', 'Individual', 1, '1943-04-12', 'China'),
('Rugby', 'Coletivo', 9, '1969-01-22', 'Australia'),
('Rockey', 'Coletivo', 7, '1945-06-30', 'Canadá');

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(3,1),
ADD CONSTRAINT chPopularidade CHECK (popularidade BETWEEN 0 AND 10);

SELECT * FROM esporte;

DESCRIBE esporte;

UPDATE esporte SET popularidade = 9.5
WHERE id = 1;

UPDATE esporte SET popularidade = 9
WHERE id = 2;

UPDATE esporte SET popularidade = 8
WHERE id = 3;

UPDATE esporte SET popularidade = 7.5
WHERE id = 4;

UPDATE esporte SET popularidade = 5
WHERE id = 5;

SELECT * FROM esporte ORDER BY popularidade;

SELECT * FROM esporte WHERE estreia >= '2000-01-01';

ALTER TABLE esporte ADD CONSTRAINT chEstreia CHECK (estreia BETWEEN '1896-04-06' AND '2026-03-03');

ALTER TABLE esporte DROP CONSTRAINT chCategoria;

SELECT * FROM esporte WHERE paisOrigem LIKE '_a%';

SELECT * FROM esporte WHERE numJogadores BETWEEN 4 AND 11;

DELETE FROM esporte WHERE id IN (1,3,5);

CREATE DATABASE desenho;

USE desenho;

CREATE TABLE emissora (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50),
dtLancamento DATE,
emissoraOriginal VARCHAR(50),
classificacao VARCHAR (5),
CONSTRAINT chClassificacao 
	CHECK (classificacao IN ('Livre', '10', '12', '14', '16', '18')),
status VARCHAR(15),
nota TINYINT 
CONSTRAINT chNota 
	CHECK (nota BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10;

INSERT INTO emissora VALUES 
(DEFAULT, 'Peppa', '2012-02-14', 'BAD TV','Livre', 'Ativo', 1),
(DEFAULT, 'BackYardigans', '2000-09-23', 'TV Cultura','Livre', 'Ativo', 5),
(DEFAULT, 'Pooh', '1980-01-31', 'DISNEY', 'Livre', 'Ativo', 4),
(DEFAULT, 'Hora de Aventura', '2014-08-02', 'Cartoon', '12', 'Desativo', 3),
(DEFAULT, 'Scooby-Doo', '1980-07-17', 'Cartoon', '12', 'Ativo', 5);

SELECT * FROM emissora;

SELECT * FROM emissora WHERE classificacao <= 14;

SELECT * FROM emissora WHERE emissoraOriginal = 'DISNEY';

ALTER TABLE emissora ADD CONSTRAINT chStatus CHECK (status IN ('Ativo', 'Desativo', 'Cancelado'));

UPDATE emissora SET status = 'Desativo' WHERE id IN (11, 12);

UPDATE emissora SET status = 'Ativo' WHERE id IN (13, 15);

DELETE FROM emissora WHERE id = 12;

SELECT * FROM emissora WHERE titulo LIKE 'B%';

ALTER TABLE emissora DROP CONSTRAINT chClassificacao;

ALTER TABLE emissora RENAME COLUMN classificacao TO classificacaoIndicativa;

UPDATE emissora SET dtLancamento = '2004-05-22'
WHERE id = 11;

UPDATE emissora SET nota = 5
WHERE id = 11;

TRUNCATE emissora;

ALTER TABLE emissora DROP CONSTRAINT chStatus;

CREATE DATABASE estoque;

USE estoque;

CREATE TABLE misteriosSA (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
dtCompra DATE,
preco DECIMAL (4,2),
peso INT,
dtRetirada DATE);



INSERT INTO misteriosSA (nome, dtCompra, preco, peso) VALUES 
('Biscoitos Scooby', '2026-03-03', 24.99, 300),
('Cachorro quente', '2026-02-02', 14.99, 350),
('Cachorro quente', '2025-10-27', 29.99, 500), 
('Biscoitos Scooby', '2026-01-13', 9.99, 150),
('Biscoitos Scooby', '2025-09-08', 15.99, 400);

SELECT nome, dtCompra, dtRetirada, id FROM misteriosSA ORDER BY dtCompra;

UPDATE misteriosSA SET dtRetirada = '2026-03-04' WHERE id =  1;

ALTER TABLE misteriosSA RENAME COLUMN id TO idComida;

ALTER TABLE misteriosSA ADD CONSTRAINT chNome CHECK (nome IN ('Biscoitos Scooby', 'Cachorro quente'));

SELECT dtCompra AS Data_da_compra,
dtRetirada AS Data_da_retirada
FROM misteriosSA WHERE nome = 'Biscoitos Scooby';

SELECT * FROM misteriosSA WHERE dtCompra < '2024-08-25';

SELECT * FROM misteriosSA WHERE preco >= 30.50;

TRUNCATE misteriosSA;

CREATE DATABASE vingadores;

CREATE TABLE heroi (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
versao VARCHAR(45),
habilidade VARCHAR(40),
altura INT
);

INSERT INTO heroi VALUES 
(DEFAULT, 'Batman', 'Cavaleiro das Trevas', 'Ser rico', 175),
(DEFAULT, 'Superman', 'Homem de Aço', 'Todas', 185),
(DEFAULT, 'Mateus', 'O Incrivel Mateus', 'Super força', 180),
(DEFAULT, 'Flash', 'The Flash', 'Super Velocidade', 175),
(DEFAULT, 'Ciborgue', 'Liga da Justiça', 'Meio-Robô', 190);

SELECT * FROM heroi;

ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

DELETE FROM heroi WHERE id = 3;

INSERT INTO heroi VALUES 
(DEFAULT, 'Mulher Maravilha', 'Mulher-Maravilha', 'Amazona', 175, TRUE);

SELECT * FROM heroi WHERE nome LIKE 'C%' OR 'H%';

SELECT * FROM heroi WHERE nome NOT LIKE '%a%' OR '%A%';

SELECT nome FROM heroi WHERE altura > 190;

SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

TRUNCATE heroi;









