USE sprint1;   

-- EXERCÍCIO 1 
CREATE TABLE jogo (  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	nome VARCHAR(30) NOT NULL,  
	diretor VARCHAR(30) NOT NULL,  
	genero VARCHAR(30),  
	dtLancamento DATE NOT NULL,  
	nota INT CHECK (nota >= 1 AND nota <= 10),  
	quantidade INT  
);  

INSERT INTO jogo (nome, diretor, genero, dtLancamento, nota, quantidade) VALUES  
('Minecraft', 'Markus Notch Persson', 'Construçãpo e Exploração', '2009-05-17', 9, 15),  
('Red Dead Redemption 2', 'Rob Nelson', 'Ação/Aventura', '2018-10-26', 10, 10),  
('Poppy Playtime', 'Isaac Christopherson', 'Terror', '2021-10-12', 8, 25),  
('Hogwarts Legacy', 'Fineus Nigellus Black', 'RPG de Ação em Mundo Aberto', '2023-02-10', 8, 8),  
('The Last of Us', 'Neil Druckmann', 'Ação/Aventura e Horror', '2013-06-14', 9, 17);  

SELECT * FROM jogo;  

ALTER TABLE jogo ADD COLUMN midia VARCHAR(15)  
	CONSTRAINT chMidia  
		CHECK (midia IN ('Física', 'Digital'));  

UPDATE jogo SET midia = 'Física'  
WHERE id = 1;  

UPDATE jogo SET midia = 'Física'  
WHERE id = 2;   

UPDATE jogo SET midia = 'Digital'  
WHERE id = 3;  

UPDATE jogo SET midia = 'Digital'  
WHERE id =  4;  

UPDATE jogo SET midia = 'Física'  
WHERE id = 5; 

SELECT * FROM jogo WHERE dtLancamento >= '2015-01-01'; 

SELECT * FROM jogo WHERE nome LIKE '%a%' AND midia = 'Física'; 

SELECT * FROM jogo WHERE diretor NOT LIKE '%e%'; 

ALTER TABLE jogo  
	ADD CONSTRAINT chNota  
		CHECK(nota >= 0 AND nota <= 10); 

SELECT * FROM jogo WHERE genero = 'Terror' AND quantidade >= 1; 

UPDATE jogo SET quantidade = '0' WHERE id = 1; 

DELETE FROM jogo WHERE id = 1; 

ALTER TABLE jogo RENAME COLUMN diretor TO criador; 

SELECT * FROM jogo; 


-- EXERCÍCIO 2 

CREATE TABLE esporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    numeroJogadores INT,
    estreia DATE,
    pais_origem VARCHAR(30),
    CONSTRAINT chk_categoria 
        CHECK (categoria IN ('Individual', 'Coletivo'))
); 

INSERT INTO esporte (nome, categoria, numeroJogadores, estreia, pais_origem) VALUES 
('Futebol', 'Coletivo', 11, '1900-09-22', 'Inglaterra'),
('Basquete', 'Coletivo', 5, '1936-08-07', 'Estados Unidos'),
('Vôlei', 'Coletivo', 6, '1964-10-10', 'Estados Unidos'),
('Tênis', 'Individual', 1, '1896-04-06', 'Inglaterra'),
('Judô', 'Individual', 1, '1964-10-10', 'Japão');

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL (3,1) 
CONSTRAINT ch_popularidade
	CHECK (popularidade >= 0 AND popularidade <= 10);
        
DESCRIBE esporte;

UPDATE esporte SET popularidade = 10
WHERE id = 1;

UPDATE esporte SET popularidade = '7.5'
WHERE id = 2;

UPDATE esporte SET popularidade = '8.5'
WHERE id = 3;

UPDATE esporte SET popularidade = '5'
WHERE id = 4;

UPDATE esporte SET popularidade = '7'
WHERE id = 5;

SELECT * FROM esporte;

SELECT * FROM esporte ORDER BY popularidade ASC;

SELECT * FROM esporte WHERE estreia >= '2000-01-01';

ALTER TABLE esporte
ADD CONSTRAINT ch_estreia
CHECK (estreia >= '1896-04-06' AND estreia <= '2026-02-03');

ALTER TABLE esporte DROP CONSTRAINT chk_categoria;

SELECT * FROM esporte WHERE pais_origem LIKE '_a%';

SELECT * FROM esporte WHERE numeroJogadores >= 4 AND numeroJogadores <= 11;

DELETE FROM esporte 
WHERE id in (1, 3, 5);

SELECT * FROM esporte;

