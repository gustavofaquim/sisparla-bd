-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SisParla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SisParla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SisParla` DEFAULT CHARACTER SET utf8mb3 ;
USE `SisParla` ;

-- -----------------------------------------------------
-- Table `SisParla`.`CLASSIFICACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`CLASSIFICACAO` (
  `IdClassificacao` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdClassificacao`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`ESTADO` (
  `IdEstado` INT NOT NULL AUTO_INCREMENT,
  `UF` CHAR(2) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`CIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`CIDADE` (
  `IdCidade` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NOT NULL,
  `Estado` INT NOT NULL,
  PRIMARY KEY (`IdCidade`),
  CONSTRAINT `fk_cidades_estados1`
    FOREIGN KEY (`Estado`)
    REFERENCES `SisParla`.`ESTADO` (`IdEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`ENDERECO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`ENDERECO` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `Cidade` INT NOT NULL,
   `CEP` VARCHAR(45) NULL DEFAULT NULL,
  `Bairro` VARCHAR(100) NULL,
  `Numero` VARCHAR(5) NULL DEFAULT NULL,
  `Lagradouro` VARCHAR(45) NOT NULL,
  `Quadra` VARCHAR(45) NULL DEFAULT NULL,
  `PontoReferencia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  CONSTRAINT `fk_ENDERECO_CIDADE1`
    FOREIGN KEY (`Cidade`)
    REFERENCES `SisParla`.`CIDADE` (`IdCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`SITUACAO_CADASTRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`SITUACAO_CADASTRO` (
  `idSituacao` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSituacao`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`APOIADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`APOIADOR` (
  `IdApoiador` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NULL DEFAULT NULL,
  `Apelido` VARCHAR(45) NULL DEFAULT NULL,
  `DataNascimento` DATE NOT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Religiao` VARCHAR(45) NULL,
  `Profissao` VARCHAR(45) NULL,
  `Endereco` INT NOT NULL,
  `Classificacao` INT NOT NULL,
  `Situacao` INT NOT NULL,
  `InformacaoAdicional` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`IdApoiador`),
  CONSTRAINT `fk_apoiadores_classificacoes1`
    FOREIGN KEY (`Classificacao`)
    REFERENCES `SisParla`.`CLASSIFICACAO` (`IdClassificacao`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_apoiadores_enderecos1`
    FOREIGN KEY (`Endereco`)
    REFERENCES `SisParla`.`ENDERECO` (`idEndereco`),
  CONSTRAINT `fk_apoiadores_situacoes_cadastro1`
    FOREIGN KEY (`Situacao`)
    REFERENCES `SisParla`.`SITUACAO_CADASTRO` (`idSituacao`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`CATEGORIA` (
  `IdCategoria` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`REGRA_ACESSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`REGRA_ACESSO` (
  `IdRegra` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(20) NOT NULL,
  `Descricao` VARCHAR(70) NULL DEFAULT NULL,
  PRIMARY KEY (`IdRegra`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`STATUS_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`STATUS_USUARIO` (
  `IdStatus` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdStatus`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`USUARIO` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `NomeUsuario` VARCHAR(20) NOT NULL,
  `Senha` VARCHAR(300) NOT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `RegraAcesso` INT NOT NULL,
  `Status` INT NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  CONSTRAINT `fk_USUARIO_REGRA_ACESSO1`
    FOREIGN KEY (`RegraAcesso`)
    REFERENCES `SisParla`.`REGRA_ACESSO` (`IdRegra`),
  CONSTRAINT `fk_USUARIO_STATUS_USUARIO1`
    FOREIGN KEY (`Status`)
    REFERENCES `SisParla`.`STATUS_USUARIO` (`IdStatus`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`HISTORICO_DEMANDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`HISTORICO_DEMANDA` (
  `IdHistorico` INT NOT NULL AUTO_INCREMENT,
  `Mensagem` VARCHAR(200) NULL DEFAULT NULL,
  `UsuarioOrigem` INT NOT NULL,
  `UsuarioDestino` INT NULL DEFAULT NULL,
  `DataMovimentacao` DATETIME NOT NULL,
  PRIMARY KEY (`IdHistorico`),
  CONSTRAINT `fk_HISTORICO_DEMANDA_USUARIO1`
    FOREIGN KEY (`UsuarioOrigem`)
    REFERENCES `SisParla`.`USUARIO` (`IdUsuario`),
  CONSTRAINT `fk_HISTORICO_DEMANDA_USUARIO2`
    FOREIGN KEY (`UsuarioDestino`)
    REFERENCES `SisParla`.`USUARIO` (`IdUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`SITUACAO_DEMANDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`SITUACAO_DEMANDA` (
  `IdSituacao` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdSituacao`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`DEMANDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`DEMANDA` (
  `IdDemanda` INT NOT NULL AUTO_INCREMENT,
  `Assunto` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(500) NULL DEFAULT NULL,
  `Apoiador` INT NOT NULL,
  `Categoria` INT NOT NULL,
  `Responsavel` INT NOT NULL,
  `Situacao` INT NOT NULL,
  `Valor` DECIMAL(10,0) NULL DEFAULT NULL,
  `EmendaParlamentar` CHAR(1) NOT NULL,
  `Historico` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdDemanda`),
  CONSTRAINT `fk_demanda_apoiadores1`
    FOREIGN KEY (`Apoiador`)
    REFERENCES `SisParla`.`APOIADOR` (`IdApoiador`),
  CONSTRAINT `fk_demanda_categorias1`
    FOREIGN KEY (`Categoria`)
    REFERENCES `SisParla`.`CATEGORIA` (`IdCategoria`),
  CONSTRAINT `fk_DEMANDA_HISTORICO_DEMANDA1`
    FOREIGN KEY (`Historico`)
    REFERENCES `SisParla`.`HISTORICO_DEMANDA` (`IdHistorico`),
  CONSTRAINT `fk_demanda_situacao_demanda1`
    FOREIGN KEY (`Situacao`)
    REFERENCES `SisParla`.`SITUACAO_DEMANDA` (`IdSituacao`),
  CONSTRAINT `fk_demanda_usuarios1`
    FOREIGN KEY (`Responsavel`)
    REFERENCES `SisParla`.`USUARIO` (`IdUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `SisParla`.`TIPO_ENTIDADE`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS  `SisParla`.`TIPO_ENTIDADE`(
  `IdTipo` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdTipo`));


-- -----------------------------------------------------
-- Table `SisParla`.`ENTIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`ENTIDADE` (
  `IdEntidade` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(90) NOT NULL,
  `Sigla` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdEntidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


CREATE TABLE IF NOT EXISTS `SisParla`.`PARTIDO` (
	`IdPartido` INT NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(120) NOT NULL,
    `Sigla` VARCHAR(45),
    PRIMARY KEY (`IdPartido`));


CREATE TABLE IF NOT EXISTS `SisParla`.`FILIACAO_PARTIDARIA`(
	`IdFiliacao` INT NOT NULL AUTO_INCREMENT,
    `Partido` INT NOT NULL,
    `Apoiador` INT NOT NULL,
    `DiretorioMunicipio` VARCHAR(90),
    `DiretorioUF` VARCHAR(3),
    `Zona` VARCHAR(10),
    `Seção` VARCHAR(10),
	`Cargo` VARCHAR(45) NULL DEFAULT NULL,
	`Lideranca` CHAR(1) NULL DEFAULT 'N',
	PRIMARY KEY (`IdFiliacao`),
     FOREIGN KEY (`Apoiador`) REFERENCES `SisParla`.`APOIADOR` (`IdApoiador`),
	 FOREIGN KEY (`Partido`) REFERENCES `SisParla`.`PARTIDO` (`IdPartido`)
);

-- -----------------------------------------------------
-- Table `SisParla`.`EVENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`EVENTO` (
  `IdEvento` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(70) NOT NULL,
  `Descricao` VARCHAR(300) NULL DEFAULT NULL,
  `Responsavel` VARCHAR(45) NULL DEFAULT NULL,
  `Local` VARCHAR(45) NULL DEFAULT NULL,
  `DataHorario` DATETIME NULL DEFAULT NULL,
  `Relacao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdEvento`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`PROFISSAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`PROFISSAO` (
  `IdProfissao` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`IdProfissao`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`RELIGIAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`RELIGIAO` (
  `IdReligiao` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdReligiao`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`RESPONSAVEL_EVENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`RESPONSAVEL_EVENTO` (
  `IdResponsavel` INT NOT NULL AUTO_INCREMENT,
  `Apoiador` INT NULL DEFAULT NULL,
  `Evento` INT NULL DEFAULT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `Telefone` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdResponsavel`),
  CONSTRAINT `fk_responsaveis_eventos_apoiadores1`
    FOREIGN KEY (`Apoiador`)
    REFERENCES `SisParla`.`APOIADOR` (`IdApoiador`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_responsaveis_eventos_eventos1`
    FOREIGN KEY (`Evento`)
    REFERENCES `SisParla`.`EVENTO` (`IdEvento`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`TELEFONE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`TELEFONE` (
  `IdTelefone` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(20) NOT NULL,
  `Apoiador` INT NOT NULL,
  `Whatsapp` CHAR(1) NOT NULL,
  `Principal` CHAR(1) NOT NULL,
  PRIMARY KEY (`IdTelefone`),
  CONSTRAINT `fk_telefones_apoiadores1`
    FOREIGN KEY (`Apoiador`)
    REFERENCES `SisParla`.`APOIADOR` (`IdApoiador`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `SisParla`.`VINCULACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SisParla`.`VINCULACAO` (
  `IdVinculacao` INT NOT NULL AUTO_INCREMENT,
  `Apoiador` INT NOT NULL,
  `Cargo` VARCHAR(45) NULL DEFAULT NULL,
  `Entidade` INT NULL DEFAULT NULL,
  `Lideranca` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IdVinculacao`),
    FOREIGN KEY (`Apoiador`)
    REFERENCES `SisParla`.`APOIADOR` (`IdApoiador`),
    FOREIGN KEY (`Entidade`)
    REFERENCES `SisParla`.`ENTIDADE` (`IdEntidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Data for table `SisParla`.`CLASSIFICACAO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;
INSERT INTO `SisParla`.`CLASSIFICACAO` (`IdClassificacao`, `Descricao`) VALUES (DEFAULT, 'Simpatizante');
INSERT INTO `SisParla`.`CLASSIFICACAO` (`IdClassificacao`, `Descricao`) VALUES (DEFAULT, 'Vota');
INSERT INTO `SisParla`.`CLASSIFICACAO` (`IdClassificacao`, `Descricao`) VALUES (DEFAULT, 'Vota e pede voto');
INSERT INTO `SisParla`.`CLASSIFICACAO` (`IdClassificacao`, `Descricao`) VALUES (DEFAULT, 'Vota, pede voto e faz doação');
INSERT INTO `SisParla`.`CLASSIFICACAO` (`IdClassificacao`, `Descricao`) VALUES (DEFAULT, 'Vota, pede voto, faz doação e indica doador');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SisParla`.`PROFISSAO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;

INSERT INTO `SisParla`.`PROFISSAO` (NOME) VALUES ('Desenvolvedor');
INSERT INTO `SisParla`.`PROFISSAO` (NOME) VALUES ('Analista de Requisitos');
INSERT INTO `SisParla`.`PROFISSAO` (NOME) VALUES ('Professor(a)');
INSERT INTO `SisParla`.`PROFISSAO` (NOME) VALUES ('Analista Contábil');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SisParla`.`ESTADO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;
INSERT INTO `SisParla`.`ESTADO` (`IdEstado`, `UF`, `nome`) VALUES (NULL, 'GO', 'Goiás');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SisParla`.`CIDADE`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;
INSERT INTO `SisParla`.`CIDADE` (`IdCidade`, `Nome`, `Estado`) VALUES (NULL, 'Ceres', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SisParla`.`SITUACAO_CADASTRO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;
INSERT INTO `SisParla`.`SITUACAO_CADASTRO` (`idSituacao`, `Descricao`) VALUES (DEFAULT, 'Ativo');
INSERT INTO `SisParla`.`SITUACAO_CADASTRO` (`idSituacao`, `Descricao`) VALUES (DEFAULT, 'Inativo');
INSERT INTO `SisParla`.`SITUACAO_CADASTRO` (`idSituacao`, `Descricao`) VALUES (DEFAULT, 'Pendente');
INSERT INTO `SisParla`.`SITUACAO_CADASTRO` (`idSituacao`, `Descricao`) VALUES (DEFAULT, 'Dados Incompletos');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SisParla`.`SITUACAO_CADASTRO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;
INSERT INTO `SisParla`.`TIPO_ENTIDADE` (Tipo) VALUES ('Partido Político');
INSERT INTO `SisParla`.`TIPO_ENTIDADE` (Tipo) VALUES ('Movimento Estudantil');
INSERT INTO `SisParla`.`TIPO_ENTIDADE` (Tipo) VALUES ('Sindicato');
INSERT INTO `SisParla`.`TIPO_ENTIDADE` (Tipo) VALUES ('Movimento Social');
COMMIT;

-- -----------------------------------------------------
-- Data for table `SisParla`.`ENTIDADE`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;

INSERT INTO `SisParla`.`ENTIDADE` (Nome, Sigla, Tipo) VALUES
('Partido dos Trabalhadores', 'PT', 'Partido Político'),
('Partido da Social Democracia Brasileira', 'PSDB', 'Partido Político'),
('Movimento Democrático Brasileiro', 'MDB', 'Partido Político'),
('Partido Socialista Brasileiro', 'PSB', 'Partido Político'),
('Partido Democrático Trabalhista', 'PDT', 'Partido Político'),
('Partido Progressista', 'PP', 'Partido Político'),
('Partido Comunista do Brasil', 'PCdoB', 'Partido Político'),
('Partido Verde', 'PV', 'Partido Político'),
('Rede Sustentabilidade', 'REDE', 'Partido Político'),
('Partido Social Cristão', 'PSC', 'Partido Político'),
('Partido Popular Socialista', 'PPS', 'Partido Político'),
('Partido Republicano Brasileiro', 'PRB', 'Partido Político'),
('Partido Social Liberal', 'PSL', 'Partido Político'),
('Democratas', 'DEM', 'Partido Político'),
('Partido Trabalhista Brasileiro', 'PTB', 'Partido Político'),
('Partido Liberal', 'PL', 'Partido Político'),
('Solidariedade', 'SD', 'Partido Político'),
('Partido Social Democrático', 'PSD', 'Partido Político'),
('Avante', 'AVANTE', 'Partido Político'),
('Cidadania', 'CIDADANIA', 'Partido Político'),
('Partido Socialismo e Liberdade', 'PSOL', 'Partido Político'),
('Partido Republicano da Ordem Social', 'PROS', 'Partido Político'),
('Partido Trabalhista Cristão', 'PTC', 'Partido Político'),
('Partido da Mulher Brasileira', 'PMB', 'Partido Político'),
('Partido Novo', 'NOVO', 'Partido Político'),
('Partido Renovador Trabalhista Brasileiro', 'PRTB', 'Partido Político'),
('Partido Social Liberal', 'PSL', 'Partido Político'),
('Partido Socialista dos Trabalhadores Unificado', 'PSTU', 'Partido Político'),
('Partido da Mobilização Nacional', 'PMN', 'Partido Político'),
('Partido Comunista Brasileiro', 'PCB', 'Partido Político'),
('Partido Humanista da Solidariedade', 'PHS', 'Partido Político'),
('Partido Trabalhista do Brasil', 'PTdoB', 'Partido Político');

INSERT INTO `SisParla`.`ENTIDADE` (Nome, Sigla, Tipo) VALUES
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
-- Data for table `SisParla`.`ESTADO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SisParla`;

INSERT INTO `SisParla`.`ESTADO` (UF, Nome) VALUES
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
