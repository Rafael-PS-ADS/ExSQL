CREATE DATABASE calculos;
USE calculos;

DELIMITER $$
CREATE PROCEDURE calculadora (
    IN numero1 DECIMAL, 
    IN operador CHAR(1), 
    IN numero2 DECIMAL
)
BEGIN 
    DECLARE resultado DECIMAL;
    
    IF operador = '+' THEN 
        SET resultado = numero1 + numero2;
        SELECT CONCAT('Resultado: ', resultado) as resultado;
    ELSEIF operador = '-' THEN 
        SET resultado = numero1 - numero2;
        SELECT CONCAT('Resultado: ', resultado) as resultado;    
    ELSEIF operador = '*' THEN 
        SET resultado = numero1 * numero2;
        SELECT CONCAT('Resultado: ', resultado) as resultado;
    ELSEIF operador = '/' THEN
        IF numero2 != 0 THEN 
            SET resultado = numero1 / numero2;
            SELECT CONCAT('Resultado: ', resultado) as resultado;
        ELSE
            SELECT 'Erro: Divisão por zero!' as resultado;
        END IF;
    ELSE 
        SELECT 'Operação inválida! Use +, -, * ou /' as resultado;
    END IF;    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE calcular_media (
    IN nota1 DECIMAL(5,2), 
    IN nota2 DECIMAL(5,2), 
    IN nota3 DECIMAL(5,2), 
    IN nota4 DECIMAL(5,2)
)
BEGIN 
    DECLARE media_final DECIMAL(5,2);
    
    IF (nota1 BETWEEN 0 AND 10)
    AND (nota2 BETWEEN 0 AND 10)
    AND (nota3 BETWEEN 0 AND 10)
    AND (nota4 BETWEEN 0 AND 10) THEN
    
        SET media_final = (nota1 + nota2 + nota3 + nota4) / 4;
        SELECT CONCAT('Média final: ', media_final) as resultado;
    ELSE
        SELECT 'Erro: As notas devem estar entre 0 e 10!' as resultado;
    END IF;
END$$    
DELIMITER ;

CALL calculadora(10, '-', 5);
CALL calcular_media(8.0, 7.5, 9.0, 6.5);