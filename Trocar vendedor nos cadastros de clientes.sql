update Cli_For
set Ordem_Vendedor = 
	(select ordem from Funcionarios where codigo = xx) -- Substituir por c�digo do vendedor novo
where Ordem_Vendedor = 
	(select ordem from Funcionarios where codigo = xx) -- Substituir por c�digo do vendedor antigo