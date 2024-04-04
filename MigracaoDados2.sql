 CREATE TABLE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO (
	id VARCHAR(255),
    nome VARCHAR(255),
    apelido VARCHAR(255),
    telefone VARCHAR(255),
    telefonecelular VARCHAR(255),
    telefonecelular2 VARCHAR(255),
    zap VARCHAR(255),
    zap2 VARCHAR(255),
    profissao VARCHAR(255),
    nascimento VARCHAR(255),
    apoiador VARCHAR(255),
    email VARCHAR(255),
    religiao VARCHAR(255),
    cep VARCHAR(255),
    endereco VARCHAR(255),
    bairro VARCHAR(255),
    municipio VARCHAR(255),
    uf VARCHAR(255),
    movimentosocial VARCHAR(255),
    movimento VARCHAR(255),
    zona VARCHAR(255),
    abranzona VARCHAR(255),
    liderid VARCHAR(255),
    partido VARCHAR(255),
    origem VARCHAR(255),
    status VARCHAR(255),
    classe VARCHAR(255),
    liga VARCHAR(255),
    municipio2 VARCHAR(255),
    bairro2 VARCHAR(255),
    complento VARCHAR(255),
    complemento VARCHAR(255),
    complemento2 VARCHAR(255)
    );


DESC ADRIANA_DADOS_APOIADORES_MIGRACAO;

SELECT 
	-- COUNT(id)
     *
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO
WHERE 
	nascimento IS NOT NULL
    AND endereco IS NOT NULL
    AND municipio IS NOT NULL;
  

-- INSERT ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SELECT 
	-- COUNT(id)
     *
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
     
WHERE 
	nascimento IS NOT NULL
    AND municipio IS NOT NULL
    AND NOT EXISTS (SELECT Nome FROM APOIADOR A WHERE A.Nome = M.nome AND A.DataNascimento = M.nascimento);
    

ALTER TABLE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO ADD migracao_endereco INT;
    
SELECT 
*
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
	INNER JOIN APOIADOR A ON A.Nome = M.nome AND A.DataNascimento = M.nascimento
    -- INNER JOIN ENDERECO E ON E.Cidade = M.municipio AND E.Cep = M.cep AND E.Bairro = M.Bairro AND E.Complemento = M.complemento AND E.Logradouro = M.endereco
WHERE nascimento IS NOT NULL ;    
    
UPDATE 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
	INNER JOIN APOIADOR A ON A.Nome = M.nome AND A.DataNascimento = M.nascimento
	-- INNER JOIN ENDERECO E ON E.Cidade = M.municipio AND E.Cep = M.cep AND E.Bairro = M.Bairro AND E.Complemento = M.complemento AND E.Logradouro = M.endereco 
SET A.Endereco = M.migracao_endereco
WHERE nascimento IS NOT NULL AND (municipio = '977') AND migracao_endereco IS NOT NULL ;    



SELECT * FROM endereco;
SELECT * FROM Apoiador;

INSERT endereco (Cidade, CEP, Bairro, Logradouro, Complemento, PontoReferencia)
SELECT 
DISTINCT
    M.municipio,
    M.cep,
    M.bairro,
    M.endereco,
    M.complemento,
    NULL
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
	INNER JOIN APOIADOR A ON A.Nome = M.nome AND A.DataNascimento = M.nascimento
WHERE nascimento IS NOT NULL AND (municipio = '977');



SELECT * FROM CIDADE
WHERE Nome LIKE '%Goiania%';

-- 977

UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SET municipio = '977'
WHERE nascimento IS NOT NULL AND (municipio = 'Goiânia' OR municipio = 'GOIANIA' OR municipio = 'GOIÂNIA');

SELECT * FROM classificacao;

SELECT * FROM telefone;

SELECT 
  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(telefonecelular, ' ', ''), 
      '(', ''), 
    ')', ''), 
  '-', '') AS numero_formatado 
FROM 
  ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
WHERE nascimento IS NOT NULL AND telefonecelular IS NOT NULL  AND length(telefonecelular) > 8;




UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SET telefonecelular =  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(telefonecelular, ' ', ''), 
      '(', ''), 
    ')', ''), 
  '-', '') 
WHERE nascimento IS NOT NULL AND telefonecelular IS NOT NULL  AND length(telefonecelular) > 8;





INSERT telefone (Numero, Apoiador, WhatsApp, Principal)
SELECT 
M.telefonecelular,
A.IdApoiador,
'N',
'S'
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN APOIADOR A ON A.Nome = M.nome AND A.DataNascimento = M.nascimento
WHERE nascimento IS NOT NULL AND telefonecelular IS NOT NULL AND length(M.telefonecelular) > 8;



INSERT APOIADOR (Nome, DataNascimento, Email, Classificacao, Situacao, OBS) 
SELECT 
nome, nascimento, email, '2', '4', 'Migração Sistema Antigo - 04/04/2024'
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
WHERE nascimento IS NOT NULL;


SELECT * FROM APOIADOR;


SELECT 
nome,
nascimento,
	IF(SUBSTRING(nascimento, 1, 2) > '23', 
    STR_TO_DATE(CONCAT('19', nascimento), '%Y/%d/%m'), 
    STR_TO_DATE(CONCAT('20', nascimento), '%Y/%d/%m')) AS data_formatada 
FROM 
  ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO;

-- -------------------------
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SET NASCIMENTO = IF(SUBSTRING(nascimento, 1, 2) > '23', 
    STR_TO_DATE(CONCAT('19', nascimento), '%Y/%d/%m'), 
    STR_TO_DATE(CONCAT('20', nascimento), '%Y/%d/%m'));
  

INSERT ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SELECT 
	-- COUNT(id)
     *
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO
WHERE 
	nascimento IS NOT NULL
    AND endereco IS NOT NULL
    AND municipio IS NOT NULL;   


-- 1999-11-15  

-- 18826 -> esse
-- 22743
-- 25462