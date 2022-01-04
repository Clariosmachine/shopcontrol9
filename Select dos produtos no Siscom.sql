select
    prod.codigo,
    prod.codbarra,
    prod.produto,
    
    case
        when
        grupo.codigo is not null
        then grupo.codigo
        else 9999
    end cod_grupo,
    
    case
        when
        grupo.grupo is not null
        then grupo.grupo
        else 'outros'
    end grupo,
    
    round (prod.precovenda, 2) P_Venda, -- Arredondamento para duas casas decimais
    round (prod.precocusto, 2) P_Custo,
    est.estoque_atual,
    prod.unidade,
    prod.estoque,
    prod.aliquota,
    prod.cst,
    prod.CSOSN,
    prod.classificacao_fiscal NCM,
    prod.CEST
from C000025 prod
left join C000017 grupo on prod.codgrupo = grupo.codigo
left join c000100 est on est.codproduto = prod.codigo and est.codfilial = 000783 -- Confirmar codigo da filial na tabela c000100
where situacao = 0 and tipo = 'VENDA'

