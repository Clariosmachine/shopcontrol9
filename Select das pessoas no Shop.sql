SELECT Codigo
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
      
      ,CASE
          WHEN Fisica_Juridica = 'J' 
	      THEN [CNPJ_Sem_Literais] 
	      ELSE [CPF_Sem_Literais] 
       END CPF_CNPJ
	
      ,Inscricao_Estadual_PF IE
      ,RG_IE RG
      ,[Fone_1]
      ,[Fone_2]
      ,[Fax]
      ,[Limite_Credito]
      ,[Inativo]
      
      ,CASE
          WHEN Indicador_IE = 1
	      THEN 'C' 
          ELSE 'N' 
       END Indicador_IE
      
FROM Cli_For
ORDER BY 1
