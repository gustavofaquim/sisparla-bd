ALTER TABLE APOIADOR DROP FOREIGN KEY fk_apoiador_vinculado;
ALTER TABLE APOIADOR Modify ApoiadorVinculado VARCHAR(120);

ALTER TABLE ENTIDADE MODIFY Sigla VARCHAR(45);
ALTER TABLE ENTIDADE MODIFY Tipo VARCHAR(45);