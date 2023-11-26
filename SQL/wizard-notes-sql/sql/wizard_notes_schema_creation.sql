-- Criacao de banco de dados com verificacao de existencia
CREATE DATABASE IF NOT EXISTS wizard_notes_schema CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

-- Selecao do BD recem criado
USE wizard_notes_schema;

-- Criacao da tabela users com verificacao de existencia e especificacao de engine e collation
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    full_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Criacao da tabela notes com verificacao de existencia e especificacao de engine e collation
CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    message TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


-- Comprimento mínimo: 1 caractere UTF-8
-- Comprimento máximo: 128 caracteres UTF-8
-- Deve iniciar com letra ou underscore (_)
-- Só deve aceitar caracteres alfanuméricos e underscore (_)
-- Não deve haver caracteres especiais, ou seja, caracteres devem ter sido sanitizados
-- Aceitar apenas letras minúsculas.

CREATE TRIGGER IF NOT EXISTS validate_user_insertion_trigger
BEFORE INSERT ON users FOR EACH ROW
BEGIN
    IF NOT (NEW.username REGEXP '^[a-z_][a-z0-9_]{0,127}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'USER VALIDATION FIELD: USERNAME MUST NOT CONTAIN SPECIAL CHARACTERS EXCEPT UNDERSCORE';
    END IF;
    SET NEW.username = LOWER(NEW.username);
END;

