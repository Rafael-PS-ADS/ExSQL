CREATE DATABASE sistema_vendas;
USE sistema_vendas;

CREATE TABLE pedidos (
    codigo_pedido INT PRIMARY KEY,
    numero_pedido INT NOT NULL,
    descricao_pedido VARCHAR(200),
    data_pedido DATETIME
);

CREATE TABLE clientes (
    codigo_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(200),
    codigo_endereco INT NOT NULL,
    rua VARCHAR(200),
    numero INT NOT NULL,
    cidade VARCHAR(200),
    estado VARCHAR(2),
    codigo_pedido INT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (codigo_pedido) REFERENCES pedidos(codigo_pedido)
);

INSERT INTO pedidos (codigo_pedido, numero_pedido, descricao_pedido, data_pedido) VALUES
(1, 1001, 'Pedido do João', '2025-08-17 10:30:00'),
(2, 1002, 'Pedido da Maria', '2025-08-17 11:00:00'),
(3, 1003, 'Pedido do Carlos', '2025-08-17 12:15:00'),
(4, 1004, 'Pedido da Ana', '2025-08-17 13:45:00'),
(5, 1005, 'Pedido da Fernanda', '2025-08-17 14:20:00');

INSERT INTO clientes (codigo_cliente, codigo_endereco, rua, numero, cidade, estado) VALUES
(1, 101, 'Rua das Flores', 123, 'São Paulo', 'SP'),
(2, 102, 'Avenida Brasil', 456, 'Rio de Janeiro', 'RJ'),
(3, 103, 'Praça da Liberdade', 789, 'Belo Horizonte', 'MG'),
(4, 104, 'Rua do Comércio', 321, 'Curitiba', 'PR'),
(5, 105, 'Alameda Santos', 654, 'São Paulo', 'SP');

UPDATE clientes SET nome_cliente = 'João Silva' WHERE codigo_cliente = 1;
UPDATE clientes SET nome_cliente = 'Maria Oliveira' WHERE codigo_cliente = 2;
UPDATE clientes SET nome_cliente = 'Carlos Souza' WHERE codigo_cliente = 3;
UPDATE clientes SET nome_cliente = 'Ana Lima' WHERE codigo_cliente = 4;
UPDATE clientes SET nome_cliente = 'Fernanda Costa' WHERE codigo_cliente = 5;

SELECT * FROM clientes;
SELECT * FROM clientes ORDER BY nome_cliente;
SELECT * FROM clientes ORDER BY nome_cliente DESC;
SELECT * FROM clientes WHERE codigo_cliente IN (1, 4, 5);
SELECT * FROM clientes WHERE codigo_cliente NOT IN (1, 4, 5);