CREATE DATABASE comercio;
USE comercio;

CREATE TABLE produtos (
    codigo_item INT PRIMARY KEY,
    descricao_item VARCHAR(255) NOT NULL,
    tipo_unidade VARCHAR(10) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendedores (
    codigo_vendedor INT PRIMARY KEY,
    nome_vendedor VARCHAR(100) NOT NULL,
    nivel_comissao VARCHAR(10) NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL
);

INSERT INTO produtos (codigo_item, descricao_item, tipo_unidade, preco_unitario) VALUES 
(101, 'Caneta Azul', 'UN', 2.50),
(102, 'Caderno Espiral 100 folhas', 'UN', 12.90),
(103, 'Pacote de Papel A4 500 folhas', 'PC', 28.75);

INSERT INTO vendedores (codigo_vendedor, nome_vendedor, nivel_comissao, salario_base) VALUES 
(201, 'Ana Souza', 'A', 2500.00),
(202, 'Carlos Lima', 'B', 2200.00),
(203, 'Fernanda Rocha', 'C', 2000.00);

CREATE VIEW produtos_unidade (codigo, descricao, unidade) AS 
SELECT codigo_item, descricao_item, tipo_unidade
FROM produtos
WHERE tipo_unidade = 'UN';

CREATE VIEW salario_anual (codigo, nome, salario_anual) AS
SELECT codigo_vendedor, nome_vendedor, (salario_base * 12)
FROM vendedores;

SELECT * FROM produtos_unidade;
SELECT * FROM salario_anual;

SELECT nome, salario_anual
FROM salario_anual
WHERE salario_anual > 20000;

CREATE VIEW produtos_view AS
SELECT * FROM produtos;

INSERT INTO produtos_view VALUES (110, 'Caneta Bic', 'UN', 2.50);
UPDATE produtos_unidade SET descricao = 'Caneta Faber Castel' WHERE codigo = 110;

SELECT * FROM produtos_unidade;
SELECT * FROM produtos;