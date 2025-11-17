CREATE DATABASE gestao_pedidos;
USE gestao_pedidos;

CREATE TABLE clientes (
    codigo_cliente INT PRIMARY KEY,
    nome_completo VARCHAR(400),
    endereco_completo VARCHAR(200),
    uf VARCHAR(2),
    municipio VARCHAR(200),
    cep VARCHAR(20)
);

CREATE TABLE pedidos (
    codigo_pedido INT PRIMARY KEY,
    produto VARCHAR(200),
    preco DECIMAL(10,2),
    data_compra DATETIME,
    quantidade INT,
    codigo_cliente INT,
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

INSERT INTO clientes (codigo_cliente, nome_completo, endereco_completo, uf, municipio, cep) VALUES
(1, 'Ana Paula Souza', 'Rua das Flores, 123', 'SP', 'São Paulo', '01001-000'),
(2, 'Carlos Eduardo Lima', 'Av. Brasil, 456', 'RJ', 'Rio de Janeiro', '20040-002'),
(3, 'Fernanda Oliveira', 'Rua da Paz, 789', 'MG', 'Belo Horizonte', '30130-010'),
(4, 'João Pedro Martins', 'Rua Central, 321', 'RS', 'Porto Alegre', '90010-001'),
(5, 'Mariana Costa', 'Rua das Acácias, 55', 'PR', 'Curitiba', '80010-000');

INSERT INTO pedidos (codigo_pedido, produto, data_compra, quantidade, codigo_cliente) VALUES
(101, 'Notebook Dell Inspiron', '2025-08-10 14:30:00', 1, 1),
(102, 'Smartphone Samsung Galaxy', '2025-08-11 09:15:00', 2, 2),
(103, 'Fone de Ouvido JBL', '2025-08-12 16:45:00', 3, 3),
(104, 'Monitor LG 24"', '2025-08-13 11:00:00', 1, 4),
(105, 'Teclado Mecânico Redragon', '2025-08-14 17:24:00', 2, 5);

ALTER TABLE pedidos ADD COLUMN preco DECIMAL(10,2);

UPDATE pedidos SET preco = 4500.00 WHERE codigo_pedido = 101;
UPDATE pedidos SET preco = 3800.00 WHERE codigo_pedido = 102;
UPDATE pedidos SET preco = 350.00 WHERE codigo_pedido = 103;
UPDATE pedidos SET preco = 950.00 WHERE codigo_pedido = 104;
UPDATE pedidos SET preco = 420.00 WHERE codigo_pedido = 105;

SELECT c.nome_completo, c.codigo_cliente, p.codigo_pedido, p.produto 
FROM clientes c
INNER JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente;

SELECT c.nome_completo, c.codigo_cliente, p.codigo_pedido, p.produto 
FROM clientes c
LEFT JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente;

SELECT c.nome_completo, c.codigo_cliente, p.codigo_pedido, p.produto 
FROM clientes c
RIGHT JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente;

SELECT codigo_cliente, COUNT(*) as total_pedidos 
FROM pedidos 
GROUP BY codigo_cliente;

SELECT codigo_cliente, produto, preco, COUNT(*) as total_pedidos 
FROM pedidos 
GROUP BY codigo_cliente, produto, preco
ORDER BY preco DESC;