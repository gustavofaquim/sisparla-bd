
START TRANSACTION;
-- -----------------------------------------------------
-- Schema SisParla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS SisParla DEFAULT CHARACTER SET utf8mb4 ;

USE SisParla;

CREATE TABLE IF NOT EXISTS SISTEMA (
IdSistema INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Ativo VARCHAR(1) DEFAULT 'N',
PRIMARY KEY(IdSistema)
);

CREATE TABLE IF NOT EXISTS CUSTOMIZACAO (
IdCustomizacao INT NOT NULL AUTO_INCREMENT,
CorPrincipal VARCHAR(20), 
CorSecundaria VARCHAR(20),
FontPrincipal VARCHAR(40),
FontSecundaria VARCHAR(40),
Logo VARCHAR(500),
Sistema INT NOT NULL,
PRIMARY KEY(IdCustomizacao),
FOREIGN KEY (Sistema) REFERENCES SISTEMA (IdSistema)
);


-- -----------------------------------------------------
-- Table CLASSIFICACAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CLASSIFICACAO (
IdClassificacao INT NOT NULL AUTO_INCREMENT,
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
Nome VARCHAR(45) NOT NULL,
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
Logradouro VARCHAR(100) DEFAULT NULL,
Complemento VARCHAR(60) NULL DEFAULT NULL,
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
-- Table GRUPO_APOIADORES
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS GRUPO (
IdGrupo INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(400),
Responsavel INT,
PRIMARY KEY (IdGrupo),
FOREIGN KEY (Responsavel) REFERENCES USUARIO (IdUsuario)
);


-- -----------------------------------------------------
-- Table ORIGEM_CADASTRO
-- -----------------------------------------------------
CREATE TABLE ORIGEM_CADASTRO (
idOrigem INT NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(300),
PRIMARY KEY(idOrigem)
);

-- -----------------------------------------------------
-- Table APOIADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS APOIADOR (
IdApoiador INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
CPF VARCHAR(11) NULL DEFAULT NULL,
Apelido VARCHAR(45) NULL DEFAULT NULL,
DataNascimento DATE,
Email VARCHAR(45) NULL DEFAULT NULL,
Religiao VARCHAR(45) NULL,
Profissao VARCHAR(45) NULL,
Endereco INT,
Classificacao INT NOT NULL,
Situacao INT NOT NULL,
Filiacao INT,
InformacaoAdicional VARCHAR(300) NULL DEFAULT NULL,
DataInsercao DATE,
Responsavel INT,
Grupo INT,
Origem INT,
Obs VARCHAR(50),
ApoiadorVinculado INT,
PRIMARY KEY (IdApoiador),
FOREIGN KEY (Classificacao) REFERENCES CLASSIFICACAO (IdClassificacao),
FOREIGN KEY (Endereco) REFERENCES ENDERECO (idEndereco), 
FOREIGN KEY (Situacao) REFERENCES SITUACAO_CADASTRO (idSituacao),
FOREIGN KEY (Filiacao) REFERENCES FILIACAO_PARTIDARIA (idFiliacao),
FOREIGN KEY (Responsavel) REFERENCES USUARIO (IdUsuario),
FOREIGN KEY (Grupo) REFERENCES GRUPO (IdGrupo),
FOREIGN KEY (Origem) REFERENCES ORIGEM_CADASTRO (idOrigem),
FOREIGN KEY (ApoiadorVinculado) REFERENCES APOIADOR (IdApoiador))
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
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador) ON DELETE CASCADE, 
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
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador) ON DELETE CASCADE)
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
FOREIGN KEY (Apoiador) REFERENCES APOIADOR (IdApoiador) ON DELETE CASCADE,
FOREIGN KEY (Entidade) REFERENCES ENTIDADE (IdEntidade) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS CREDOR(
IdCredor INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(150) NOT NULL,
Endereco INT,
Telefone VARCHAR(20),
Tipo VARCHAR(40),
Documento VARCHAR(14) UNIQUE,
PRIMARY KEY(IdCredor),
FOREIGN KEY (Endereco) REFERENCES ENDERECO (idEndereco)
);


CREATE TABLE IF NOT EXISTS ORIGEM_DESPESA(
IdOrigem INT NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(100), /* Mandato, pre-campanha, campanha */
Ano YEAR,
PRIMARY KEY(IdOrigem)
);



CREATE TABLE IF NOT EXISTS TIPO_DESPESA(
IdTipo INT NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(100),
PRIMARY KEY(IdTipo)
);


CREATE TABLE IF NOT EXISTS DESPESA(
IdDespesa INT NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(250) NOT NULL,
Detalhamento VARCHAR(800) NOT NULL,
Valor DECIMAL,
Data date NOT NULL,
Credor INT NOT NULL,
Origem INT NOT NULL,
Tipo INT NOT NULL,
PRIMARY KEY (IdDespesa),
FOREIGN KEY (Credor) REFERENCES CREDOR (IdCredor),
FOREIGN KEY (Origem) REFERENCES ORIGEM_DESPESA (IdOrigem),
FOREIGN KEY (Tipo) REFERENCES TIPO_DESPESA (IdTipo)
);

COMMIT;

