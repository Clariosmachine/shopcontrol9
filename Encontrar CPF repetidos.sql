select 
	codigo, 
	nome,
	CPF_Limpo
from cli_for
where cpf_limpo 
	in(
		select
			convert(char, CPF_Limpo)
		from cli_for where CPF_Limpo <> ''
		group by CPF_Limpo
		having count(*) > 1
	) -- Essa parte traz uma todos os CPF�s que n�o est�o em branco e t�m mais de uma ocorr�ncia.
order by nome

		--select
		--	convert(char, CPF_Limpo),
		--	count(*) Cad_repetidos
		--from cli_for where CPF_Limpo <> ''
		--group by CPF_Limpo
		--having count(*) > 1