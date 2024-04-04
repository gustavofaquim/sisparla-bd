


SELECT * FROM CIDADE;

-- 5823
-- , CONCAT(complemento,' ',bairro) as complemento2 
SELECT * FROM ADRIANA_DADOS_APOIADORES_MIGRACAO
WHERE length(movimentosocial) >= 4 AND length(movimento) >= 4;


-- WHERE length(movimentosocial) >= 4 AND municipio IS NOT NULL;
-- WHERE length(movimentosocial) >= 4 AND movimento LIKE '%GOIANIA%';
-- WHERE movimentosocial <> '0' and municipio IS NULL AND movimento = 'GO';
-- WHERE bairro2 = bairro AND endereco NOT LIKE '%7' AND complemento = bairro AND bairro2 <> 'GO' AND municipio IS NULL;
-- WHERE bairro2 <> bairro AND endereco NOT LIKE '%7' AND complemento = bairro AND bairro2 <> 'GO' AND municipio IS NULL;
-- WHERE movimentosocial <> '0' AND (municipio NOT IN (SELECT Nome FROM Cidade));
-- WHERE municipio LIKE '%LT %'; 
-- WHERE municipio like '%LT.%';
-- WHERE municipio2 IS NOT NULL;
-- WHERE endereco = bairro AND bairro2 IS NOT NULL;
-- WHERE length(endereco) = 8 AND endereco LIKE '7%';
-- WHERE length(uf) > 2;
-- WHERE uf   = 'GOIANIA';
-- WHERE partido = 'GOIANIA';
-- WHERE length(partido) > 2;


UPDATE ADRIANA_DADOS_APOIADORES_MIGRACAO
SET movimentosocial = NULL
WHERE length(movimentosocial) >= 4 AND municipio IS NOT NULL;