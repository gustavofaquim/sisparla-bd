SELECT 
	DISTINCT A.Nome,
	T.Numero,
	E.CEP,
	E.Bairro,
	E.Logradouro,
	E.Complemento,
	E.PontoReferencia,
	C.Nome 
FROM 
	APOIADOR A
	LEFT JOIN TELEFONE T ON T.Apoiador  = A.IdApoiador 
	LEFT JOIN ENDERECO E ON E.idEndereco  = A.Endereco 
	LEFT JOIN CIDADE C ON C.Nome  = E.Cidade 
WHERE 
	(E.Bairro LIKE '%GOIÁ%' OR E.Bairro LIKE '%João Brás%' OR E.Bairro LIKE '%Goiânia Viva%' OR E.Bairro LIKE '%Solange Park%'
	OR E.Bairro LIKE '%Vera Cruz%' OR E.Bairro LIKE '%Lorena park%'  OR E.Bairro LIKE '%Luana park%' OR E.Bairro LIKE '%Cerrado%'
	OR E.Bairro LIKE '%Parque Oeste%' OR E.Bairro LIKE '%São Marcos%' OR E.Bairro LIKE '%Carolina Park%' OR E.Bairro LIKE '%Buena Vista%')
	AND E.Bairro NOT IN ('GOIÂNIA 2')  AND E.Bairro NOT LIKE '%Jardim Goiás%' AND E.Bairro NOT LIKE '%JD Goias%'
ORDER BY E.Bairro ASC, A.Nome ASC