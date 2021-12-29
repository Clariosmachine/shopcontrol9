select
    pagar.CODFORNECEDOR Forn_Conta,
    forn.codigo Cod_Forn,
    forn.nome FORNECEDOR,
    forn.cnpj,
    pagar.DATA_EMISSAO,
    pagar.DATA_VENCIMENTO,
    pagar.liquido,

    case
    when pagar.HISTORICO = 'Duplicata a Pagar' and  pagar.notafiscal <> '000000000'
    then pagar.HISTORICO||' - '||pagar.notafiscal
    else pagar.HISTORICO
    end DESCRICAO,

    plano.conta
from C000046 pagar
left join C000009 Forn on pagar.codfornecedor = forn.codigo
left join C000035 plano on pagar.codconta = plano.codigo

where situacao = 1
