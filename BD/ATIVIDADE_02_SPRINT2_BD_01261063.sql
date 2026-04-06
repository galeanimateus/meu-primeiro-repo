-- Prática de auto-relacionamento
-- Exercício 1

USE sprint2;

CREATE TABLE area (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE funcionario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkArea INT,
CONSTRAINT fkAreaConst
	FOREIGN KEY (fkArea) REFERENCES area (id),
fkSubordinado INT,
CONSTRAINT fkSubordinadoConst
	FOREIGN KEY (fkSubordinado) REFERENCES funcionario (id)
);

INSERT INTO area (nome) VALUES
('Recursos Humanos'),
('Tecnologia da Informação'),
('Financeiro'),
('Marketing'),
('Operacional');

INSERT INTO funcionario (nome, fkArea, fkSubordinado) VALUES
('Mateus', 2, NULL),
('Yasmin', 1, NULL),
('Lucas', 2, 1),
('Yutaka', 2, 3),
('Biagi', 2, 3),
('Madosan', 2, 3),
('Natalia', 1, 2),
('Leticia', 1, 2),
('Renato', 3, NULL),
('Marcos', 3, 9),
('Roberto', 3, 9),
('Glaucia', 4, NULL);

SELECT * FROM funcionario
 JOIN area ON fkArea = area.id;
 
 SELECT * FROM funcionario AS gerente
	JOIN funcionario AS subordinado ON gerente.id = subordinado.fkSubordinado;
    
SELECT g.nome AS 'Gerente', s.nome AS 'Subordinado', a.nome AS 'Área',
	CONCAT(s.nome, ' é subordinado do ', g.nome, ' e ambos são de ', a.nome) AS Mensagem
	FROM funcionario AS g 
	JOIN funcionario AS s 
		ON g.id = s.fkSubordinado
    JOIN area AS a
		ON g.fkArea = a.id
    JOIN area AS a2
		ON s.fkArea = a2.id;

SELECT g.nome AS 'Nome gerente', s.nome AS 'Nome Subordinado', a.nome AS 'Área'
	FROM funcionario AS g 
    JOIN funcionario AS s
		ON g.id = s.fkSubordinado
	JOIN area AS a
		ON a.id = g.fkArea
        WHERE g.fkArea = 1;
        
SELECT g.nome AS 'Nome gerente', s.nome AS 'Nome Subordinado',
	CASE 
		WHEN g.fkArea = 1 THEN 'Recursos Humanos'
		WHEN g.fkArea = 2 THEN 'Tecnologia da Informação'
		WHEN g.fkArea = 3 THEN 'Financeiro'
		WHEN g.fkArea = 4 THEN 'Marketing'
        ELSE 'Operacional'
	END AS 'Área'
	FROM funcionario AS g 
    JOIN funcionario AS s
		ON g.id = s.fkSubordinado
	JOIN area AS a
		ON a.id = g.fkArea;
-----------------------------------------------------------------------------------
-- Exercício 2

USE sprint2;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
numero CHAR(11),
fkGerenciado INT,
CONSTRAINT fkGerenciadoConst
	FOREIGN KEY (fkGerenciado) REFERENCES usuario (idUsuario)
);

CREATE TABLE email (
idEmail INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkUsuario INT,
CONSTRAINT fkUsuarioConst
	FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario)
);

INSERT INTO usuario (nome, dtNascimento, numero, fkGerenciado) VALUES
('Glacuia', '1971-11-14', '11912345678', NULL),
('Renato', '1971-08-08', '11987654321', NULL),
('Mateus', '2005-06-04', '11974336714', 1),
('Gabriela', '2002-07-18', '11964373842', 1),
('Renato Garage', '2025-12-20', '11989898989', 2),
('Mateus PetShop', '2022-02-10', '11923232323', 3);

INSERT INTO email (nome, fkUsuario) VALUES
('glaumrborges@gmail.com', 1),
('renatogaleani@gmail.com', 2),
('mateusbgaleani@gmail.com', 3),
('gabriela.galeani@gmail.com', 4),
('renatogarage08@gmail.com', 5),
('mateuspetshop04@gmail.com', 6),
('mateus.galeani@sptech.school', 3);

SELECT 
	g.nome AS 'Nome Usuario', 
    adm.nome AS 'Nome Administrador', 
    e.nome AS 'Email' 
    FROM usuario AS g
    JOIN usuario AS adm
		ON g.fkGerenciado = adm.idUsuario
	JOIN email AS e
		ON e.fkUsuario = g.idUsuario;
        
SELECT 
	g.nome AS 'Nome Usuario', 
    adm.nome AS 'Nome Administrador', 
    e.nome AS 'Email' 
    FROM usuario AS g
    JOIN usuario AS adm
		ON g.fkGerenciado = adm.idUsuario
	JOIN email AS e
		ON e.fkUsuario = g.idUsuario
	WHERE e.nome LIKE '%sptech%';
    
SELECT 
	g.nome AS 'Nome Usuario', 
    e.nome AS 'Email', 
    CASE 
		WHEN g.fkGerenciado = 1 THEN CONCAT('O usuário é gerenciado pelo(a)', (SELECT adm.nome FROM usuario WHERE idUsuario = 1))
		WHEN g.fkGerenciado = 2 THEN CONCAT('O usuário é gerenciado pelo(a)', (SELECT adm.nome FROM usuario WHERE idUsuario = 2))
		WHEN g.fkGerenciado = 3 THEN CONCAT('O usuário é gerenciado pelo(a)', (SELECT adm.nome FROM usuario WHERE idUsuario = 3))
		WHEN g.fkGerenciado = 4 THEN CONCAT('O usuário é gerenciado pelo(a)', (SELECT adm.nome FROM usuario WHERE idUsuario = 4))
		WHEN g.fkGerenciado = 5 THEN CONCAT('O usuário é gerenciado pelo(a)', (SELECT adm.nome FROM usuario WHERE idUsuario = 5))
        ELSE CONCAT('O usuário é gerenciado pelo(a)', (SELECT g.nome FROM usuario WHERE idUsuario = 6))
	END AS 'Por quem o usuário é gerenciado?'
    FROM usuario AS g
    JOIN usuario AS adm
		ON g.fkGerenciado = adm.idUsuario
	JOIN email AS e
		ON e.fkUsuario = g.idUsuario;
	