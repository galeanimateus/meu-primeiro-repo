/*
UPDATE = Atualizar os dados
DELETE = Deletar o registro (tupla/linha)
ALTER = Altera a estrutura da tabela
	MODIFY
	ADD
    RENAME
    DROP

CONTRAIN = Regra do dado
SELECT com WHERE = 
*/

USE sprint1;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
peso DECIMAL(4,1),
altura FLOAT,
plano VARCHAR(40),
CONSTRAINT chPlano
	CHECK(plano IN ('Mensal', 'Semanal', 'Avulso')),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuario (nome, peso, altura, plano) VALUES
('Jorge Silva', 72.5, 1.65, 'Mensal'),
('Bianca Dias', 56.4, 1.60, 'Semanal'),
('Mateus Galeani', 80.2, 1.80, 'Mensal'),
('Yasmin Ferro', 54.1, 1.55, 'Avulso');

SELECT * FROM usuario;

-- Testando a regra do campo PLANO 
INSERT INTO usuario (nome, peso, altura, plano) VALUES
('Endrick Felipe', 85.5, 1.75, 'semanal'), -- O MySQL aceitou com ele escrito 'semanal' e não 'Semanal'
('Estevão de Lima', 75.3, 1.75, 'Ano'); -- Agora deu erro porque não existe o plano 'Ano' dentro da CONSTRAINT

SELECT nome, plano, dtCadastro FROM usuario;

SELECT nome AS 'Nome do usuario',
plano AS Plano,
dtCadastro AS Data_de_Cadastro
FROM usuario;

SELECT CONCAT(nome, ' ', plano) FROM usuario;

SELECT CONCAT(nome, ' usa o plano:  ', plano) FROM usuario;

SELECT CONCAT(nome, ' usa o plano:  ', plano) AS Mensagem FROM usuario;

SELECT nome, CASE 
	WHEN plano = 'Mensal' THEN 'Tem 30 dias para treinar' 
	WHEN plano = 'Semanal' THEN 'Tem 7 dias para treinar'
    ELSE 'Treinar quando pagar'
END AS Dias_TREINO,
peso
FROM usuario;

SELECT nome, CASE 
	WHEN peso >= 80 THEN 'Tá pesado'
	WHEN peso > 60 THEN 'Tá na média' 
    ELSE 'Tá magrinho'
END AS 'Condiçao do peso',
peso
FROM usuario
-- WHERE id IN (1,3,5); (Mostra os id 1,3,5)
-- WHERE id NOT IN (1,3,5); (Mostra o id que não são 1,3,5)
WHERE id BETWEEN 1 AND 5; -- (Mostra os id entre 1 e 5 incluindo o 1 e 5)



