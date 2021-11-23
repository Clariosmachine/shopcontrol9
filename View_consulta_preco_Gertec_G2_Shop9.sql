create view leitor_barras as
-- O nome do produto tem apenas 25 caracteres para o aplicativo poder gerar o nome do produto no áudio.
-- A moeda já está formatada, indo com duas casas decimais.

Select distinct * from
	
	(select b.Codigo_Barras codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1  and b.Codigo_Barras <> ''

union 

	select
	b.Codigo_Adicional1 codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional1 <> ''
	
union 

	select
	b.Codigo_Adicional2 codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional2 <> ''
	
union 

	select
	b.Codigo_Adicional3 codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional3 <> ''
	
union 

	select
	b.Codigo_Adicional4 codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional4 <> ''
	
union 

	select
	b.Codigo_Adicional5 codigo, left(b.nome, 25) nome, format(a.preco, 'N', 'pt-br') preco
	from Prod_Serv_Precos a
	inner join prod_serv b on a.ordem_prod_serv = b.ordem
	where A.Ordem_Tabela_Preco = 1 and b.Codigo_Adicional5 <> ''
	) as Consulta

-- where codigo =

-- drop  view leitor_barras
