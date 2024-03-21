--iner join
use NORTHWND
--Selecionar las ordenes, el nombre del cliente y la fecha
Select orderid, CompanyName ,OrderDate 
from Orders as o
inner join Customers as c
on c.CustomerID= o.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrandoel nombre de la compania
Select CompanyName ,count (*) as 'total' 
from Orders as o
inner join Customers as c
on c.CustomerID= o.CustomerID 
group by CompanyName
order by 2 desc
--Selecionar el numero de producto, el nombre del producto y el mombre de la categoria, ordenados de forma ascedente con respecto al nombre de la categoria
Select productsid,count (*) as 'total' 
from Orders as o
inner join Customers as c
on c.CustomerID= o.CustomerID 
group by CompanyName
order by 2 desc

--Selecionar todas las ordenes de compra
--Mostrando las fechas ordenes de compra 
--Nombre del shipper y el nombre al cliente
--Al que se le vendio (inner joi)
select c.CompanyName as 'Cliente',
o.OrderDate as 'Fecha de orden',
s.CompanyName as 'Nombre flete'
from 
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

--Selecionar el nombre del produto y su categoria
Select p.ProductName as 'Nobre de productos',
c.CategoryName as 'Nombre de catogria'
from 
Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID

--Listar el nombre del cliente ,la fecha de la orden,
--los nombres de los productos que fueron vendidos
select c.CompanyName, o.OrderDate, p.ProductName
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Selecionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe
Select CONCAT(e.FirstName, '', e.LastName) as 'Nombre completo',p.ProductName as 'Descripcion', 
od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
--Selecionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero de suiza,alemania y fracia
Select CONCAT(e.FirstName, '', e.LastName) as 'Nombre completo',p.ProductName as 'Descripcion', 
od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where o.ShipCountry in ('France', 'Germany','switzerland')
--Selecionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero de suiza,alemania y fracia
--Agrupados por la cantidad total de ordenes hechas por los empleados
-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')

-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

-- Seleccionar el numero de ordenes enviadas a alemania,
-- suiza y francia, agrupadas por el empleado y el pais de envio
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

--seleccionar solo las ordenes hechas por Andrew Fuller a los paises francia, alemania y suiza

select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') and e.EmployeeID = 2
order by 1


--seleccionar el total de dinero que se le ha
--vendido a cada uno de los clientes 
-- de 1996

select c.CompanyName as 'Cliente', 
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) = '1996'
group by CompanyName
Order by 2 desc


--seleccionar el total de dinero que se le ha
--vendido a cada uno de los clientes 
-- por cada año

select c.CompanyName as 'Cliente', year(o.OrderDate) as 'Años Transcurridos',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) in (1996, 1997, 1998)
group by CompanyName, year(o.OrderDate)
Order by 1 asc


--seleccionar el importe total que se ha vendido por categoria de productos

select ca.CategoryName as 'Categoria',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner Join Products as pr
on pr.ProductID = od.ProductID
inner join Categories as ca
on ca.CategoryID = pr.CategoryID
group by ca.CategoryName
Order by 1 asc

--seleccionar el importe total que se ha vendido por categoria y nombre del producto 
--que me permita visualizar el producto mas vendido

select pr.ProductName as 'Nombre del Producto', ca.CategoryName as 'Categoria',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner Join Products as pr
on pr.ProductID = od.ProductID
inner join Categories as ca
on ca.CategoryID = pr.CategoryID
group by ProductName, ca.CategoryName
Order by 1 asc