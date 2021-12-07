update  financeiro_contas 
set ordem_filial = 1 -- Filial de destino
	where pagar_receber = 'R' -- Receber
	and ordem_filial = 2 -- Filial de origem
	and Situacao = 'A' 
	and Data_Quitacao is null 
	and Tipo_Conta = 'R'