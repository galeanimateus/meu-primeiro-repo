CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `preco` decimal(6,2) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `codProduto` char(8) DEFAULT NULL,
  `fkLoja` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `codProduto` (`codProduto`),
  KEY `chFkLoja` (`fkLoja`),
  CONSTRAINT `chFkLoja` FOREIGN KEY (`fkLoja`) REFERENCES `loja` (`idLoja`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loja` (
  `idLoja` int NOT NULL AUTO_INCREMENT,
  `nome` char(14) NOT NULL,
  `CNPJ` char(14) NOT NULL,
  `segmento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLoja`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE sprint2.loja ADD COLUMN nome VARCHAR(45);
ALTER TABLE sprint2.loja ADD COLUMN segmento VARCHAR(45);
ALTER TABLE sprint2.loja ADD COLUMN cnpj CHAR(14);

DESCRIBE sprint2.loja;

ALTER TABLE sprint2.loja MODIFY COLUMN nome VARCHAR(45) NOT NULL;
ALTER TABLE sprint2.loja MODIFY COLUMN CNPJ CHAR(14) NOT NULL UNIQUE;

TRUNCATE sprint2.loja;

CREATE TABLE sprint2.produto(
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
preco DECIMAL (6,2),
tipo VARCHAR(45),
codProduto CHAR(8) UNIQUE,
fkLoja INT, 
CONSTRAINT chFkLoja 
FOREIGN KEY (fkLoja) REFERENCES sprint2.loja (idLoja)
);

INSERT INTO sprint2.loja (nome, cnpj, segmento) VALUES
('Nike', '456.124.1000-1', 'Varejo'),
('Adidas', '956.245.1000-8', 'Varejo'),
('Milk Moo', '895.545.1000-1', 'Alimentício'),
('Ultra Farma', '756.123.1000-2', 'Farmaceutico');

SELECT * FROM sprint2.loja;

INSERT INTO sprint2.produto (nome, preco, tipo, codProduto, fkLoja) VALUES
('Air Force', 799.99, 'Tênis', '00000001', 1),
('Adi 2000 Mago Negro Yugi-Oh', 999.99, 'Tênis', '12312300', 2),
('Dipirona', 9.99, 'Comprimido', '98798700', 4),
('Pandora', 30.00, 'Milk Shake', '32132100', 3);

USE sprint2;

SELECT * FROM loja;

SELECT * FROM produto;

-- jeito ERRADO
SELECT * FROM loja
JOIN produto;

SELECT * FROM loja
	JOIN produto ON idLoja = fkLoja;
    
SELECT loja.nome, produto.nome FROM loja
JOIN produto ON idLoja = fkLoja;

SELECT loja.nome AS 'Loja', produto.nome AS 'Produto' FROM loja
JOIN produto ON idLoja = fkLoja;

SELECT l.nome AS 'Loja', p.nome AS 'Produto' 
FROM loja AS l
JOIN produto AS p ON idLoja = fkLoja;

SELECT * FROM loja 
	JOIN produto ON idLoja = fkLoja
    WHERE idLoja = 2;
    
SELECT loja.nome, produto.nome, 
	CASE 
		WHEN preco >= 700 THEN 'Muito caro'
		WHEN preco = 600 THEN 'Preço ok'
        ELSE 'Tá barato demaisss'
	END AS 'Mensagem Preço'
	FROM loja 
	JOIN produto ON idLoja = fkLoja
    WHERE idLoja = 2;
