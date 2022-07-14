declare @tabela1 varchar(20);
set @tabela1 = 'AVISTA';--:tabelaPreco1; -- Parametro do ReportBuilder

declare @tabela2 varchar(20);
set @tabela2 = 'CUSTO';--:tabelaPreco2; -- Parametro do ReportBuilder

select 
	 prod.codigo
	,prod.nome
	,preco1.Preco preco1
	,preco2.Preco preco2
	,concat (case 
		when preco2.preco <> 0 and preco1.preco <> 0 then (((preco1.Preco - preco2.Preco) / preco1.preco)*100)
		-- o calculo acima representa a formula usada pelo shop para se chegar a lucratividade real
		when preco1.preco = 0 then -100
		else 100
	end, '%') lucro_percent

from Prod_Serv prod
inner join Prod_Serv_Precos preco1 on preco1.Ordem_Prod_Serv = prod.ordem and preco1.Ordem_Tabela_Preco = (select ordem from Tabelas_Preco where nome = @tabela1)
inner join Prod_Serv_Precos preco2 on preco2.Ordem_Prod_Serv = prod.ordem and preco2.Ordem_Tabela_Preco = (select ordem from Tabelas_Preco where nome = @tabela2)
