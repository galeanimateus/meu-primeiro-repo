CREATE DATABASE SocioMentor;

USE SocioMentor;

CREATE TABLE socio (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11),
fkMentor INT,
CONSTRAINT fkMentorConst
	 FOREIGN KEY (fkMentor) REFERENCES socio (id)
);

INSERT INTO socio (nome, cpf, fkMentor) VALUES
('Mateus', '11111111111', NULL),
('Yasmin', '22222222222', 1),
('Pedro', '33333333333', 1),
('Gabriela', '44444444444', 1),
('Isabela', '55555555555', 1);

SELECT * FROM socio;

SELECT nome, CONCAT('Alunos do(a): ', (SELECT socio.nome FROM socio WHERE id = 1)) AS 'Mentor'
FROM socio 
WHERE fkMentor = 1;

-- Exibir os socios e seus mentores correspondentes
-- Desse jeito, da erro, poruqe a tabela Socio esta sendo usada 2 vezes sem apelido
SELECT * FROM socio 
JOIN socio ON fkMentor = id;

SELECT * FROM socio AS Mentorado
JOIN socio AS Mentor ON Mentorado.fkMentor = Mentor.id;

SELECT 
	mentor.nome AS 'Nome Mentor', 
	mentorado.nome AS 'Nome Mentorado', 
	CONCAT(mentor.nome, ' é mentor do(a) ', mentorado.nome) AS Mensagem
	FROM socio AS mentorado
	JOIN socio AS mentor ON mentorado.fkMentor = mentor.id;

SELECT mentor.nome AS 'Nome Mentor', mentorado.nome AS 'Nome Mentorado' FROM socio AS mentorado
JOIN socio AS mentor ON mentorado.fkMentor = mentor.id;

INSERT INTO socio (nome, cpf, fkMentor) VALUES
('Murillo', '11111111112', 3),
('Pedro D.', '22222222223', 3),
('Lais', '33333333334', 2),
('Erick', '44444444445', 3),
('Mariana', '55555555556', 2),
('Marcos', '55555555554', 4),
('Samuel', '55555555553', 4),
('Glaucia', '55555555552', 5),
('Renato', '55555555551', 5);

SELECT * FROM socio;

-----------------------------------------------------------------------------

CREATE DATABASE aula0325;

USE aula0325;

CREATE TABLE People (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45),
dtBirth DATE,
localBirth VARCHAR(45),
fkMom INT,
fkDad INT,
CONSTRAINT fkMomConst
	FOREIGN KEY (fkMom) REFERENCES People (id),
CONSTRAINT fkDadConst
	FOREIGN KEY (fkDad) REFERENCES People (id)
);

INSERT INTO People (name, dtBirth, localBirth, fkMom, FkDad) VALUES
('Brenno', '2007-05-03', 'São Paulo', NULL, NULL),
('Diana', '1985-10-13', 'São Paulo', NULL, NULL),
('Henrique', '1983-03-30', 'São Paulo', NULL, NULL),
('Lucas', '2008-04-23', 'São Paulo', 2, 3);

INSERT INTO People (name, dtBirth, localBirth) VALUES
('Mayre', '1959-01-22', 'Bahia'),
('Dalmivan', '1956-06-02', 'Ceará');

SELECT * FROM People;

UPDATE People SET fkDad = 6, fkMom = 5 
WHERE id = 2;

SELECT * FROM People;

SELECT 
	Son.name AS 'Son Name', Mom.name AS 'Mom Name' FROM People AS Son 
    JOIN People AS Mom 
    ON Son.fkMom = Mom.id;
    
SELECT
	son.name AS 'Son', mom.name AS 'Mom', grandma.name AS 'Grandma' 
    FROM People AS son
		JOIN People AS mom
			ON son.fkMom = mom.id
		JOIN People AS grandma
			ON mom.fkMom = grandma.id;
    
-- IFNULL() não faz sentido nessa Query, ele não é referenciado então ele não aparece no JOIN 
-- O JOIN sozinho é interpretado como INNER JOIN que referencia apenas as coisas que estão dentro da QUERY
SELECT 
	s.name AS 'Son',
    IFNULL(m.name, 'Come to stork') AS 'Mom',
	IFNULL(d.name, 'Come to stork') AS 'Dad',
    gm.name AS 'Grandma',
    gf.name AS 'Grandfa'
    FROM People AS s
		 JOIN People AS m
			ON s.fkMom = m.id
		 JOIN People AS d
			ON s.fkDad = d.id
		 JOIN People AS gm
			ON m.fkMom = gm.id
		 JOIN People AS gf 
			ON m.fkDad = gf.id;
            
            
-- Aqui aplicamos o LEFT JOIN e RIGHT JOIN porém dá uma incongruencia de dados, não sendo o uso adequado dele.
SELECT 
	s.name AS 'Son',
    IFNULL(m.name, 'Come to stork') AS 'Mom',
	IFNULL(d.name, 'Come to stork') AS 'Dad',
    gm.name AS 'Grandma',
    gf.name AS 'Grandfa'
    FROM People AS s
		LEFT JOIN People AS m
			ON s.fkMom = m.id
		RIGHT JOIN People AS d
			ON s.fkDad = d.id
		LEFT JOIN People AS gm
			ON m.fkMom = gm.id
		RIGHT JOIN People AS gf 
			ON m.fkDad = gf.id;
            


    

