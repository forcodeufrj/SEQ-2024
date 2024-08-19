-- Criando nosso banco de dados
DROP DATABASE IF EXISTS for_code;
CREATE DATABASE for_code;
USE for_code;

-- Criando a 1ª tabela
DROP TABLE IF EXISTS apadrinhamento;
CREATE TABLE apadrinhamento (
  membro varchar(50) NOT NULL,
  PRIMARY KEY(membro),
  diretoria_membro text NOT NULL,
  padrinho text NOT NULL,
  diretoria_padrinho text NOT NULL
);

-- Inserção de valores
LOCK TABLES apadrinhamento WRITE;
INSERT INTO apadrinhamento VALUES 
  ('Joao', 'PRO', 'Mariana', 'PRO'),
  ('Rodrigo', 'MKT', 'Anna', 'MKT'),
  ('Bianca', 'PRE', 'Eduarda', 'PRE'),
  ('Renan', 'PRE', 'Eduarda', 'PRE'),
  ('Anna', 'PES', 'Ana', 'PES'),
  ('Vinicius', 'MKT', 'Anna', 'MKT');
UNLOCK TABLES;

-- Checagem de sucesso
SELECT * FROM apadrinhamento;

DROP TABLE IF EXISTS projetos;
CREATE TABLE projetos (
  id_projeto smallint AUTO_INCREMENT NOT NULL,
  nome_projeto text NOT NULL,
  quantidade_membros smallint NOT NULL,
  project_owner text NOT NULL,
  tempo_estimado_mes smallint NOT NULL,
  PRIMARY KEY (id_projeto)
);

LOCK TABLES projetos WRITE;
INSERT INTO projetos VALUES 
  (1, 'C', 5, 'Matheus', 6),
  (2, 'WebScraping', 3, 'Leandro', 5),
  (3, 'OpenFOAM', 2, 'Carlos', 8),
  (4, 'MachineLearning', 4, 'Emanuel', 10),
  (5, 'MySQL', 3, 'Mariana', 7),
  (6, 'Space Invaders', 2, 'Leandro', 6),
  (7, 'POChE', 2, 'Mariana', 4);
UNLOCK TABLES;

DROP TABLE IF EXISTS membros;
CREATE TABLE membros (
  id_membros smallint AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (id_membros),
  membro varchar(20) NOT NULL,
  idade smallint NOT NULL,
  genero text NOT NULL,
  diretoria text NOT NULL,
  id_projeto smallint NOT NULL,
  FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto)
);

LOCK TABLES membros WRITE;
INSERT INTO membros VALUES 
  (1, 'Mariana', 20, 'F', 'PRO', 5),
  (2, 'Ana', 19, 'F', 'PES', 1),
  (3, 'Eduarda', 23, 'F', 'PRE', 7),
  (4, 'Rodrigo', 21, 'M', 'MKT', 5),
  (5, 'Joao', 20, 'M', 'PRO', 5),
  (6, 'Anna Gabriela', 20, 'F', 'MKT', 1),
  (7, 'Lucas', 21, 'M', 'PES', 6),
  (8, 'Carol', 22, 'F', 'PES', 3);
UNLOCK TABLES;

DROP TABLE IF EXISTS pesquisa_satisfacao;
CREATE TABLE pesquisa_satisfacao (
  ordem_preenchimento smallint AUTO_INCREMENT NOT NULL,
  data date DEFAULT NULL,
  diretoria text NOT NULL,
  descricao text NOT NULL,
  PRIMARY KEY (ordem_preenchimento)
);

LOCK TABLES pesquisa_satisfacao WRITE;
INSERT INTO pesquisa_satisfacao VALUES
  (1, '2024-08-12', 'PRO', 'Muito satisfeito'),
  (2, '2024-08-13', 'PES', 'Satisfeito'),
  (3, '2024-08-14', 'MKT', 'Muito satisfeito'),
  (4, '2024-08-12', 'PRO', 'Muito satisfeito'),
  (5, '2024-08-15', 'PRE', 'Pouco satisfeito'),
  (6, '2024-08-13', 'MKT', 'Satisfeito'),
  (7, '2024-08-12', 'PES', 'Muito satisfeito');
UNLOCK TABLES;

DROP TABLE IF EXISTS produtos;
CREATE TABLE produtos (
  id_produto smallint AUTO_INCREMENT NOT NULL,
  nome text NOT NULL,
  fornecedor text NOT NULL,
  id_membro_contatante smallint NOT NULL,
  FOREIGN KEY (id_membro_contatante) REFERENCES membros(id_membros), 
  quantidade smallint NOT NULL,
  preco smallint NOT NULL,
  PRIMARY KEY (id_produto)
);

LOCK TABLES produtos WRITE;
INSERT INTO produtos VALUES 
  (1, 'copos', 'grafica', 1, 50, 15),
  (2, 'camisas', 'grafica', 2, 30, 40),
  (3, 'chaveiro', 'grafica', 3, 20, 20),
  (4, 'adesivos', 'grafica', 1, 40, 5);
