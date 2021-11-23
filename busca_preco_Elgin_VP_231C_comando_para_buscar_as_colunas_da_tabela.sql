Select 
	b.codigo_barras, 
	b.nome, 
	cast ((a.preco) as varchar) Preco 
from Prod_Serv_Precos a 
left join prod_serv b on a.ordem_prod_serv = b.ordem 
where ordem_tabela_preco = 1