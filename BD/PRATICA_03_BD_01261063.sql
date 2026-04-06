-- Exercício 1

USE sprint2;

CREATE TABLE atleta (
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
('Marcos', 'Futebol', 3),
('Ronaldinho', 'Futebol', 7),
('Michael Phelps', 'Natação', 20),
('César Cielo', 'Natação', 2),
('Michael Jordan', 'Basquete', 13),
('Lebron James', 'Basquete', 10);

CREATE TABLE pais (
idPais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
capital VARCHAR(40)
);

INSERT INTO pais (nome, capital) VALUES 
('Brasil', 'Brasilia'),
('Estados Unidos', 'Washington'),
('Itália', 'Roma'),
('China', 'Pequim'),
('Japão', 'Tóquio');

ALTER TABLE atleta ADD COLUMN fkIdPais INT;

ALTER TABLE atleta ADD CONSTRAINT chFkIdPais FOREIGN KEY (fkIdPais) REFERENCES pais (idPais);

UPDATE atleta SET fkIdPais = 1 WHERE idAtleta IN (1, 2, 4);

UPDATE atleta SET fkIdPais = 2 WHERE idAtleta IN (3, 5, 6);

SELECT * FROM atleta 
	JOIN pais ON idPais = fkIdPais;
    
SELECT atleta.nome AS 'Nome Atleta', pais.nome AS 'País Atleta' FROM atleta 
	JOIN pais ON idPais = fkIdPais;

SELECT atleta.nome AS 'Nome Atleta', pais.nome AS 'País Atleta', capital AS 'Capital do País' FROM atleta 
	JOIN pais ON idPais = fkIdPais;
    
----------------------------------------------------------------------------------------------------------------

-- Exercício 2

USE sprint2;

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

CREATE TABLE album (
idAlbum INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
tipo VARCHAR(10) 
	CONSTRAINT chTipo CHECK (tipo IN ('Digital', 'Físico')),
dtLancamento DATE
);

INSERT INTO album (nome, tipo, dtLancamento) VALUES
('Quando chega a noite', 'Físico', '2012-03-20'),
('360º Ao Vivo', 'Digital', '2012-11-30');

SELECT * FROM album;

SELECT * FROM musica;

ALTER TABLE musica ADD COLUMN fkIdAlbum INT;

ALTER TABLE musica ADD CONSTRAINT chFkIdAlbum FOREIGN KEY (fkIdAlbum) REFERENCES album (IdAlbum);

UPDATE musica SET fkIdAlbum = 1 WHERE idMusica = '2';

UPDATE musica SET fkIdAlbum = 2 WHERE idMusica = '7';

SELECT * FROM musica JOIN album ON fkIdAlbum = idAlbum;

SELECT musica.titulo AS 'Nome da Música', album.nome AS 'Nome do ÁLbum' FROM album
	JOIN musica ON fkIdAlbum = idAlbum;
    
SELECT musica.titulo AS 'Nome da Música', album.nome AS 'Nome do Álbum', musica.genero AS 'Genero' FROM album
	JOIN musica ON idAlbum = fkIdAlbum;
    
------------------------------------------------------------------------------------------------------------------

-- Exercício 3

USE sprint2;

SELECT * FROM pessoa;

SELECT * FROM reserva;

SELECT * FROM pessoa JOIN
reserva ON idPessoa = fkPessoa AND idPessoa = 1;

SELECT nome AS 'Nome', dtReserva AS 'Data Reserva', dtRetirada 'Data Retirada', dtDevolucao 'Data Devolução'
FROM pessoa JOIN reserva ON idPessoa = fkPessoa;

SELECT nome, dtReserva FROM reserva 
JOIN pessoa ON idPessoa = fkPessoa AND dtReserva = '2025-01-01 01:01:01';

SELECT CONCAT(nome, ' retirou na data ', dtReserva) AS 'Mensagem' FROM reserva
JOIN pessoa ON idPessoa = fkPessoa;

SELECT IFNULL(dtRetirada, 'Não foi retirado') AS 'Data Retirada', IFNULL(dtDevolucao, 'Não foi devolvido') AS 'Data Devolução', nome AS 'Nome' FROM reserva
JOIN pessoa ON fkPessoa = idPessoa;

------------------------------------------------------------------------------------------------------------------

-- Exercício 4

USE sprint2;

SELECT * FROM pessoa2 
JOIN pessoa1 ON pessoa1.idPessoa = fkPessoa1;

SELECT * FROM pessoa1 
JOIN pessoa2 ON pessoa1.idPessoa = fkPessoa1 
WHERE pessoa1.idPessoa = 1;

SELECT * FROM pessoa2 
JOIN pessoa1 ON fkPessoa1 = pessoa1.idPessoa
WHERE pessoa2.idPessoa = 1;

SELECT Pessoa1.nome AS 'Nome Pessoa 1', Pessoa2.nome AS 'Nome Pessoa 2' 
FROM pessoa1 
JOIN pessoa2 ON pessoa1.idPessoa = fkPessoa1;

SELECT pessoa1.* FROM pessoa1 
JOIN pessoa2 ON pessoa1.idPessoa = fkPessoa1 
WHERE pessoa2.dtNascimento > '1999-12-31';

------------------------------------------------------------------------------

-- Exercício 5

SELECT * FROM pessoa 
JOIN documento ON idPessoa = fkPessoa 
WHERE idPessoa = 1;

SELECT Pessoa.nome, categoriaA, categoriaB
FROM Pessoa 
JOIN documento ON idPessoa = fkPessoa;

SELECT Pessoa.* FROM Pessoa 
JOIN documento ON idPessoa = fkPessoa 
WHERE documento.categoriaA = 'A';

SELECT  CASE 
	WHEN categoriaA = 'A' AND categoriaB = 'B' THEN CONCAT(nome, ' está habilitado na categoria A e B.')
	WHEN categoriaA = 'A' THEN CONCAT(nome, ' está habilitado na categoria A.')
    WHEN categoriaB = 'B' THEN CONCAT(nome, ' está habilitado na categoria B.')
    ELSE 'Não está habilitado em nenhuma categoria'
END AS 'Mensagem'
FROM Pessoa 
JOIN documento ON idPessoa = fkPessoa;	

SELECT Pessoa.*, documento.* FROM Pessoa 
JOIN documento ON idPessoa = fkPessoa 
WHERE documento.dtVencimento < CURRENT_DATE;

-----------------------------------------------------------------------------------------

-- Exercício 6

SELECT * FROM farmacia 
JOIN farmaceutico JOIN endereco ON idFarmacia = endereco.fkFarmacia AND idFarmacia = farmaceutico.fkFarmacia;

SELECT farmaceutico.nome, farmacia.nome, rua FROM farmacia 
JOIN farmaceutico JOIN endereco ON idFarmacia = endereco.fkFarmacia AND idFarmacia = farmaceutico.fkFarmacia;

SELECT farmacia.nome, endereco.* FROM farmacia 
JOIN farmaceutico JOIN endereco ON idFarmacia = endereco.fkFarmacia AND idFarmacia = farmaceutico.fkFarmacia;

SELECT CONCAT('O dr. ', farmaceutico.nome, ' trabalha na ', farmacia.nome, ' na rua ', rua) AS 'Onde o Farmaceutico trabalha?'
FROM farmacia JOIN farmaceutico JOIN endereco ON idFarmacia = endereco.fkFarmacia AND idFarmacia = farmaceutico.fkFarmacia;





