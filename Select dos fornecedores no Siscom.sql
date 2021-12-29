select
    Codigo,
    Nome,

    case
    when Fantasia is null
    then Nome
    else Fantasia
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
        when Celular1 = '(00)0000-0000' or (Celular1 is null)
        then ''
        else Celular1
    end Celular,

    case
        when email = '@hotmail.com' or (email is null)
        then ''
        else email
    end Email,

    replace(replace((replace(CNPJ, '.', '')), '-', ''), '/', '') CPF_CNPJ,

    case
    when IE = 'ISENTO' or (IE is null)
    then ''
    else replace(IE, '-', '')
    end IE,

    case
    when char_length(CNPJ) = 14
    then 'F'
    else 'J'
    end Tipo

from C000009 fornecedores