-- EXERCÍCIO 3
CREATE TABLE desenho_animado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    data_lancamento DATE,
    emissora_original VARCHAR(50),
    classificacao VARCHAR(20),
    statusDesenho VARCHAR(15),
    nota INT,
    CONSTRAINT chk_nota CHECK (nota BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10;



INSERT INTO desenho_animado (titulo, data_lancamento, emissora_original, classificacao, statusDesenho, nota) VALUES
('Bob Esponja', '1999-05-01', 'Nickelodeon', 'Livre', 'Exibindo', 5),
('Os Simpsons', '1989-12-17', 'Fox', '12 anos', 'Exibindo', 5),
('Hora de Aventura', '2010-04-05', 'Cartoon Network', '10 anos', 'Finalizado', 4),
('Dragon Ball Z', '1989-04-26', 'Fuji TV', '10 anos', 'Finalizado', 5),
('Peppa Pig', '2004-05-31', 'Channel 5', 'Livre', 'Exibindo', 3),
('Caverna do Dragao', '1983-09-17', 'CBS', 'Livre', 'Finalizado', 4);

SELECT * FROM desenho_animado;

SELECT * FROM desenho_animado WHERE classificacao <= 10;

SELECT * FROM desenho_animado WHERE emissora_original = 'Nickelodeon';


ALTER TABLE desenho_animado 
ADD CONSTRAINT ch_status
CHECK (statusDesenho IN ('Exibindo', 'Finalizado', 'Cancelado')); 

UPDATE desenho_animado SET statusDesenho = 'Finalizado'
WHERE id IN (12, 15);

DELETE FROM desenho_animado WHERE id = 12;

SELECT * FROM desenho_animado WHERE titulo LIKE 'D%';

ALTER TABLE desenho_animado RENAME COLUMN classificacao TO classificacaoIndicativa;

UPDATE desenho_animado SET nota = '4'
WHERE id = 11;

UPDATE desenho_animado SET data_lancamento = '1989-12-18'
WHERE id = 11;

TRUNCATE desenho_animado;

ALTER TABLE desenho_animado DROP CONSTRAINT ch_status;

SELECT * FROM desenho_animado;

-- EXERCÍCIO 4
CREATE TABLE misteriosSa (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    data_compra DATE,
    preco DECIMAL (4,2),
    peso DECIMAL (5,2),
    dataRetirada DATE
);

INSERT INTO misterioSa
(nome, data_compra, preco, peso) VALUES
('Arroz 500g', '2026-03-01', 28.90, 500.0),
('Feijão 500g', '2026-03-02', 8.50, 500.0),
('Macarrão 500g', '2026-03-03', 4.75, 500.0),
('Peito de Frango', '2026-03-04', 18.30, 250.0),
('Leite Integral 1L', '2026-03-05', 5.20, 600,0);

SELECT nome, data_compra, data_retirada, id FROM misteriosSA ORDER BY data_compra;

UPDATE misteriosSA SET data_retirada = '2026-03-04' WHERE id =  1;

ALTER TABLE misteriosSA RENAME COLUMN id TO id_comida;

ALTER TABLE misteriosSA ADD CONSTRAINT chNome CHECK (nome IN ('Biscoitos Scooby', 'Cachorro quente'));

SELECT data_compra AS Data_da_compra,
data_retirada AS Data_da_retirada
FROM misteriosSA WHERE nome = 'Biscoitos Scooby';

SELECT * FROM misteriosSA WHERE data_compra < '2024-08-25';

SELECT * FROM misteriosSA WHERE preco >= 30.50;

TRUNCATE misteriosSA;

CREATE DATABASE vingadores;

CREATE TABLE heroi (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
versao VARCHAR(45),
habilidade VARCHAR(45),
altura INT
);

INSERT INTO heroi
(nome, versao, habilidade, altura) VALUES
('Homem de Ferro', 'Vingadores: Ultimato', 'Inteligência e Armadura Tecnológica', 185),
('Doutor Estranho', 'Doutor Estranho 2', 'Magia e Manipulação do Tempo', 183),
('Thor', 'Thor: Ragnarok', 'Controle do Trovão', 198),
('Capitão América', 'Guerra Civil', 'Força e Liderança Estratégica', 188),
('Feiticeira Escarlate', 'WandaVision', 'Manipulação da Realidade', 170);

SELECT * FROM heroi;

ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

DELETE FROM heroi WHERE id = 3;

INSERT INTO heroi VALUES 
(DEFAULT, 'Batman', 'Batman Vs Superman', 'Inteligência, Armadura, Luta', 175, TRUE);

SELECT * FROM heroi WHERE nome LIKE 'C%' OR 'H%';

SELECT * FROM heroi WHERE nome NOT LIKE '%a%' OR '%A%';

SELECT nome FROM heroi WHERE altura > 190;

SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

TRUNCATE heroi;