use wizard_notes_schema;
-- 1. Listar todos os unuários
SELECT username FROM users;

-- 2. Listar todas as notas
SELECT title FROM notes;

-- 3. Listar quantidade de usuários
SELECT COUNT(id) FROM users;

-- 4. Listar quantidade de notas
SELECT COUNT(title) FROM notes;

-- 5. Listar apenas usernames dos usuários
SELECT username FROM users;

-- 6. Listar todos os títulos das notas
SELECT title FROM notes;

-- 7. Listar dados dos usuários se existir algum com username "aragorn"
SELECT id, username, full_name, password FROM users WHERE username = 'aragorn';

-- 8. Listar dados dos usuários com username chamado "r2d2"
SELECT id, username, full_name, password FROM users WHERE username = 'r2d2';

-- 9. Listar todos os usuários que username comece com letra "a"
SELECT * FROM users WHERE username LIKE 'a%';

-- 10. Listar todos os usuários que username comece com letra "s"
SELECT * FROM users WHERE username LIKE 's%';

-- 11. Listar todos os usuários que contenham "r" no username
SELECT * FROM users WHERE username LIKE '%r%';

-- 12. Listar todos os usuários que contenham "ri" no username
SELECT * FROM users WHERE username LIKE '%ri%';

-- 13. Listar todos os usuários cujo username termine com "n"
SELECT * FROM users WHERE username LIKE '%n';

-- 14. Listar todos os usuários cujo username tenha tamanho 5
SELECT username, CHAR_LENGTH(username) AS tamanho_username_5 FROM users WHERE CHAR_LENGTH(username) = 5;

-- 15. Listar todos os usuários cujo username seja <= 8
SELECT username, CHAR_LENGTH(username) AS tamanho_username_menor_igual_8 FROM users WHERE CHAR_LENGTH(username) <= 8;

-- 16. Listar todos os usuários cujo username seja > 8
SELECT username, CHAR_LENGTH(username) AS tamanho_username_menor_8 FROM users WHERE CHAR_LENGTH(username) < 8;

-- 17. Listar todos os usuários cujo username só contenha um nome
SELECT username FROM users
WHERE CHAR_LENGTH(username) = CHAR_LENGTH(REPLACE(username, '_', ''));

-- 18. Listar a quantidade de usuários que só possuem um nome
SELECT COUNT(id) FROM users
WHERE CHAR_LENGTH(full_name) = CHAR_LENGTH(REPLACE(full_name, ' ', ''));

-- 19. Listar todos os usuários cujo nome completo contenha até dois nomes
SELECT username, full_name FROM users
WHERE CHAR_LENGTH(full_name) - CHAR_LENGTH(REPLACE(full_name, ' ', '')) <= 1;

-- 20. Listar a quantidade de usuários que possuem até dois nomes
SELECT COUNT(id) FROM users
WHERE CHAR_LENGTH(full_name) - CHAR_LENGTH(REPLACE(full_name, ' ', '')) <= 1;

-- 21. Listar usuários que contenham 3 ou mais nomes
SELECT username, full_name FROM users
WHERE CHAR_LENGTH(full_name) - CHAR_LENGTH(REPLACE(full_name, ' ', '')) >= 2;

-- 22. Listar a quantidade de usuários que possuem 3 ou mais nomes
SELECT COUNT(username) FROM users
WHERE CHAR_LENGTH(full_name) - CHAR_LENGTH(REPLACE(full_name, ' ', '')) >= 2;

-- 23. Listar todas as notas do username "aragorn"
SELECT title, message FROM users, notes
WHERE users.id = notes.user_id
AND username = 'aragorn';

-- 24. Listar todas as notas do username "alyne_barbosa"
SELECT title, message FROM notes, users
WHERE notes.user_id = users.id
AND username = 'alyne_barbosa';

-- 25. Listar quantidade de notas do usuário "aragorn"
SELECT COUNT(title) FROM notes, users
WHERE notes.user_id = users.id
AND username = 'aragorn';

-- 26. Listar todas as notas das pessoas que começam com "ga" no nome, independente de ser ou não maiúscula
SELECT username, title, message FROM notes, users
WHERE notes.user_id = users.id
AND username LIKE 'ga%';

-- 27. Listar todos os nomes completos em letra maiúscula
SELECT UPPER(full_name) AS username_upper FROM users;

-- 28. Listar todos os nomes completos em letra minúscula
SELECT LOWER(full_name) AS username_lower FROM users;

-- 29. Listar todas as notas que possuem mensagem vazia
SELECT title FROM notes WHERE message = '';

-- 30. Listar todas as notas que possuem mensagem NULL
SELECT title FROM notes WHERE message NOT LIKE '%_%';

SELECT title FROM notes WHERE message IS NULL;

-- 31. Listar o nome completo e a quantidade de letras do nome completo de todos os usuários
SELECT full_name, CHAR_LENGTH(REPLACE(full_name, ' ', '')) AS length_full_name FROM users;

-- 32. Listar o menor nome de usuário (username)
SELECT username FROM users WHERE CHAR_LENGTH(username) = (SELECT MIN(CHAR_LENGTH(username)) FROM users) ;

-- 33. Listar o maior nome de usuário (username)
SELECT username FROM users WHERE CHAR_LENGTH(username) = (SELECT MAX(CHAR_LENGTH(username)) FROM users);

-- 34. Listar o menor nome de nome completo (full_name)
SELECT full_name FROM users ORDER BY CHAR_LENGTH(full_name) LIMIT 1;

SELECT full_name FROM users WHERE CHAR_LENGTH(full_name) = (SELECT MIN(CHAR_LENGTH(full_name)) FROM users);

-- 35. Listar o maior nome de nome completo (full_name)
SELECT full_name FROM users ORDER BY CHAR_LENGTH(full_name) DESC LIMIT 1;

SELECT full_name FROM users WHERE CHAR_LENGTH(full_name) = (SELECT MAX(CHAR_LENGTH(full_name)) FROM users);

-- 36. Listar todos os nomes de usuários que contenham "_"
-- O caractere de escape \ vai garantir que o _ seja tratado como um caractere literal e não como um curinga
SELECT username FROM users WHERE username LIKE '%\_%';

-- 37. Listar todos os nomes de username que comece e termine com mesma letra
-- LEFT(username, 1) retorna a primeira letra do username
-- RIGHT(username, 1) retorna a última letra do username
-- a cláusula WHERE compara se a primeira letra é igual à última letra
SELECT username FROM users
WHERE LEFT(username, 1) = RIGHT(username, 1);

-- 38. Listar todos os nomes de username que comece e termine com letra "a"
SELECT username FROM users WHERE username LIKE 'a%' AND username LIKE '%a';

SELECT username FROM users WHERE username LIKE 'a_%a';
SELECT username FROM users WHERE username LIKE 'a%a';

-- 39. Listar todos os usários que lançaram nota contendo "experiência gastronômica" no título
SELECT DISTINCT username FROM users, notes
WHERE users.id = notes.user_id
AND notes.title LIKE  '%experiência gastronômica%';

-- 40. Listar todos os usuários que possuem alguma nota que contenha "experiência gastronômica" ou "livro do momento"
SELECT DISTINCT username FROM users, notes
WHERE users.id = notes.user_id
AND notes.title LIKE '%experiência gastronômica%' OR '%livro do momento%';

-- 41. Listar todos os usuários que contenham a string "Nota 1" no título
SELECT DISTINCT username FROM users, notes
WHERE users.id = notes.user_id AND title LIKE '%Nota 1%';
