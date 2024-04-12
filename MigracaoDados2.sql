 CREATE TABLE ADRIANA_DADOS_APOIADORES_MIGRACAO (
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


SELECT * FROM ORIGEM_DADOS;

SELECT * FROM endereco;
SELECT COUNT(idApoiador) FROM Apoiador ;

SELECT COUNT(IdTelefone) FROM TELEFONE;


SELECT COUNT(idEndereco) FROM ENDERECO;

DELETE E2 FROM ENDERECO E2
INNER JOIN ENDERECO E1
WHERE E1.IdEndereco <  E2.IdEndereco 
AND E2.cidade = E1.cidade
AND E2.cep = E1.cep
AND E2.bairro = E1.bairro
AND E2.logradouro = E1.logradouro
AND E2.complemento = E1.complemento;



-- INSERT endereco (Cidade, CEP, Bairro, Logradouro, Complemento, PontoReferencia)
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
	-- INNER JOIN APOIADOR A ON A.Nome = M.nome AND A.DataNascimento = M.nascimento
	INNER JOIN CIDADE C ON M.municipio = C.IdCidade
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND bairro IS NOT NULL;



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



/* Ajusta telefone celular */
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO M
SET M.telefonecelular =  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(M.telefonecelular, ' ', ''), 
      '(', ''), 
    ')', ''), 
  '-', '')
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR) AND telefonecelular IS NOT NULL AND telefonecelular NOT IN ('');
-- WHERE nascimento IS NOT NULL AND telefonecelular IS NOT NULL  AND length(telefonecelular) > 8;
-- WHERE Obs = 'Migração Sistema Antigo - 08/04/2024' AND telefonecelular IS NOT NULL  AND length(telefonecelular) > 8;





/* Inserir na tabela telefone */
INSERT TELEFONE (Numero, Apoiador, WhatsApp, Principal)
SELECT 
M.telefonecelular,
A.IdApoiador,
'N',
'S'
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN APOIADOR A ON A.Nome = M.nome 
WHERE M.telefonecelular IS NOT NULL AND M.telefonecelular <> '' AND M.telefonecelular <> '00000000000' AND A.IdApoiador IS NOT NULL; 


	


-- AND length(M.telefonecelular) > 8 AND Obs = 'Migração Sistema Antigo - 08/04/2024';

SELECT 
* 
FROM APOIADOR; 
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

SELECT * FROM APOIADOR_MIGRACAO;

DELETE FROM APOIADOR;
SELECT * FROM APOIADOR;



-- INSERT APOIADOR_MIGRACAO (Nome, DataNascimento, Email, Endereco, Classificacao, Situacao, OBS) 
SELECT 
nome, nascimento, email, migracao_endereco, '2', '4', 'Migração Sistema Antigo - 09/04/2024'
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M;
-- WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024');


SELECT
M.telefonecelular 
-- *
-- COUNT(IdApoiador) 
FROM APOIADOR A 
INNER JOIN ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M ON A.Nome = M.Nome
WHERE Obs = 'Migração Sistema Antigo - 08/04/2024';


SELECT * FROM TELEFONE;


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
  

-- INSERT ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SELECT 
	-- COUNT(id)
     *
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO
WHERE 
	nascimento IS NOT NULL
    AND endereco IS NOT NULL
    AND municipio IS NOT NULL;   


SELECT 
-- COUNT(id)
* 
FROM
ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M 
WHERE Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND Endereco IS NOT NULL AND Endereco <> '';

SELECT 
C.IdCidade,
C.Nome,
M.Municipio
-- * 
FROM
ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M 
INNER JOIN CIDADE C ON C.Nome = M.municipio
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND Endereco IS NOT NULL AND Endereco <> '';


SELECT * FROM ENDERECO;

-- INSERT ENDERECO (Cidade, CEP, Bairro, Logradouro, Complemento, PontoReferencia)
SELECT 
DISTINCT
	C.IdCidade,
    M.cep,
    M.bairro,
    M.endereco,
    M.complemento,
    NULL
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M 
INNER JOIN CIDADE C ON C.IdCidade = M.municipio
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND Endereco IS NOT NULL AND Endereco <> '';


/*
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN CIDADE C ON C.Nome = M.municipio
SET M.Municipio = E.Cidade
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND Endereco IS NOT NULL AND Endereco <> ''; 
*/

