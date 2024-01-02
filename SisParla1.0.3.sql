
-- -----------------------------------------------------
-- Schema SisParla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS SisParla DEFAULT CHARACTER SET utf8mb4 ;

USE SisParla;

-- -----------------------------------------------------
-- Table GRUPO
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SISTEMA (
IdSistema INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Ativo VARCHAR(1) DEFAULT 'N',
PRIMARY KEY(IdSistema)
);


-- -----------------------------------------------------
-- Table CLASSIFICACAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CLASSIFICACAO (
IdClassificacao INT NOT NULL AUTO_INCREMENT,
IdSistema INT NOT NULL,
Descricao VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (IdClassificacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table ESTADO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESTADO (
IdEstado INT NOT NULL AUTO_INCREMENT,
UF CHAR(2) NOT NULL,
nome VARCHAR(45) NOT NULL,
PRIMARY KEY (IdEstado))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table CIDADE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CIDADE (
IdCidade INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(60) NOT NULL,
Estado INT NOT NULL,
PRIMARY KEY (IdCidade),
FOREIGN KEY (Estado)
REFERENCES ESTADO (IdEstado))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table ENDERECO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ENDERECO (
idEndereco INT NOT NULL AUTO_INCREMENT,
Cidade INT NOT NULL,
CEP VARCHAR(45) NULL DEFAULT NULL,
Bairro VARCHAR(100) NULL,
Numero VARCHAR(5) NULL DEFAULT NULL,
Lagradouro VARCHAR(100) DEFAULT NULL,
Quadra VARCHAR(45) NULL DEFAULT NULL,
PontoReferencia VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (idEndereco),
FOREIGN KEY (Cidade) REFERENCES CIDADE (IdCidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table SITUACAO_CADASTRO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SITUACAO_CADASTRO (
  idSituacao INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSituacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table CATEGORIA_DEMANDA

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CATEGORIA_DEMANDA (
  IdCategoria INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCategoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table REGRA_ACESSO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS REGRA_ACESSO (
  IdRegra INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(20) NOT NULL,
  Descricao VARCHAR(70) NULL DEFAULT NULL,
  PRIMARY KEY (IdRegra))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table STATUS_USUARIO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS STATUS_USUARIO (
  IdStatus INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (IdStatus))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table USUARIO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS USUARIO (
  IdUsuario INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  NomeUsuario VARCHAR(20) NOT NULL UNIQUE,
  Senha VARCHAR(300) NOT NULL,
  Telefone VARCHAR(20) NULL DEFAULT NULL,
  RegraAcesso INT NOT NULL,
  Status INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (RegraAcesso) REFERENCES REGRA_ACESSO (IdRegra),
  FOREIGN KEY (Status) REFERENCES STATUS_USUARIO (IdStatus))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table HISTORICO_DEMANDA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS HISTORICO_DEMANDA (
IdHistorico INT NOT NULL AUTO_INCREMENT,
Mensagem VARCHAR(200) NULL DEFAULT NULL,
UsuarioOrigem INT NOT NULL,
UsuarioDestino INT NULL DEFAULT NULL,
DataMovimentacao DATETIME NOT NULL,
PRIMARY KEY (IdHistorico),
FOREIGN KEY (UsuarioOrigem) REFERENCES USUARIO (IdUsuario),
FOREIGN KEY (UsuarioDestino) REFERENCES USUARIO (IdUsuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table TIPO_ENTIDADE
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS  TIPO_ENTIDADE(
IdTipo INT NOT NULL AUTO_INCREMENT,
Tipo VARCHAR(45) NOT NULL,
PRIMARY KEY (IdTipo));


-- -----------------------------------------------------
-- Table ENTIDADE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ENTIDADE (
IdEntidade INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(90) NOT NULL,
Sigla VARCHAR(45) NOT NULL,
Tipo VARCHAR(45) NOT NULL,
PRIMARY KEY (IdEntidade))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table PARTIDO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PARTIDO (
IdPartido INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(120) NOT NULL,
Sigla VARCHAR(45),
PRIMARY KEY (IdPartido));


-- -----------------------------------------------------
-- Table FILIACAO_PARTIDARIA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS FILIACAO_PARTIDARIA(
IdFiliacao INT NOT NULL AUTO_INCREMENT,
Partido INT NOT NULL,
DiretorioMunicipio VARCHAR(90),
DiretorioUF VARCHAR(3),
Zona VARCHAR(10),
Secao VARCHAR(10),
Cargo VARCHAR(120) NULL DEFAULT NULL,
Lideranca CHAR(1) NULL DEFAULT 'N',
PRIMARY KEY (IdFiliacao),
FOREIGN KEY (Partido) REFERENCES PARTIDO (IdPartido)
);


-- -----------------------------------------------------
-- Table APOIADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS APOIADOR (
IdApoiador INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
CPF VARCHAR(11) NULL DEFAULT NULL,
Apelido VARCHAR(45) NULL DEFAULT NULL,
DataNascimento DATE NOT NULL,
Email VARCHAR(45) NULL DEFAULT NULL,
Religiao VARCHAR(45) NULL,
Profissao VARCHAR(45) NULL,
Endereco INT,
Classificacao INT NOT NULL,
Situacao INT NOT NULL,
Filiacao INT,
InformacaoAdicional VARCHAR(300) NULL DEFAULT NULL,
PRIMARY KEY (IdApoiador),
FOREIGN KEY (Classificacao) REFERENCES CLASSIFICACAO (IdClassificacao),
FOREIGN KEY (Endereco) REFERENCES ENDERECO (idEndereco), 
FOREIGN KEY (Situacao) REFERENCES SITUACAO_CADASTRO (idSituacao),
FOREIGN KEY (Filiacao) REFERENCES FILIACAO_PARTIDARIA (idFiliacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;





-- -----------------------------------------------------
-- Table SITUACAO_DEMANDA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SITUACAO_DEMANDA (
IdSituacao INT NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(45) NOT NULL,
PRIMARY KEY (IdSituacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table DEMANDA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DEMANDA (
IdDemanda INT NOT NULL AUTO_INCREMENT,
Assunto VARCHAR(150) NOT NULL,
Descricao VARCHAR(500) NULL DEFAULT NULL,
Apoiador INT,
Categoria INT NOT NULL,
Responsavel INT,
Situacao INT NOT NULL,
Valor DECIMAL(10,0) NULL DEFAULT NULL,
EmendaParlamentar CHAR(1) NOT NULL,
Data DATE NOT NULL,
Historico INT NULL DEFAULT NULL,
PRIMARY KEY (IdDemanda),
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador), 
FOREIGN KEY (Categoria) REFERENCES CATEGORIA_DEMANDA (IdCategoria),
FOREIGN KEY (Historico) REFERENCES HISTORICO_DEMANDA (IdHistorico),
FOREIGN KEY (Situacao) REFERENCES SITUACAO_DEMANDA (IdSituacao),
FOREIGN KEY (Responsavel) REFERENCES USUARIO (IdUsuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table EVENTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EVENTO (
IdEvento INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(70) NOT NULL,
Descricao VARCHAR(300) NULL DEFAULT NULL,
Responsavel VARCHAR(45) NULL DEFAULT NULL,
Local VARCHAR(45) NULL DEFAULT NULL,
DataHorario DATETIME NULL DEFAULT NULL,
Relacao VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (IdEvento))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table PROFISSAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PROFISSAO (
IdProfissao INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Descricao VARCHAR(60) NULL DEFAULT NULL,
PRIMARY KEY (IdProfissao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table RELIGIAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS RELIGIAO (
IdReligiao INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
PRIMARY KEY (IdReligiao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table TELEFONE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TELEFONE (
IdTelefone INT NOT NULL AUTO_INCREMENT,
Numero VARCHAR(20) NOT NULL,
Apoiador INT NOT NULL,
Whatsapp CHAR(1) NOT NULL,
Principal CHAR(1) NOT NULL,
PRIMARY KEY (IdTelefone),
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table VINCULACAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS VINCULACAO (
IdVinculacao INT NOT NULL AUTO_INCREMENT,
Apoiador INT NOT NULL,
Cargo VARCHAR(120) NULL DEFAULT NULL,
Entidade INT NULL DEFAULT NULL,
Lideranca CHAR(1) NULL DEFAULT NULL,
PRIMARY KEY (IdVinculacao),
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador),
FOREIGN KEY (Entidade) REFERENCES ENTIDADE (IdEntidade))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Data for table CLASSIFICACAO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO CLASSIFICACAO (IdClassificacao, Descricao) VALUES (DEFAULT, 'Simpatizante');
INSERT INTO CLASSIFICACAO (IdClassificacao, Descricao) VALUES (DEFAULT, 'Vota');
INSERT INTO CLASSIFICACAO (IdClassificacao, Descricao) VALUES (DEFAULT, 'Vota e pede voto');
INSERT INTO CLASSIFICACAO (IdClassificacao, Descricao) VALUES (DEFAULT, 'Vota, pede voto e faz doação');
INSERT INTO CLASSIFICACAO (IdClassificacao, Descricao) VALUES (DEFAULT, 'Vota, pede voto, faz doação e indica doador');

COMMIT;

-- -----------------------------------------------------
-- Data for table PROFISSAO
-- -----------------------------------------------------
START TRANSACTION;


INSERT INTO PROFISSAO (NOME) VALUES ('Desenvolvedor');
INSERT INTO PROFISSAO (NOME) VALUES ('Analista de Requisitos');
INSERT INTO PROFISSAO (NOME) VALUES ('Professor(a)');
INSERT INTO PROFISSAO (NOME) VALUES ('Analista Contábil');

COMMIT;


-- -----------------------------------------------------
-- Data for table ESTADO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO ESTADO (IdEstado, UF, nome) VALUES (NULL, 'GO', 'Goiás');

COMMIT;

-- -----------------------------------------------------
-- Data for table CIDADE
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO CIDADE (IdCidade, Nome, Estado) VALUES (NULL, 'Ceres', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table SITUACAO_CADASTRO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Ativo');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Inativo');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Pendente');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Dados Incompletos');

COMMIT;


-- -----------------------------------------------------
-- Data for table SITUACAO_CADASTRO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Movimento Estudantil');
INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Sindicato');
INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Movimento Social');
COMMIT;

-- -----------------------------------------------------
-- Data for table ENTIDADE
-- -----------------------------------------------------
START TRANSACTION;


INSERT INTO PARTIDO (Nome, Sigla) VALUES
('Partido dos Trabalhadores', 'PT'),
('Partido da Social Democracia Brasileira', 'PSDB'),
('Movimento Democrático Brasileiro', 'MDB'),
('Partido Socialista Brasileiro', 'PSB'),
('Partido Democrático Trabalhista', 'PDT'),
('Partido Progressista', 'PP'),
('Partido Comunista do Brasil', 'PCdoB'),
('Partido Verde', 'PV'),
('Rede Sustentabilidade', 'REDE'),
('Partido Social Cristão', 'PSC'),
('Partido Popular Socialista', 'PPS'),
('Partido Republicano Brasileiro', 'PRB'),
('Partido Social Liberal', 'PSL'),
('Democratas', 'DEM'),
('Partido Trabalhista Brasileiro', 'PTB'),
('Partido Liberal', 'PL'),
('Solidariedade', 'SD'),
('Partido Social Democrático', 'PSD'),
('Avante', 'AVANTE'),
('Cidadania', 'CIDADANIA'),
('Partido Socialismo e Liberdade', 'PSOL'),
('Partido Republicano da Ordem Social', 'PROS'),
('Partido Trabalhista Cristão', 'PTC'),
('Partido da Mulher Brasileira', 'PMB'),
('Partido Novo', 'NOVO'),
('Partido Renovador Trabalhista Brasileiro', 'PRTB'),
('Partido Social Liberal', 'PSL'),
('Partido Socialista dos Trabalhadores Unificado', 'PSTU'),
('Partido da Mobilização Nacional', 'PMN'),
('Partido Comunista Brasileiro', 'PCB'),
('Partido Humanista da Solidariedade', 'PHS'),
('Partido Trabalhista do Brasil', 'PTdoB');

INSERT INTO ENTIDADE (Nome, Sigla, Tipo) VALUES
('Movimento dos Trabalhadores Rurais Sem Terra', 'MST', 'Movimento Social'),
('Marcha das Vadias', '', 'Movimento Social'),
('Movimento Passe Livre', 'MPL', 'Movimento Social'),
('Levante Popular da Juventude', '', 'Movimento Social'),
('Quilombo Urbano', '', 'Movimento Social'),
('Movimento Negro Unificado', 'MNU', 'Movimento Social'),
('Marcha das Margaridas', '', 'Movimento Social'),
('Movimento LGBT', '', 'Movimento Social'),
('Marcha Mundial das Mulheres', 'MMM', 'Movimento Social'),
('Coletivo de Mulheres Negras Feministas', '', 'Movimento Social');



COMMIT;
-- -----------------------------------------------------
-- Data for table ESTADO
-- -----------------------------------------------------
START TRANSACTION;


INSERT INTO ESTADO (UF, Nome) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');
COMMIT;


/* INSERÇÃO DE DADOS ESPECIFICOS POR SISTEMA...  */
START TRANSACTION;


INSERT SISTEMA VALUES 
(NULL, 'Mandato Adriana Accorsi', 'S' )


INSERT REGRA_ACESSO VALUES
(NULL,'ADM', 'Administrador do Sistema');


INSERT STATUS_USUARIO VALUES
(NULL, 'Ativo');


INSERT USUARIO VALUES 
(NULL, 'Gustavo Faquim', 'gustavofaquim', '$2b$10$DxQHuPrQgnv3L/Zr5nUvau.c8ynnL3M.KtxJK2w4QZ8YDUwTRlLWa', '62996828796', 1, 1);


INSERT SITUACAO_DEMANDA VALUES 
(NULL, 'Aberta'),
(NULL, 'Em atendimento'),
(NULL, 'Aguardando parece'),
(NULL, 'Incompleta'),
(NULL, 'Concluida'); 


INSERT CATEGORIA_DEMANDA VALUES
(NULL, 'Reunião'),
(NULL, 'Evento'),
(NULl, 'Recursos'),
(NULL, 'Emenda'),
(NULL, 'Outras');

COMMIT;
