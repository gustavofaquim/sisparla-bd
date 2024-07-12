

-- LISTTAGEM DAS PERMISSÕES POR USUÁRIO;
SELECT 
	u.IdUsuario,
	u.NomeUsuario,
	u.Nome,
	u.Senha,
	u.PerfilAcesso AS IdPerfil,
	pa.Nome as PerfilNome,
	t.Nome AS Tela,
	p.IdPermissao,
	p.Nome AS PermissaoNome
FROM
	USUARIO u
	INNER JOIN PERFIL_ACESSO PA ON u.PerfilAcesso = PA.IdPerfil
    INNER JOIN PERFIL_PERMISSAO PP ON PP.IdPerfil = PA.IdPerfil
	INNER JOIN TELA t on t.IdTela = PP.IdTela
	INNER JOIN PERMISSAO p ON p.IdPermissao = PP.IdPermissao
WHERE
	u.NomeUsuario = 'gustavofaquim'
    AND T.Nome = 'grupos';
    
    


ALTER TABLE USUARIO DROP RegraAcesso;
ALTER TABLE USUARIO DROP foreign key USUARIO_ibfk_1;



SELECT * FROM PERFIL_ACESSO;
SELECT * FROM PERFIL_PERMISSAO;
SELECT * FROM TELA;
SELECT * FROM PERMISSAO;



CREATE TABLE TELA (
IdTela INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(200)
);

INSERT TELA (Nome) VALUES 
('apoiadores'), 
('aniversariantes'), 
('demandas'),
('eventos'),
('despesas'),
('lista-credores'),
('grupos'),
('profissoes'),
('origens'),
('home'),
('usuarios'),
('credores'),
('graficos'),
('indicadores'),
('configurações');

/*
CREATE TABLE PERMISSAO_TELA(
IdTela INT NOT NULL ,
IdPermissao INT NOT NULL,
PRIMARY KEY(IdTela, IdPermissao),
FOREIGN KEY (IdTela) REFERENCES TELA(IdTela),
FOREIGN KEY (IdPermissao) REFERENCES PERMISSAO(IdPermissao)
); */


CREATE TABLE PERMISSAO(
IdPermissao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(300) NOT NULL
);

INSERT PERMISSAO (Nome) VALUES 
('Criar'),
('Visualizar'),
('Atualizar'),
('Deletar'),
('Emitir Relatório');


CREATE TABLE PERFIL_ACESSO(
IdPerfil INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(200) NOT NULL
);

INSERT PERFIL_ACESSO (Nome) 
VALUES 
('Administrador'),
('Chefia de Gabinete'),
('Assessoria Padrão'),
('Assessoria Cadastramento');

CREATE TABLE PERFIL_PERMISSAO(
IdPerfil INT,
IdTela INT,
IdPermissao INT,
PRIMARY KEY(IdPerfil, IdTela, IdPermissao),
FOREIGN KEY (IdPerfil) REFERENCES PERFIL_ACESSO(IdPerfil),
FOREIGN KEY (IdTela) REFERENCES TELA(IdTela),
FOREIGN KEY (IdPermissao) REFERENCES PERMISSAO(IdPermissao)
);


INSERT PERFIL_PERMISSAO VALUES 
(1, 1, 1);


ALTER TABLE USUARIO DROP foreign key fk_usuario_perfil;
DROP TABLE PERFIL_ACESSO;

ALTER TABLE USUARIO DROP Perfil;
ALTER TABLE USUARIO ADD PerfilAcesso INT;
ALTER TABLE USUARIO ADD CONSTRAINT fk_regra_acesso FOREIGN KEY (PerfilAcesso) REFERENCES PERFIL_ACESSO(IdPerfil);




