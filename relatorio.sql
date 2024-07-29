

SELECT 
	A.Nome,
    DATE_FORMAT(A.DataNascimento, '%d/%m/%Y') AS DataNascimento,
    E.CEP,
    E.Logradouro AS Endereco,
    E.Complemento,
    E.Bairro,
    CI.Nome AS Cidade,
    ES.UF,
	T.Numero as Celular,
    A.Email,
    A.Sexo as Genero,
    CASE
		WHEN (FP.Lideranca NOT LIKE '%n%') THEN 'Sim'
		WHEN V.Lideranca NOT LIKE '%n%' THEN 'Sim'
		ELSE 'Não'
    END AS 'É Lider?',
    A.InformacaoAdicional AS 'Observação'
FROM
	APOIADOR A
    LEFT JOIN ENDERECO E ON E.idEndereco = A.Endereco
    LEFT JOIN CIDADE CI ON CI.IdCidade = E.Cidade
    LEFT JOIN ESTADO ES ON ES.IdEstado = CI.Estado
    LEFT JOIN TELEFONE T ON T.Apoiador = A.IdApoiador
    LEFT JOIN FILIACAO_PARTIDARIA FP ON FP.IdFiliacao = A.Filiacao 
    LEFT JOIN VINCULACAO V ON V.Apoiador = A.IdApoiador;
    
	