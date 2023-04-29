CREATE DATABASE IF NOT EXISTS db_less6;
USE db_less6;
DROP FUNCTION IF EXISTS even_out;
# Задание 2.
DELIMITER //
CREATE FUNCTION even_out() RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE result VARCHAR(50) DEFAULT '';
    
	WHILE i < 12 DO
		SET result = CONCAT_WS(' ', result, i);
		SET i = i + 2;
	END WHILE;

	RETURN result;
END //

SELECT even_out() AS result;
