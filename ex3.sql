CREATE DATABASE inventario_produtos;
USE inventario_produtos;

CREATE TABLE produtos (
    codigo_produto INT PRIMARY KEY,
    nome_item VARCHAR(100),
    preco_venda DECIMAL(10,2),
    tipo_categoria VARCHAR(100)
);

INSERT INTO produtos (codigo_produto, nome_item, preco_venda, tipo_categoria) VALUES
(1, 'Smartphone Samsung Galaxy S23', 2899.99, 'Eletrônicos'),
(2, 'Notebook Dell Inspiron 15', 3549.50, 'Informática'),
(3, 'Tablet Apple iPad 10ª geração', 2199.00, 'Eletrônicos'),
(4, 'Fone de Ouvido Sony WH-1000XM4', 1299.90, 'Áudio'),
(5, 'Smart TV LG 55" 4K UHD', 3299.00, 'Televisores'),
(6, 'Câmera Canon EOS R50', 4599.00, 'Fotografia'),
(7, 'Console PlayStation 5', 4499.99, 'Games'),
(8, 'Monitor Gamer AOC 27"', 1899.00, 'Informática'),
(9, 'Mouse Logitech MX Master 3', 499.90, 'Periféricos'),
(10, 'Teclado Mecânico Redragon Kumara', 349.00, 'Periféricos'),
(11, 'Impressora HP LaserJet Pro', 899.00, 'Escritório'),
(12, 'SSD Kingston NV2 1TB', 399.90, 'Componentes'),
(13, 'Smartwatch Apple Watch Series 9', 2899.00, 'Wearables'),
(14, 'Caixa de Som JBL Flip 6', 799.90, 'Áudio'),
(15, 'Processador Intel Core i7', 1899.00, 'Componentes');

SELECT nome_item, COUNT(*) as total_itens
FROM produtos
GROUP BY nome_item;

SELECT nome_item, SUM(preco_venda) as valor_total
FROM produtos
GROUP BY nome_item;

SELECT nome_item, SUM(preco_venda) as valor_total, MIN(preco_venda) as menor_preco
FROM produtos
GROUP BY nome_item;

SELECT nome_item, SUM(preco_venda) as valor_total, MAX(preco_venda) as maior_preco
FROM produtos
GROUP BY nome_item;

SELECT nome_item, AVG(preco_venda) as preco_medio
FROM produtos
GROUP BY nome_item;