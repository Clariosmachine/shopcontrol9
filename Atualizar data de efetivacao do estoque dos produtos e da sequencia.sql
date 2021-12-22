-- Criacao da tabela temporaria com os numeros das sequencias
create table
#sequencias (sequencia int)

-- Popular a tabela temporaria com os numeros das sequencias desejadas
-- Informar cada sequencia entre parenteses e colocar a virgula fora, exceto na ultima porque nao tem a virgula
-- Retire esses valores de exemplo abaixo
insert into #sequencias values
	(12825),
	(12829),
	(12830)


-- Update da tabela Movimento_Prod_Serv pra corrigir data de efetivacao do estoque de cada produto que faz parte das sequencias indicadas acima
update Movimento_Prod_Serv
set Data_Efetivacao_Estoque = movimento.Data_Efetivado_Financeiro, Data_Passou_Efetivacao_Estoque = movimento.Data_Efetivado_Financeiro
from movimento
inner join
Movimento_Prod_Serv
on
Movimento_prod_serv.ordem_movimento = movimento.ordem 
and Movimento.Tipo_Operacao = 'VND'
and movimento.Sequencia in (select sequencia from #sequencias)
-- condicao que informa que isso so ira ocorrer em sequencias que tiveram o estoque efetivado
where 
Movimento_Prod_Serv.Data_Efetivacao_Estoque is not null

-- update da tabela Movimento pra corrigir a data de efetivacao do estoque na sequencia
update Movimento
set Data_Efetivado_Estoque = Data_Efetivado_Financeiro	
where Movimento.Data_Efetivado_Estoque is not null
and Movimento.Tipo_Operacao = 'VND'
and Movimento.Sequencia in (select sequencia from #sequencias)
