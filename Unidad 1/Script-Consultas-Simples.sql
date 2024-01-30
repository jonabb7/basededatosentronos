--Consultas simples con select - sql-lmd
use NORTHWND
--Seleccionar todosl os clientes 
select * from Customers

--Selecionar el nombre del cliente contacto y ciudad
Select CompanyName, ContactName, City from Customers

--Selecionar todos los paise de los clientes (destinct)
select Country from Customers

Select distinct country from Customers

--Seleciona el nuemero de paieses de donde son mis clientes (Count)
Select count (*) from Customers

Select count (Country) from Customers

Select count (distinct Country) from Customers

--Distinct quita valores repitidos 

--Sellecionar el cliente que tenga id 1
Select * from Customers
where CustomerID = 'ANTON'

--Selecionar todos los clienntes de Mexico 
Select * from Customers
Where Country ='Mexico'

--Selecionar todos los registros de los clientes de berlin 
Select * from Customers
Where City='Berlin'
-- Order by

--Seleccionar todos los productos ordenados por precio
Select * from Products
order by UnitPrice

--Selecionar todos los productos ordenados por el precio de mayor a menor
Select * from Products
order by UnitPrice DESC

--Selecionar todods los productos Alfabiticamente
Select * from Products
order by ProductName

Select * from Products
order by ProductName DESC

--Selecionar  todoos los clientes por pais y dentro por nombre de forma ascedente
Select Country,CompanyName,City from Customers
order by Country des, CompanyName desc

--Operador AND
--Selecionar todoos los clientes de españa y que su nombre comince co G
Select * from Customers
where Country ='Spain' and CompanyName Like 'G%'

--Selecionar todos los clientes de berlin, alemania con codigo postal mayor a 1200
Select * from Customers
where Country ='germany' and  city='Berlin' and PostalCode > 1200

--Seleccionar todos los clientes de españa que su nombre empiece con g o con r
Select * from Customers 
where Country= 'Spain' and (CompanyName like 'G%'OR CompanyName like 'R%')

--Clausala or
--Selecionar todos los clientes de alemania o españa
Select * from Customers
where Country = 'Germany' or Country='Spain'

--Selecionar todos los clientes de berlin o de noruega o que comiencen su nombre con G
Select * from Customers
where City= 'Berlin' or City = 'Norway' or CompanyName like 'G%'

--Selecionar todos los clientes que no son de españa 
Select * From Customers
where not Country ='Spain'

--Selecionar todos los productos , que no tengan un precio entre 18 y 20 dolares
Select * From Products
where not (UnitPrice >=18 and UnitPrice<=20)

Select * from Products
 where UnitPrice not between 18 and 20

 --Selecionar todos los cliente que no son de paris  o de londeres

 Select* from Customers
 Where not (City ='Paris' or City ='London')

 Select * from Customers
 where City not in ('Paris','London')

 --Selecionar todos los productos que no tienen precios mayores a 30
 Select * From Products
where not UnitPrice >'30' 

  --Selecionar todos los productos que no tienen precios menor a 30
  Select * From Products
where not UnitPrice <'30' 

--Instruccion LIKE

--Seleccionar toods los clientes que comiensan con la letra A
Select * from Customers
where CompanyName like 'A%'

--Seleccionar todos los clientes que finalizan con la palabra 'es'
Select * from Customers
where CompanyName like '%es'
--Seleccionar todos los clientes que contengan la palbra 'mer'
Select * from Customers
where CompanyName like '%mer%'

--Selecionar todos los clientes con una ciudad que comience con cualquier caracter seguido de la plabra ondon
Select * from Customers
where City like '_ondon'
--Selecionar todos los clientes con una ciudad que comience con L y seguido de tres cualquiera caracteres y que termine con la palabra "on"
Select * from Customers
where City like 'L___on'

--Seleccionar todos los productos que comiencen con la "a"c"t"
Select * from Products
Where ProductName like '[act]%'
--Seleccionar todos los productos que comiencen de la letra b ala g
Select * from Products
Where ProductName like '[b-g]%'
--Seleccionar todolos los clientes de alemania,francia,espana y reino unido
Select * from Customers
where Country in ('Germany','Spain','uk')

--not in
--Selecionar todos los clientes que no son de alemania, españa y reino unido
Select * from Customers
where Country not in ('Germany','Spain','uk')

select * from Customers
where not (Country ='germany'
or Country='spain'
or Country='uk')

--Intruccion between
--Selecionar todos los productos con un precio entre 10 y 20 dolares
Select * from Products
 where UnitPrice  between 10 and 20

--Alias de columnas y Alias de tablas
--Selecionar el nombre del producto, su stock y su precio

Select ProductName as 'Nombre de producto',
UnitsInStock as existencia, UnitPrice from Products

Select ProductName as 'Nombre de producto',
UnitsInStock as existencia, UnitPrice from Products

