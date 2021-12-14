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
	) -- Essa parte traz uma todos os CPF´s que não estão em branco e têm mais de uma ocorrência.
order by nome

		--select
		--	convert(char, CPF_Limpo),
		--	count(*) Cad_repetidos
		--from cli_for where CPF_Limpo <> ''
		--group by CPF_Limpo
		--having count(*) > 1