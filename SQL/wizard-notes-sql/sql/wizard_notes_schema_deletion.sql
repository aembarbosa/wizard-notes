-- Deletar todos os dados da tabela notes
DELETE FROM notes;

-- Deletar todos os dados da tabela users
DELETE FROM users;

-- Deletando procedimento de "inserção de notas em cada usuário"
DROP PROCEDURE IF EXISTS InsertAllNotesForEachUser;

-- Deletando trigger
DROP TRIGGER IF EXISTS validate_user_insertion_trigger;

-- Removendo tabelas notes e users
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS users;
