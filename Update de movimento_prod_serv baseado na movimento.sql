update Movimento_Prod_Serv
set Data_Passou_Efetivacao_Estoque = movimento.Data_Efetivado_Financeiro
-- Origem do dado
from movimento
inner join
Movimento_Prod_Serv
on
Movimento_prod_serv.ordem_movimento = movimento.ordem 
and Movimento.Tipo_Operacao = 'VND'
-- condição
where 
Movimento_Prod_Serv.Data_Efetivacao_Estoque is not null
and
Movimento_Prod_Serv.ordem > 123
