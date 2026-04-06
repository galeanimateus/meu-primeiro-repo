USE sprint1;

CREATE TABLE aluno(
ra CHAR(8) PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) UNIQUE,
 dtNasc DATE
);

SHOW TABLES;

INSERT INTO aluno VALUES
('01261001', 'Mateus Borges Galeani', 'mateus.galeani@spetch.school', '2005-06-04'); 

INSERT INTO aluno (ra, nome) VALUES
('01261002', 'Yasmin Ferro Gomes de Oliveira'),
('01261003', 'Gabriela Borges Galeani');

SELECT * FROM aluno;

UPDATE aluno SET email = 'yasmin.ferro@sptech.school'
WHERE ra = '01261002';

UPDATE aluno SET email = 'gabriela.galeani@sptech.school',
dtNasc = '2002-07-18'
WHERE ra = '01261003';

SELECT * FROM aluno;

DELETE FROM aluno 
WHERE ra = '01261003';

SELECT * FROM aluno;

/* DELETE FROM aluno 
WHERE ra = '01261003'
OR ra = '01261002'; */

ALTER TABLE aluno ADD COLUMN nota DECIMAL(3,1);

-- ALTER TABLE aluno ADD COLUMN nota FLOAT; da para usar FLOAT para numero decimal mas o padrão é usar DECIMAL

DESCRIBE aluno;

ALTER TABLE aluno RENAME COLUMN dtNasc TO dataNascimento;

DESCRIBE aluno;

ALTER TABLE aluno MODIFY COLUMN nota DECIMAL(4,1);

DESCRIBE aluno;

SELECT * FROM aluno;

ALTER TABLE aluno DROP  COLUMN nota;

SELECT * FROM aluno;

UPDATE aluno SET dataNascimento = '2004-05-22'
WHERE ra = '01261002';

SELECT * FROM aluno;

ALTER TABLE aluno ADD ativo TINYINT;

DESCRIBE aluno;

UPDATE aluno SET ativo = 1
WHERE ra LIKE '01261%';

SELECT * FROM aluno;

ALTER TABLE aluno ADD COLUMN genero CHAR(1);

ALTER TABLE aluno ADD CONSTRAINT chGenero
	CHECK (genero = 'm' OR genero = 'f' OR genero = 'o');

SELECT * FROM aluno;

UPDATE aluno SET genero = 'm'
WHERE ra = '01261001';

SELECT * FROM aluno;

TRUNCATE aluno;

SELECT * FROM aluno;

DROP TABLE aluno;

