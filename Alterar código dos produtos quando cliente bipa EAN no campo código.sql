/* 
select 
  ordem, 
  codigo, 
  nome 
from prod_serv 
where len(codigo) >6
*/

update 
  prod_serv 
set codigo = ordem - 6819
where len(codigo) >6

-- substituir "- 6819" algum valor que queira que o código pegue ou retirar para ficar igual à ordem.
