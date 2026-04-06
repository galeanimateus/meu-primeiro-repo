/* Isso é um comentário
Com 
Paragrafos
*/

-- comentário por linha (--)

-- criando a nossa base de dados da Sprint1
CREATE DATABASE sprint1;

-- Usar a minha base de dados
USE sprint1;

-- Criando a nossa primeira tabela
-- Toda tabela tem um ID e ele é único
-- O ID é a chave primária da tabela - Primary Key - PK 
CREATE TABLE empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14)
);

-- Descrever a tabela - Quais atributos e seus tipos
DESCRIBE empresa;
DESC empresa;

-- Inserir dados ou registros na tabela empresa
INSERT INTO empresa VALUES 
(DEFAULT, 'PWC', '123.456.0001-2');

-- Mostrar os dados da tabela empresa
SELECT * FROM empresa;

-- Inserindo mais registros na tabela
INSERT INTO empresa VALUES
(DEFAULT, 'Safra', '456.123.0001-2'),
(DEFAULT, 'Itaú', '346.333.0001-5'),
(NULL, 'Deloitte', '777.144.0001-4') -- NULL e DEFAULT dão na mesma, mas geralemte se usa DEFAULT
;

-- Inserindo um ID que já existe 
INSERT INTO empresa VALUES
(1, 'Safra', '456.123.0001-2');

-- Exibir apenas NOME e CNPJ da empresa
SELECT nome, cnpj FROM empresa;
-- Exibir apenas o NOME da empresa
SELECT nome FROM empresa;

-- Todos os dados da empresa Safra
SELECT * FROM empresa WHERE nome = 'Safra';
SELECT * FROM empresa WHERE id <= 3;
SELECT * FROM empresa WHERE id <> 2; -- empresa onde o id é diferente de 2 
SELECT * FROM empresa WHERE id != 2; -- != é = <> porém o <> é o padrão

-- Selecionar tudo da tabela EMPRESA onde o ID sejá diferente de 2 e o nome seja como/parecido com D% (começe com D)
SELECT * FROM empresa
WHERE id <> 2 
AND nome LIKE 'D%';

SELECT * FROM empresa WHERE nome LIKE '%a%'; -- empresa com a letra a no nome (Safra)

SELECT * FROM empresa WHERE nome LIKE '%r_'; -- empresa com a penaúltima letra sendo r (Safra)
SELECT * FROM empresa WHERE nome LIKE '%f__'; -- empresa com a anti-penaúltima letra sendo f (Safra)
SELECT * FROM empresa WHERE nome LIKE '_w%'; -- empresa com a segunda letra sendo w (PWC)

-- Exibir a empresa que termine o nome com a letra C
SELECT * FROM empresa WHERE nome LIKE '%C';

SELECT * FROM empresa WHERE nome LIKE '_w%'
AND nome LIKE '%r_';

SELECT * FROM empresa WHERE nome LIKE '_w%'
OR nome LIKE '%r_';

SELECT * FROM empresa;
SELECT * FROM empresa ORDER BY nome;
SELECT * FROM empresa ORDER BY nome ASC;
SELECT * FROM empresa ORDER BY nome DESC;

DROP TABLE empresa;
SELECT * FROM empresa;