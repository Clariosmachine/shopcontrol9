Select top 1 * from
	
	(select b.Codigo_Barras codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1  and b.Codigo_Barras <> ''

union 

	select
	b.Codigo_Adicional1 codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional1 <> ''
	
union 

	select
	b.Codigo_Adicional2 codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional2 <> ''
	
union 

	select
	b.Codigo_Adicional3 codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional3 <> ''
	
union 

	select
	b.Codigo_Adicional4 codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional4 <> ''
	
union 

	select
	b.Codigo_Adicional5 codigo, b.nome, a.preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional5 <> ''
	) as Consulta

where codigo =