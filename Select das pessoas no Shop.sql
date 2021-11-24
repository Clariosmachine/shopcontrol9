/****** Use S9_Real  ******/
SELECT [Codigo]
      ,tipo
      ,[Fisica_Juridica]
      ,[Nome]
      ,[Fantasia]
	  ,[CEP]
      ,[Endereco]
      ,[Numero]
      ,[Complemento]
      ,[Bairro]
      ,[Cidade]
      ,[Estado]
	  ,'Brasil' País
	  ,case when Fisica_Juridica = 'J' then [CNPJ_Sem_Literais] else [CPF_Sem_Literais] end CPF_CNPJ
      ,Inscricao_Estadual_PF IE
	  ,RG_IE RG
      ,[Fone_1]
      ,[Fone_2]
      ,[Fax]
      ,[Limite_Credito]
      ,[Inativo]
      ,case when Indicador_IE = 1 then 'C' else 'N' end Indicador_IE
FROM [S9_Real].[dbo].[Cli_For]
order by 1