-- Exercício 3

USE sprint2;

CREATE TABLE pessoa (
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

CREATE TABLE Reserva(
idReserva INT PRIMARY KEY AUTO_INCREMENT,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkPessoa INT,
CONSTRAINT chFkPessoa
FOREIGN KEY (fkPessoa) REFERENCES pessoa (idPessoa)
);

INSERT INTO pessoa (nome, cpf) VALUES
('Mateus', '00000000001'),
('Pedro', '00000000002'),
('Rafael', '00000000003'),
('Matheus', '00000000004'),
('Carlos', NULL),
(NULL, '00000000006'),
('Lucas', '00000000005');

INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2025-01-01 01:01:01', '2025-02-02 10:10:10', '2025-01-02 15:10:10', 1 ),
('2025-02-02 02:02:02', '2025-02-03 12:12:10', '2025-02-03 16:12:11', 2 ),
('2025-03-01 03:02:04', '2025-03-03 06:50:15', '2025-03-04 11:34:10', 3 ),
('2025-09-05 04:05:04', '2025-10-06 22:10:22', '2025-10-08 12:34:50', 4 ),
('2025-05-05 05:05:04', '2025-05-06 20:50:55', '2025-05-07 13:45:11', 5 );

SELECT * FROM Reserva;

SELECT * FROM pessoa;

SELECT nome AS 'Nome' FROM pessoa;

SELECT nome, CASE 
	WHEN cpf = '' THEN 'Sem CPF casatrado'
    ELSE 'CPF cadastrado'
END AS 'Condição CPF' FROM pessoa;

SELECT IFNULL(nome, 'FALHA NO REGISTRO') AS 'Nome'
FROM pessoa;

---------------------------------------------------------------------
-- Exercício 2

USE sprint2;

CREATE TABLE Pessoa1 (
idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE
);

CREATE TABLE Pessoa2 (
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
fkPessoa1 INT,
CONSTRAINT chFkPessoa1
FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1 (idPessoa1)
);

INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
('Mateus', '2005-01-01'),
('Erick', NULL),
(NULL, '2005-02-02'),
('Yasmin', '2004-05-22'),
('Murillo', '2004-10-07');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Galeani', '2005-06-04', 1),
('Matsuda', NULL, 2),
(NULL, '2005-03-03', 3),
('Ferro', '2004-01-22', 4),
('Toscano', '2004-07-10', 5);

SELECT * FROM Pessoa1;

SELECT * FROM Pessoa2;

SELECT nome AS 'Name' FROM Pessoa1;

SELECT nome, CASE 
	WHEN nome = 'Mateus' THEN 'Nome é Mateus'
    ELSE 'Nome não é Mateus'
END AS 'Condição nome' FROM Pessoa1;

SELECT IFNULL(nome, 'Sem nome cadastrado') AS 'Nome'
FROM pessoa;

---------------------------------------------------------------
-- Exercício 3
USE sprint2;

CREATE TABLE aluno (
idAluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
nome_pai VARCHAR(100),
nome_mae VARCHAR(100), 
dtNascimento DATE,
dtEmissao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documento (
idDocumento INT PRIMARY KEY AUTO_INCREMENT,
categoriaA CHAR(1),
CONSTRAINT chCategoriaA
	CHECK(categoriaA IN ('A', NULL)),
categoriaB CHAR(1),
CONSTRAINT chCategoriaB
	CHECK(categoriaB IN ('B', NULL)),
fkAluno INT,
CONSTRAINT chFkAluno
FOREIGN KEY (fkAluno) REFERENCES aluno (idAluno)
);

INSERT INTO aluno (nome, nome_pai, nome_mae, dtNascimento) VALUES
('Mateus Borges Galeani','Renato Cesar Perin Galeani', 'Glaucia Maria Rodrigues Borges', '2005-06-04'),
('Yasmin Ferro Gomes de Oliveira','José Luiz da Silva de Oliveira', 'Rosa Maria Ferro Gomes', '2004-05-22'),
(NULL,'Octávio Pereira Arruda', 'Cleide Nascimento de Aragão', '2002-10-24'),
('Cesar Pinheiro Campanhaes', NULL, NULL, '2006-02-11'),
('Luccas Barreto de Paula','Henrico Gaspar Amorim', 'Cecilia Souza Larotonda', NULL);

INSERT INTO documento (categoriaA, categoriaB, fkPessoa) VALUES
('A', 'B', 1),
(NULL, 'B', 2),
(NULL, 'B', 3),
('A', NULL, 4),
('A', 'B', 5);

SELECT * FROM aluno;

SELECT * FROM documento;

SELECT aluno.nome AS 'Nome Aluno',
aluno.nome_pai AS 'Nome do Pai',
aluno.nome_mae AS 'Nome da Mãe'
FROM aluno;


SELECT nome AS 'Nome Aluno', CASE 
	WHEN dtNascimento < 2008 THEN 'Aluno menor de 18 anos'
    ELSE 'Aluno maior de 18 anos'
END AS 'Maioridade' FROM aluno;

SELECT IFNULL(nome, 'SEM NOME') AS 'Nome',
IFNULL(nome_pai, 'SEM NOME DO PAI') AS 'Nome Pai',
IFNULL(nome_mae, 'SEM NOME DA MÃE') AS 'Nome Mãe'
FROM aluno;

---------------------------------------------------
-- Exercício 4

USE sprint2;

CREATE TABLE farmacia (
idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14)
);

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(45),
numero VARCHAR(10),
cep CHAR(8),
fkFarmacia INT,
CONSTRAINT chFkFarmcia
	FOREIGN KEY (fkFarmacia) REFERENCES farmacia (idFarmacia)
);

CREATE TABLE farmaceutico (
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
fkFarmacia INT,
CONSTRAINT chFkFarmacia
	FOREIGN KEY (fkFarmacia) REFERENCES farmacia (idFarmacia)
);

INSERT INTO farmacia (nome, cnpj) VALUES
('FamaCem', '01234567891111'),
('Drogasil', '01234567892222'),
('DrogaRaia', '01234567893333'),
('Drogaria SP', '01234567894444'),
('Drogaria Mateus', '01234567895555');

INSERT INTO endereco (rua, cep, numero, fkFarmacia) VALUES
('Rua Amarela', '01234567', '102', 1),
('Rua Bege', '76543210', '594', 2),
('Rua Cinza', '88888888', '23450', 3),
('Rua Dourada', '77777777', '1023', 4),
('Rua Esmeralda', '44444444', '345', 5);

INSERT INTO farmaceutico (nome, dtNascimento, fkFarmacia) VALUES
('Mateus', '2005-06-04', 4),
('Benedito', '2000-01-31', 5),
('Roger', '1980-08-09', 2),
('Peter', '1999-07-18', 1),
('Jurandir', '2003-10-16', 3);

SELECT * FROM farmacia;
SELECT * FROM endereco;
SELECT * FROM farmaceutico;

SELECT farmacia.nome AS 'Nome Farmacia'
FROM farmacia;

SELECT farmaceutico.nome AS 'Nome', CASE
	WHEN dtNascimento < '1999-12-31' THEN 'Nasceu antes dos anos 2000'
    ELSE 'Nasceu depois dos anos 2000'
END AS 'Milênio do Farmaceutico' FROM farmaceutico;

INSERT INTO farmacia (nome, cnpj) VALUES
('Farmácia Dez', NULL);

SELECT nome AS 'Nome Farmácia',
IFNULL(cnpj, 'REGISTRO INVÁLIDO') AS 'CNPJ'
FROM farmacia;




