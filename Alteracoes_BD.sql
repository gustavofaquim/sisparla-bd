ALTER TABLE APOIADOR DROP FOREIGN KEY fk_apoiador_vinculado;
ALTER TABLE APOIADOR Modify ApoiadorVinculado VARCHAR(120);

ALTER TABLE ENTIDADE MODIFY Sigla VARCHAR(45);
ALTER TABLE ENTIDADE MODIFY Tipo VARCHAR(45);


CREATE TABLE AVATAR
(
IdAvatar INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Avatar VARCHAR(800) NOT NULL
);




ALTER TABLE USUARIO ADD Avatar VARCHAR(800);

INSERT AVATAR (Avatar) VALUES
('man_01.png'),
('man_02.png'),
('man_03.png'),
('man_04.png'),
('man_05.png'),
('man_06.png'),
('man_07.png'),
('man_08.png'),
('man_09.png'),
('man_10.png'),
('man_11.png'),
('man_12.png'),
('man_13.png'),
('man_14.png');


INSERT AVATAR (Avatar) VALUES
('woman_01.png'),
('woman_02.png'),
('woman_03.png'),
('woman_04.png'),
('woman_05.png'),
('woman_06.png'),
('woman_07.png'),
('woman_08.png'),
('woman_09.png'),
('woman_10.png'),
('woman_11.png'),
('woman_12.png'),
('woman_13.png');

SELECT * FROM AVATAR;





-------------------------------------------------


SELECT * FROM DESPESA;

DESC DESPESA; 

ALTER TABLE DESPESA MODIFY Valor DECIMAL(10, 2);
ALTER TABLE DESPESA MODIFY Detalhamento VARCHAR(900);
ALTER TABLE DESPESA MODIFY Data Date;
ALTER TABLE DESPESA MODIFY Credor Int;
ALTER TABLE DESPESA ADD Mes VARCHAR(10);
ALTER TABLE DESPESA ADD Ano year;


