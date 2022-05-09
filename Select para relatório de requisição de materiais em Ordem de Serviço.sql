declare @numero int;
set @numero = :ordem_de_servico;  -- Parametro do ReportBuilder

declare @minAntes int;
set @minAntes = :min_antes;  -- Parametro do ReportBuilder
/* Parametro min_antes, que esta desabilidado no momento, travado com valor 1.
Se preciso, esse parametro pode ser habilitado para aumentar o intervalo de busca em minutos */

declare @dataHora smalldatetime;
set @dataHora = (
  select 
      max(convert(smalldatetime, Data_Efetivacao_Estoque))  /* Momento da ultima efetivacao de estoque de produto na OS */
  from Movimento_Prod_Serv mov
  inner join Movimento_Ordem_Servico O_S on mov.Ordem_Movimento = O_S.Ordem_Movimento
  inner join Prod_Serv prod on prod.Ordem = mov.Ordem_Prod_Serv and prod.Tipo = 'N'
  where 
  	O_S.Numero = @numero
  and
  	mov.Linha_Excluida = 0
);

select
  o_s.Numero Numero_OS,
	mov.ordem orderm_movimento_prod_serv,
	mov.Ordem_Movimento,
	mov.Ordem_Prod_Serv,
	prod.codigo,
	prod.nome,
	convert(datetime, mov.Data_Efetivacao_Estoque) data_efet,
	mov.Data_Alteracao,
	mov.Linha_Excluida,
	mov.Quantidade,
	mov.Preco_Final,
	mov.Ordem_Funcionario_Digitado_Por,
	usuario.Codigo cod_user,
	usuario.Nome nome_user,
	mov.Ordem_Vendedor,
	vendedor.codigo cod_vend,
	vendedor.nome vendedor
from Movimento_Prod_Serv mov

inner join Movimento_Ordem_Servico O_S on mov.Ordem_Movimento = O_S.Ordem_Movimento
inner join Prod_Serv prod on prod.Ordem = mov.Ordem_Prod_Serv and prod.Tipo = 'N' -- exclui os serviços
inner join Funcionarios usuario on usuario.Ordem = mov.Ordem_Funcionario_Digitado_Por -- usuário logado
inner join Funcionarios vendedor on vendedor.Ordem = mov.Ordem_Vendedor -- vendedor

where 
    O_S.Numero = @numero
and
	(
    convert(smalldatetime, mov.Data_Efetivacao_Estoque)
        between 
            (convert(smalldatetime, dateadd(mi, -@minAntes, @dataHora))) /* momento da ultima efetivacao menos @minAntes, em minutos */ 
        and 
            @dataHora
	)
and
	mov.Linha_Excluida = 0