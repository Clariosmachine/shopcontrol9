select
    Codigo,
    Nome,

    case
    when Apelido is null
    then Nome
    else Apelido
    end Fantasia,

    Endereco,

    case
        when numero = '00000'  or (numero is null) or (numero like '%N%')
        then 'SN'
        else numero
    end Numero,

    Complemento,
    Bairro,
    Cidade,
    UF,

    case
        when CEP is null  or (CEP = '')
        then '57300000'
        else
        replace((replace(CEP, '-', '')), '.', '')
    end CEP,

    case

        when Telefone1 = '(00)0000-0000' or (Telefone1 is null)
        then ''
        else Telefone1
    end Telefone1,

    case
        when Telefone2 = '(00)0000-0000' or (Telefone2 is null)
        then ''
        else Telefone2
    end Telefone2,

    case
        when Celular = '(00)0000-0000' or (Celular is null)
        then ''
        else Celular
    end Celular,

    case
        when email = '@hotmail.com' or (email is null)
        then ''
        else email
    end Email,

    replace(replace((replace(CPF, '.', '')), '-', ''), '/', '') CPF_CNPJ,

    case
    when RG = 'ISENTO' or (RG is null)
    then ''
    else replace(RG, '-', '')
    end IE,

    case
    when Tipo = 1
    then 'F'
    else 'J'
    end Tipo,

    Limite

from C000007 cli

