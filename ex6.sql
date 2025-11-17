CREATE DATABASE sistema_usuarios;
USE sistema_usuarios;

CREATE TABLE usuarios (
    cpf VARCHAR(11) PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_registro DATETIME NOT NULL
);

INSERT INTO usuarios (cpf, nome_completo, email, data_registro) VALUES
('12345678901', 'Ana Souza', 'ana.souza@email.com', '2025-09-22'),
('98765432100', 'Carlos Lima', 'carlos.lima@email.com', '2025-09-20'),
('11122233344', 'João Silva', 'joao.silva@email.com', '2025-09-19');

DELIMITER $$ 
CREATE PROCEDURE listar_usuarios()
BEGIN
    SELECT cpf, nome_completo, email, data_registro
    FROM usuarios;
END $$ 
DELIMITER ;

CALL listar_usuarios();

DELIMITER $$
CREATE PROCEDURE inserir_usuario(
    IN p_cpf VARCHAR(11), 
    IN p_nome VARCHAR(100), 
    IN p_email VARCHAR(100), 
    IN p_data_registro DATETIME
)
BEGIN
    IF(p_cpf IS NOT NULL AND p_nome IS NOT NULL AND p_email IS NOT NULL AND p_data_registro IS NOT NULL) THEN
        INSERT INTO usuarios (cpf, nome_completo, email, data_registro) 
        VALUES (p_cpf, p_nome, p_email, p_data_registro);
        SELECT 'Usuário cadastrado com sucesso' as mensagem;
    ELSE
        SELECT 'Erro: Todos os campos são obrigatórios' as mensagem;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE consultar_usuario(IN p_cpf VARCHAR(11))
BEGIN
    IF (p_cpf IS NOT NULL) THEN
        SELECT cpf, nome_completo, email, data_registro 
        FROM usuarios 
        WHERE cpf = p_cpf;
    ELSE
        SELECT cpf, nome_completo, email, data_registro 
        FROM usuarios;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE excluir_usuario(IN p_cpf VARCHAR(11))
BEGIN
    IF (p_cpf IS NOT NULL) THEN
        DELETE FROM usuarios WHERE cpf = p_cpf;
        SELECT 'Usuário removido com sucesso' as mensagem;
    ELSE
        SELECT 'Erro: CPF não informado' as mensagem;
    END IF;
END $$
DELIMITER ;

CALL inserir_usuario('03478956212', 'Roger Almeida', 'roger@email.com', '2025-12-05');
CALL consultar_usuario('12345678901');
CALL excluir_usuario('12345678901');