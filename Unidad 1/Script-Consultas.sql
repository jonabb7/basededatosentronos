--Consultas de Agregados 
--Careteristicas principales es que devuelven un solo registro 

--top y precent 

--Seleciona las primeras 10 ordenes de compra 
Select top 10 * from Orders
--Ultimos 10
Select top 10 * from Orders
order by OrderID desc

Select top 10 CustomerID as 'Numero de cliente', orderDate as 'Fecha de orden' ShipCountry as 'Pais de Entrega'from Orders
order by OrderID desc

--Selecionar el 50% delos registros
Select top 50 percent * from Orders

Select top 25 percent * from Orders

--Selecionar los primeros 3 clientes de alemania

Select top 3 *from Customers
where Country ='germany'

Select top 3 CompanyName as 'clente', Country as pais, *from Customers
where Country ='germany'

--Selecionar el producto con un precio mayor
Select * from Products
order by UnitPrice desc

--Muetra el precio mas alto de los productos (max)
select max (UnitPrice)  as 'Precio Maxiomo' from Products
--Muetra el precio minimo 
select min (UnitPrice)  as 'Precio Minimo' from Products

--Seleccionar todas las ordenes de compra
Select * from Orders

--Selecionar el total de ordenes (Count)
Select count (*) as 'Total' from Orders

Select count (ShipRegion) as 'Total' from Orders

--Selecionar todas las ordenes donde la region de envio no sea null
 Select COUNT (*) From Orders
 where ShipRegion is not null

 --Selecionar de forma ascedente los productos por precio
 Select * from Products
 order by UnitPrice

 --Selecionar el nuemero de precios de los productos 
 Select count(distinct Unitprice) from Products

 --Contar todos los diferentes paises de los clientes
 Select count( distinct Country) as 'pAIS' from Customers
 --Selecionar la suma total de cnatidades de las ordenes 
 select sum(Quantity) from [Order Details]

 select * ,(UnitPrice*Quantity) as 'Importe'from [Order Details]


 --Selecionar tododos los registros de orders details calculando su importe
 -- (Campo calculado)
 
 --Selecionar el total en dinero que ha vendido la empresa

 select sum(UnitPrice*Quantity)as 'Total' from [Order Details]

 --seleccionar el total de venta del producto chang

 select sum(UnitPrice*Quantity) as 'Total Vendido' from [Order Details]
 where ProductID = 2 

 --seelccionar el promedio de los precios de los productos
select avg(UnitPrice) as'Promedio de los precios de produtos' from Products

--seeleccionar el promedio y el total de los productos 41, 61 y 31
select sum(UnitPrice * Quantity) as 'Total', AVG(UnitPrice * Quantity)
from [Order Details]
where ProductID = 41  or ProductID = 61 or ProductID = 31 

--seleccionar el numero de orndenes realizadas entre 1996 y 1997
select count(*) from Orders
where OrderDate>='1996-01-01' and OrderDate<='1997-12-31'

select count(*) from Orders
where OrderDate between '1996-01-01' and '1997-12-31'

select year(OrderDate) from Orders

select count(*) from Orders
where year(OrderDate)='1996'

select count(*) from Orders
where year(OrderDate)in('1996', '1997')

select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

-- instruccion group by
-- sleeccionar el numero de clientes agrupados por pais

select Country, count(*) as 'TotalClientes'
from Customers Group by Country

--other

select Country, count(*) as 'TotalClientes'
from Customers Group by Country
order by 1 desc

--seleccionar el numero de ordenes enviadas por el ShipperName

select ShipVia, count (*) as 'Numero de ordenes'
from Orders Group by ShipVia

--Ejemplo de inner join

select s.CompanyName as 'Nombre Compañia', count(*) as 'Total'
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName