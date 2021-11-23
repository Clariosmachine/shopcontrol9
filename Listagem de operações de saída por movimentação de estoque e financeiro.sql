
select 
	codigo, 
	nome,
	tipo, 
	case when Movimenta_Estoque = 1 then 'Movimenta Estoque' else 'Não movimenta estoque' end Movimenta_Estoque, 
	case when Momento_Efetiva_Estoque = 'R' then 'Após o financeiro'
	when Momento_Efetiva_Estoque = 'M' then 'Estoque manual'
	when Momento_Efetiva_Estoque = 'G' then 'Ao Gravar Seq.'
	when Momento_Efetiva_Estoque = 'N' then 'Estoque na entrega'
	when Momento_Efetiva_Estoque = 'E' then 'Estoque na expedição'  
	end Momento_Estoque, 
	case when Movimenta_Dinheiro = 1 then 'Movimenta financeiro' else 'Não movimenta financeiro' end Movimenta_Financeiro,
	case when Momento_Efetiva_Financeiro = 'G' then 'Ao gravar'
	when Momento_Efetiva_Financeiro = 'M' then 'Financeiro manual'
	when Momento_Efetiva_Financeiro = 'N' then 'Financeiro na entrega'  
	end Momento_financeiro
from Operacoes
where Inativo = 0
and Entrada_Saida = 'S'
and Momento_Efetiva_Estoque <> ''
and Momento_Efetiva_Financeiro <> ''
order by 2