UNLOCK TABLES;

-- Exemplos utilizados durante o minicurso !!!!!

-- Mostrar os bancos importados aqui no Workbench
SHOW DATABASES;

-- Estrutura básica da criação de um banco de dados
CREATE DATABASE <nome>;

  -- Exemplo: criando um banco de teste
CREATE DATABASE teste1;

  -- Exemplo: deletando esse banco teste
DROP DATABASE teste1;

-- Adicionando uma tabela dentro de um banco
CREATE TABLE <nome> (<coluna><tipo de dados>)
  -- Exemplo: adicionando uma tabela alunos no banco
USE teste1;
CREATE TABLE alunos(
 id INTEGER NOT NULL,
 nome TEXT NOT NULL,
 idade INTEGER NOT NULL
); 

-- Inserindo dados em uma tabela
INSERT INTO <tabela> VALUES (dado1, dado2…);
  -- exemplo: inserindo um dado na tabela alunos
INSERT INTO alunos VALUES (1, "joao", 20);

-- Comando SELECT
SELECT * FROM <nome da tabela>
  -- select e o comando de selecao 
  -- * seleciona todos os dados
  -- from significa de onde. de onde vc esta selecionando

  -- Exemplo de uso de SELECT
    -- Cláusula SELECT AS 
SELECT id_membro_constante AS id_membro FROM produtos 
    -- Cláusula SELECT LIMIT
SELECT * FROM projetos LIMIT 5;
  
  
-- Funções de agregação (sintaxe)
SELECT [função(ões) de agregação/coluna(s) FROM [tabela(s)]
  -- Exemplo: utilizando MAX
SELECT MAX(preco) FROM produtos;
  -- Exemplo: utilizando SUM
SELECT SUM(preco) FROM produtos
  -- Exemplo: utilizando COUNT
SELECT COUNT(*) FROM membros;
  -- Exemplo: utilizando DISTINCT
SELECT DISTINCT diretoria FROM membros;
  -- Exemplo: utilizando COUNT DISTINCT
SELECT COUNT(DISTINCT diretoria) FROM membros;

-- WHERE
  -- Exemplo:
SELECT * FROM produtos WHERE preco > 10;

-- Operadores
  -- Exemplo: operador maior
  SELECT * FROM produtos WHERE preco > 10;
  -- Exemplo: like
  SELECT * FROM membros WHERE membro LIKE "%ana%";
  -- Exemplo: AND
  SELECT * FROM membros WHERE idade > 20 AND genero = "M";
  -- Exemplo: OR
  SELECT * FROM membros WHERE idade > 20 OR genero = "M";
  
-- Alteração de tabela 
  -- Adição de colunas
  ALTER TABLE <tabela> ADD COLUMN <nome><tipo>
    -- Exemplo: adição de colunas
    ALTER TABLE produtos ADD COLUMN quant_vendidas INTEGER NOT NULL;
  -- Remoção de colunas
  ALTER TABLE <tabela>  DROP COLUMN <nome>
  -- Modificação
  ALTER TABLE <tabela> MODIFY COLUMN <coluna><tipo>

-- Cláusula UPDATE
UPDATE nome_da_tabela SET coluna = valor WHERE condição;
 -- Exemplo: 
 UPDATE produtos SET preco = 10 WHERE nome = "copos";
 
 -- Cláusula DELETE
 DELETE FROM nome_da_tabela WHERE condição;
   -- Exemplo:
   DELETE FROM  membros WHERE membro = "Lucas"

-- EXEMPLO UTILIZANDO GROUP BY
SELECT diretoria, COUNT(*)
 FROM membros
	WHERE genero = 'F'
	GROUP BY diretoria;
    
-- EXEMPLO 2 DE GROUP BY
SELECT diretoria, COUNT(*) 
FROM membros
	WHERE genero = 'F' AND idade < 22
	GROUP BY diretoria;
    
-- EXEMPLO DE JOIN
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
INNER JOIN produtos
	ON membros.id_membros = produtos.id_membro_contatante;
   
-- LEFT JOIN
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
LEFT JOIN produtos
ON membros.id_membros = produtos.id_membro_contatante;

-- RIGHT JOIN
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
RIGHT JOIN produtos
ON membros.id_membros = produtos.id_membro_contatante;

-- CROSS JOIN
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
CROSS JOIN produtos;

-- Alguns bancos de dados, como o MySQL (até versão 5.7) não suportam o FULL JOIN. Como proceder?
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
LEFT JOIN produtos
ON membros.id_membros = produtos.id_membro_contatante
UNION
SELECT membros.membro, membros.diretoria, membros.id_membros, produtos.nome, produtos.preco
FROM membros
RIGHT JOIN produtos
ON membros.id_membros = produtos.id_membro_contatante;
