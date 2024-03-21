Use NORTHWND

--Sintaxis
/*
case
when condicion 1 then resultado
when condicion 1 then resultado
when condicion 1 then resultado
else Result
END;
*/

Select *,
          Case
		    when Quantity> 30 THEN 'La cantidad es mayor a 30'
			when Quantity =30 then 'La cantidas es 30'
			ELSE 'La cantida esta debajo de 30'
			END AS CantidadTexto

from [Order Details]

Select *,
      case
	  when UnitsInStock =0  then 'Sin stock'
	  when UnitsInStock between 1 and 20 then 'Stock bajo'
	  when UnitsInStock between 21 and 50 then 'Stock medio'
	  when UnitsInStock >51 and UnitsInStock <=90 then 'Stock Alto'
	  else 'Stock Maximo'
	  end as 'tipo stock'
from Products

create database pruebacase
use pruebacase
create table nuevatabla(
id int not null,
nombre nvarchar (40) not null
unitsinstock smallint,
constraint pk_nuevatabla
primary key(id)
)