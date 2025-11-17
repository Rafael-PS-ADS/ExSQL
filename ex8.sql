CREATE DATABASE sistema_triggers;
USE sistema_triggers;

CREATE TABLE produtos(
    codigo INT PRIMARY KEY,
    nome_produto VARCHAR(200),
    estoque INT
);

CREATE TABLE itens_pedido(
    numero_pedido INT,
    quantidade INT,
    codigo_produto INT,
    CONSTRAINT fk_produto_item FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo)
);

DELIMITER $$
CREATE TRIGGER atualizar_estoque AFTER INSERT ON itens_pedido 
FOR EACH ROW 
BEGIN 
    DECLARE produto_codigo INT;
    DECLARE qtd_vendida INT;
    
    SET produto_codigo = NEW.codigo_produto;
    SET qtd_vendida = NEW.quantidade;
    
    IF (produto_codigo IS NOT NULL AND qtd_vendida IS NOT NULL) THEN 
        UPDATE produtos
        SET estoque = estoque - qtd_vendida
        WHERE codigo = produto_codigo;
    END IF;
END $$
DELIMITER ;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100),
    email_usuario VARCHAR(100),
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE log_usuarios (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nome_usuario VARCHAR(100),
    email_usuario VARCHAR(100),
    acao_realizada VARCHAR(50),
    data_acao DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER log_insercao_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO log_usuarios (id_usuario, nome_usuario, email_usuario, acao_realizada)
    VALUES (NEW.id, NEW.nome_usuario, NEW.email_usuario, 'CADASTRO');
END$$
DELIMITER ;

CREATE TABLE produtos_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco_venda DECIMAL(10,2)
);

DELIMITER $$
CREATE TRIGGER ajuste_preco_insercao
BEFORE INSERT ON produtos_venda
FOR EACH ROW
BEGIN
    SET NEW.preco_venda = NEW.preco_venda * 1.10;
END$$
DELIMITER ;

CREATE TABLE produtos_atualizacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco_venda DECIMAL(10,2)
);

DELIMITER $$
CREATE TRIGGER ajuste_preco_atualizacao
BEFORE UPDATE ON produtos_atualizacao
FOR EACH ROW
BEGIN
    SET NEW.preco_venda = NEW.preco_venda * 1.30;
END$$
DELIMITER ;

INSERT INTO produtos_venda (nome_produto, preco_venda) VALUES ('Teclado Gamer', 100.00);
INSERT INTO usuarios (nome_usuario, email_usuario) VALUES ('Maria Oliveira', 'maria@email.com');

SELECT * FROM produtos_venda;
SELECT * FROM log_usuarios;