/******	 Use S9_Real
		 GO  
*******/
SELECT 
	   Prod.Ordem
	  ,Prod.[Codigo]
    ,replace (Prod.Nome,';','.') Nome
    ,replace (Codigo_Adicional1,';','.') Adicional1
	  ,Codigo_Barras
	  ,EAN_Tributavel
	  ,UN.Codigo unidade
	  ,UN.nome Nome_unid
    ,NCM.codigo NCM
	  ,CIS.codigo Cod_CIS
	  ,CIS.Nome Classe_Imposto_Saida
	  ,Trib_Vendas.Cod_CFOP
	  ,Trib_Vendas.Nome_CFOP
	  ,Trib_Vendas.ICMS_CST_CSOSN
	  ,Trib_Vendas.PIS_COFINS_CST
	  ,Trib_Entradas.PIS_COFINS_CST PIS_Cofins_Entradas
	  ,CIE.codigo Cod_CIE
	  ,CIE.Nome Nome_CIE
    ,Classes.codigo Classe
	  ,classes.Nome Nome_Cla
    ,Subclasses.codigo subclasse
	  ,Subclasses.Nome Nome_SubC
	  ,Format (P_venda_1.Preco, 'N', 'pt-br') P_venda_1
	  ,Format (P_custo.Preco, 'N', 'pt-br') P_custo
	  ,Format (P_custo_M.Preco, 'N', 'pt-br') P_custo_M
  FROM [Prod_Serv] Prod
  left join Unidades_Venda UN on UN.Ordem = Prod.Ordem_Unidade_Venda
  left join [Classes] ON Classes.ordem = Prod.Ordem_Classe
  left join [Subclasses] ON Subclasses.ordem = Prod.Ordem_SubClasse
  left join Classe_Imposto CIS on CIS.Tipo_Operacao = 'S' AND Prod.Ordem_Classe_Imposto_Saida = CIS.Ordem
  left join Classe_Imposto CIE on CIE.Tipo_Operacao = 'E' AND Prod.Ordem_Classe_Imposto_Entrada = CIE.Ordem
  left join [Prod_Serv_Precos] P_venda_1 ON P_venda_1.ordem_tabela_preco = 1 AND  P_venda_1.[Ordem_Prod_Serv] = Prod.[Ordem]
  left join [Prod_Serv_Precos] P_custo ON P_custo.ordem_tabela_preco = 4 AND  P_custo.[Ordem_Prod_Serv] = Prod.[Ordem]
  left join [Prod_Serv_Precos] P_custo_M ON P_custo_M.ordem_tabela_preco = 5 AND  P_custo_M.[Ordem_Prod_Serv] = Prod.[Ordem]
  left join [NCM] ON NCM.[ordem] = Prod.[Ordem_NCM]
  
  left join
		  (select
			  CIO.ordem_classe_imposto
			 ,CFOP.codigo Cod_CFOP
			 ,CFOP.Nome Nome_CFOP
			 ,CIO.ICMS_CST_CSOSN
			 ,CIO.PIS_COFINS_CST
		from 
		Classe_Imposto_Operacao CIO
		inner join CFOP on CFOP.Ordem = CIO.Ordem_CFOP_Prod_NF
		where
			Tipo_Operacao = 's'  -- apenas as operacoes de saida
		and
			(Ordem_Operacao = 
			(select top 1 ordem from Operacoes where codigo = 500 and Entrada_Saida = 's')  -- codigo aqui e o codigo da operacao
			)
		and
			Estados = 'AL' /* apenas as operacoes do estado de Alagoas */) Trib_Vendas on Trib_Vendas.ordem_classe_imposto = Prod.Ordem_Classe_Imposto_Saida

	left join
		  (select
			  CIO.ordem_classe_imposto
			 ,CIO.PIS_COFINS_CST
		from 
		Classe_Imposto_Operacao CIO
		where
			Tipo_Operacao = 'e'  -- apenas as operacoes de entrada
		and Impostos_Simples_Nacional = 0
		and
			(Ordem_Operacao = 
			(select top 1 ordem from Operacoes where codigo = 10 and Entrada_Saida = 'e')  -- codigo aqui e o codigo da operacao
			)
		and
			Estados = 'AL' /* apenas as operacoes do estado de Alagoas */) Trib_Entradas on Trib_Entradas.ordem_classe_imposto = prod.Ordem_Classe_Imposto_Entrada


  where Prod.inativo <> 1
  order by 1
