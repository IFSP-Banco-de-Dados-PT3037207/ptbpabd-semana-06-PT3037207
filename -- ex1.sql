-- ex1

-- Para criarmos precisamos entrar na master
CREATE LOGIN User_A WITH PASSWORD = 'SuaSenhaForte123!';
CREATE LOGIN User_B WITH PASSWORD = 'SuaSenhaForte123!';
CREATE LOGIN User_C WITH PASSWORD = 'SuaSenhaForte123!';
CREATE LOGIN User_D WITH PASSWORD = 'SuaSenhaForte123!';
CREATE LOGIN User_E WITH PASSWORD = 'SuaSenhaForte123!';

-- Aqui criamos o usuario no banco 
CREATE USER User_A FOR LOGIN User_A;
CREATE USER User_B FOR LOGIN User_B;
CREATE USER User_C FOR LOGIN User_C;
CREATE USER User_D FOR LOGIN User_D;
CREATE USER User_E FOR LOGIN User_E;

-- ex 2

-- Concede a permissão de ler e adicionar/alterar para o User_a, com a opção de repasse
GRANT SELECT, UPDATE TO User_A WITH GRANT OPTION;

-- Nega a permissão de ler e adicionar/alterar do User)a, apenas no dbo.classroom
DENY SELECT, UPDATE ON dbo.classroom TO User_A;

-- ex 3
SELECT 
    pr.name AS [Usuário], 
    pe.permission_name AS [Permissão], 
    pe.state_desc AS [Estado], 
    -- Função para aparecer os nomes das tabelas ao inves dos ids
    OBJECT_NAME(pe.major_id) AS [Tabela] 
FROM sys.database_permissions pe
-- pr é a tabela que sabe traduzir os ids pra nomes
-- então o join vai ser pra dar um match no grantee que sabe os privilegios de um id
-- e o principal_id, que sabe qual o nome desse id
JOIN sys.database_principals pr ON pe.grantee_principal_id = pr.principal_id
-- o where vai filtrar pra vir apenas os User_A
WHERE pr.name = 'User_A'
-- e o order by vai ordenar do privilegio mais alto pro menor
ORDER BY pe.state_desc DESC;
