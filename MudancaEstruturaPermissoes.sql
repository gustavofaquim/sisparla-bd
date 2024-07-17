

-- LISTTAGEM DAS PERMISSÕES POR USUÁRIO;
SELECT 
	u.IdUsuario,
	u.NomeUsuario,
	u.Nome,
	u.Senha,
	u.PerfilAcesso AS IdPerfil,
	PA.Nome as PerfilNome,
	T.Nome AS Tela,
	p.IdPermissao,
	p.Nome AS PermissaoNome
FROM
	USUARIO u
	INNER JOIN PERFIL_ACESSO PA ON u.PerfilAcesso = PA.IdPerfil
    INNER JOIN PERFIL_PERMISSAO PP ON PP.IdPerfil = PA.IdPerfil
	INNER JOIN TELA T on T.IdTela = PP.IdTela
	INNER JOIN PERMISSAO p ON p.IdPermissao = PP.IdPermissao
WHERE
	u.NomeUsuario = 'gustavofaquim';
    
    
   
	


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


DROP TABLE PERFIL_PERMISSAO;
DROP TABLE PERMISSAO;


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


ALTER TABLE USUARIO DROP foreign key fk_usuario_perfil;
ALTER TABLE USUARIO DROP PERFIL;
DROP TABLE PERFIL_ACESSO;
DROP TABLE PERFIL;


DROP TABLE PERFIL_PERMISSAO;

CREATE TABLE PERFIL_ACESSO(
IdPerfil INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(200) NOT NULL
);

INSERT PERFIL_ACESSO (Nome) 
VALUES 
('Administrador'),
('Chefe de Gabinete'),
('Assessor Padrão '),
('Assessor Cadastro');


CREATE TABLE PERFIL_PERMISSAO(
IdPerfil INT,
IdTela INT,
IdPermissao INT,
PRIMARY KEY(IdPerfil, IdTela, IdPermissao),
FOREIGN KEY (IdPerfil) REFERENCES PERFIL_ACESSO(IdPerfil),
FOREIGN KEY (IdTela) REFERENCES TELA(IdTela),
FOREIGN KEY (IdPermissao) REFERENCES PERMISSAO(IdPermissao)
);




-- INSERT PERFIL_PERMISSAO
SELECT 
	PA.IdPerfil,
	T.IdTela,
	P.IdPermissao
	-- * 
FROM 
	PERFIL_ACESSO PA
	INNER JOIN TELA T ON T.IdTela = T.IdTela
	INNER JOIN PERMISSAO P ON P.IdPermissao  = P.IdPermissao
WHERE PA.IdPerfil = 3
ORDER BY PA.IdPerfil, T.IdTela, P.IdPermissao 




ALTER TABLE USUARIO DROP Perfil;
ALTER TABLE USUARIO ADD PerfilAcesso INT;
ALTER TABLE USUARIO ADD CONSTRAINT fk_regra_acesso FOREIGN KEY (PerfilAcesso) REFERENCES PERFIL_ACESSO(IdPerfil);





UPDATE USUARIO 
SET PerfilAcesso = 4
WHERE IdUsuario  = 6;


