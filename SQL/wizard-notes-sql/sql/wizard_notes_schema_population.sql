-- Insercao de novo usuario na tabela users
INSERT INTO users (username, full_name, password)
VALUES ('alyne_barbosa', 'Alyne Barbosa', '12345');

INSERT INTO users (username, full_name, password) VALUES
('aragorn', 'Aragorn Elessar', 'senha1'),
('arwen', 'Arwen Undómiel', 'senha2'),
('legolas', 'Legolas Greenleaf', 'senha3'),
('gimli', 'Gimli son of Glóin', 'senha4'),
('frodo', 'Frodo Baggins', 'senha5'),
('samwise', 'Samwise Gamgee', 'senha6'),
('gandalf', 'Gandalf the Grey', 'senha7'),
('galadriel', 'Galadriel', 'senha8'),
('boromir', 'Boromir', 'senha9'),
('meriadoc', 'Meriadoc Brandybuck', 'senha10');

INSERT INTO users (username, full_name, password) VALUES
('john_doe', 'John Doe', 'senha1'),
('jane_smith', 'Jane Smith', 'senha2'),
('alex_miller', 'Alex Miller', 'senha3'),
('lisa_jones', 'Lisa Jones', 'senha4'),
('michael_brown', 'Michael Brown', 'senha5'),
('sara_wilson', 'Sara Wilson', 'senha6'),
('david_clark', 'David Clark', 'senha7'),
('emily_martin', 'Emily Martin', 'senha8'),
('ryan_taylor', 'Ryan Taylor', 'senha9'),
('natalie_carter', 'Natalie Carter', 'senha10'),
('daniel_cooper', 'Daniel Cooper', 'senha11'),
('amanda_robinson', 'Amanda Robinson', 'senha12'),
('steven_hall', 'Steven Hall', 'senha13'),
('olivia_young', 'Olivia Young', 'senha14'),
('matthew_king', 'Matthew King', 'senha15'),
('laura_wright', 'Laura Wright', 'senha16'),
('adam_garcia', 'Adam Garcia', 'senha17'),
('hannah_morris', 'Hannah Morris', 'senha18'),
('kevin_ross', 'Kevin Ross', 'senha19'),
('jessica_perez', 'Jessica Perez', 'senha20');

-- Criar procedimento armazenado (stored procedure) para inserir 15x5 notas para cada usuario
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS InsertAllNotesForEachUser()
BEGIN
    DECLARE user_not_found INT DEFAULT 0;
    DECLARE user_id_value INT;
    DECLARE user_full_name VARCHAR(255);
    DECLARE i INT;

    -- Iterar sobre os id dos usuarios
    DECLARE user_cursor CURSOR FOR SELECT id, full_name FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_not_found = 1;

    -- Adicionando manipulador para exceções SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
           SHOW ERRORS;
        END;

    OPEN user_cursor;

    user_loop: LOOP
        FETCH user_cursor INTO user_id_value, user_full_name;

        IF user_not_found = 1 THEN
            LEAVE user_loop;
        END IF;

        -- Sair do loop quando nao houver mais usuarios
        IF user_full_name IS NULL THEN
            ITERATE user_loop;
        END IF;

        -- Inserir 15 notas para o usuario atual com o full_name
        SET i = 1;
        WHILE i <= 15 DO
            INSERT INTO notes (title, message, user_id)
                VALUES
                      (CONCAT('Nota ', i, ' - Experiência Gastronômica - ', user_full_name),
                       IF(i % 2 = 0, NULL, CONCAT('Hoje experimentei uma deliciosa receita. Recomendo! - ', user_full_name)),
                       user_id_value),
                      (CONCAT('Nota ', i, ' - Viagem Inesquecível - ', user_full_name),
                       IF(i % 3 = 0, 'A viagem foi incrível! Paisagens deslumbrantes e pessoas maravilhosas.', NULL),
                       user_id_value),
                      (CONCAT('Nota ', i, ' - Livro do Momento - ', user_full_name),
                       CONCAT('Estou completamente envolvido pelo livro que estou lendo! Recomendo a todos - ', user_full_name),
                       user_id_value),
                      (CONCAT('Nota ', i, ' - Reflexões Noturnas - ', user_full_name),
                       CONCAT('À noite, costumo refletir sobre as coisas importantes da vida. - ', user_full_name),
                       user_id_value),
                      (CONCAT('Nota ', i, ' - Momento de Silêncio - ', user_full_name),
                       IF(i % 5 = 0, '', CONCAT('Hoje tive um momento de silêncio e paz. - ', user_full_name)),
                       user_id_value);
            SET i = i + 1;
        END WHILE;
    END LOOP;

    CLOSE user_cursor;
END //

DELIMITER ;

-- Chamar o procedimento armazenado (stored procedure) para inserir 15xX notas para cada usuario
CALL InsertAllNotesForEachUser();


INSERT INTO users (username, full_name, password) VALUES
('USERNAME', 'usuario_teste', 'senha_maiusculo');

-- Entradas de usuários inválidos
# INSERT INTO users (username, full_name, password) VALUES
# ('LongUsername123WithVariousCharactersAndNumbers7890AndSymbolsUnderScore_HyphenLongUsername123WithVariousCharactersAndNumbers7890And', 'usuario_teste', 'senha_username_excedente');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('', 'usuario_teste', 'senhavazio');
#
# INSERT INTO users (username, full_name, password) VALUES
# (' ', 'usuario_teste', 'senhavazio');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('123numerico', 'usuario_teste', 'senhanumerico');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('space User', 'usuario_teste', 'senha_espaco_branco');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('@adminMaster', 'usuario_teste', 'senhaqualquer');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('user$Master', 'usuario_teste', '123456');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('user.Name', 'usuario_teste', '123senha456');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('açai', 'usuario_teste', 'amoacai');
#
# INSERT INTO users (username, full_name, password) VALUES
# ('índio', 'usuario_teste', 'tupiguarani');

SELECT * FROM users WHERE full_name = 'usuario_teste';

SELECT * FROM users WHERE username = '';
SELECT * FROM users WHERE username = '123numerico';
SELECT * FROM users WHERE username = 'LongUsername123WithVariousCharactersAndNumbers7890AndSymbolsUnderScore_HyphenLongUsername123WithVariousCharactersAndNumbers7890And';
SELECT * FROM users WHERE username = 'space User';
SELECT * FROM users WHERE username = '@adminMaster';
SELECT * FROM users WHERE username = 'user$Master';
SELECT * FROM users WHERE username = 'user.Name';
SELECT * FROM users WHERE username = 'USERNAME';
SELECT * FROM users WHERE username = 'açai';
SELECT * FROM users WHERE username = 'índio';

SELECT * FROM users;