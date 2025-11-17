CREATE DATABASE rh_empresa;
USE rh_empresa;

CREATE TABLE funcionarios (
    registro INT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    funcao VARCHAR(50) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL
);

INSERT INTO funcionarios (registro, nome_funcionario, funcao, setor, salario_base) VALUES
(301, 'Marcos Silva', 'Analista de Sistemas', 'TI', 4800.00),
(302, 'Juliana Costa', 'Assistente Administrativo', 'Financeiro', 3200.00),
(303, 'Rafael Torres', 'Gerente de Projetos', 'TI', 7500.00),
(304, 'Beatriz Almeida', 'Coordenadora de RH', 'Recursos Humanos', 6200.00),
(305, 'Lucas Pereira', 'Estagiário', 'Marketing', 1500.00);

DELIMITER $$
CREATE FUNCTION calcular_aumento(salario_atual DECIMAL(10,2), percentual_aumento DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_atual * (percentual_aumento / 100);
END$$
DELIMITER ;

SELECT calcular_aumento(4800, 5.54) as valor_aumento;

DROP FUNCTION calcular_aumento;