/*
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN CIDADE C ON C.Nome = M.municipio
SET M.Municipio = C.IdCidade
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024'); 
*/

/* MUDA DE NOME PARA ID NA COLUNA MUNICIPIO - CIDADE */
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN CIDADE C ON C.Nome = M.municipio
SET M.Municipio = C.IdCidade
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024'); 

/*
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
SET M.municipio = TRIM(LEADING ' ' FROM M.municipio);
*/

/*
UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
SET municipio = NULL
WHERE municipio = 'GOGO';
 -- 613
*/


-- INSERT Cidade VALUES (NULL, 'Trindade', 9);

INSERT Cidade VALUES 
(NULL, 'Itumbiara', 9);


SELECT * FROM Cidade
WHERE Nome Like '%Itumbiara%';

SELECT * FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
-- INNER JOIN CIDADE C ON  M.municipio <> C.IdCidade
-- SET M.Municipio = E.Cidade
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND M.municipio NOT IN (SELECT IdCidade FROM CIDADE)
AND M.municipio NOT IN (SELECT Nome FROM CIDADE);




SELECT  * FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN ENDERECO E ON E.Cidade = M.municipio AND E.Cep = M.cep AND E.Bairro = M.Bairro AND E.Complemento = M.complemento AND E.Logradouro = M.endereco
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND migracao_endereco IS NULL;

UPDATE
ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN ENDERECO E ON E.Cidade = M.municipio AND E.Cep = M.cep AND E.Bairro = M.Bairro AND E.Complemento = M.complemento AND E.Logradouro = M.endereco
SET M.migracao_endereco = E.IdEndereco
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR WHERE Obs = 'Migração Sistema Antigo - 04/04/2024')
AND migracao_endereco IS NULL;


SELECT * FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO;


SELECT * FROM ENDERECO;

-- INSERT endereco (Cidade, CEP, Bairro, Logradouro, Complemento, PontoReferencia)
SELECT  
	DISTINCT
    M.municipio,
    M.cep,
    M.bairro,
    M.endereco,
    M.complemento,
    NULL
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
WHERE (CEP <> '' AND BAIRRO <> '') AND municipio IS NOT NULL
AND municipio IN (SELECT IdCidade FROM Cidade);

-- aqui

SELECT 
	M.*
FROM 
	ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
    INNER JOIN ENDERECO E ON E.CEP = M.CEP AND E.Bairro = M.Bairro AND M.Endereco = E.Logradouro
    INNER JOIN TELEFONE T ON T.Apoiador
WHERE (E.CEP <> '' AND E.BAIRRO <> '') AND municipio IS NOT NULL;


UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO M
INNER JOIN ENDERECO E ON E.CEP = M.CEP AND E.Bairro = M.Bairro AND M.Endereco = E.Logradouro
SET M.migracao_endereco = E.IdEndereco
WHERE (E.CEP <> '' AND E.BAIRRO <> '') AND municipio IS NOT NULL;


SELECT * FROM ENDERECO;


-- 977
SELECT * FROM APOIADOR A
INNER JOIN endereco e on A.Endereco = e.IdEndereco
INNER JOIN Cidade c ON C.IdCidade = e.Cidade;




SELECT * FROM APOIADOR_MIGRACAO;

/* Tabela temporaria com os dados para serem migrados para o servidor */
INSERT APOIADOR_MIGRACAO
SELECT 
	*
FROM
	APOIADOR A
WHERE
	A.Obs =  'Migração Sistema Antigo - 08/04/2024';


-- DELETE FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO;

SELECT * FROM ADRIANA_DADOS_APOIADORES_MIGRACAO M
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR);


UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO M
SET telefonecelular = telefone
WHERE M.Nome NOT IN (SELECT Nome FROM APOIADOR )
AND telefone NOT IN ('') AND telefonecelular IN ('');

SELECT 
COUNT(id)
-- nome, nascimento, email, '2', '4', 'Migração Sistema Antigo - 04/04/2024'
FROM ADRIANA_DADOS_APOIADORES_MIGRACAO_ANDAMENTO
WHERE nascimento IS NOT NULL;

-- 1999-11-15  

-- 18826 -> esse
-- 22743
-- 25462



ALTER TABLE APOIADOR
ADD COLUMN ApoiadorVinculado INT,
ADD CONSTRAINT fk_apoiador_vinculado
    FOREIGN KEY (ApoiadorVinculado)
    REFERENCES APOIADOR(IdApoiador);