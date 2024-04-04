

DROP TABLE ADRIANA_DADOS_APOIADORES_MIGRACAO;

CREATE TABLE IF NOT EXISTS ADRIANA_DADOS_APOIADORES_MIGRACAO (
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
    liga VARCHAR(255)
);



LOAD DATA INFILE 'banco_de_dados_final.csv'
INTO TABLE ADRIANA_DADOS_APOIADORES_MIGRACAO
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(id,nome,apelido,telefone,telefonecelular,telefonecelular2,zap,zap2,profissao,nascimento,apoiador,email,religiao,cep,endereco,bairro,municipio,uf,movimentosocial,movimento,zona,abranzona,liderid,partido,origem,status,classe,liga);


