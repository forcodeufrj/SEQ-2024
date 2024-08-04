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
