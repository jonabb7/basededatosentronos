--Procedimientos Almacenados


select * from Customers

--SP para vizualizazar

create proc visualizarClientes
as  
begin
select* from Customers
end
go

Alter proc visualizarClientes
as  
begin
select CompanyName, ContactName from Customers
end
go
--Eliminar SP
Drop proc visualizarClientes

--Ejecutar PS
Exec visualizarClientes 
Execute visualizarClientes 

create proc listarclientesporciudad
@ciudad nvarchar (15)
as  
begin
select* from Customers
where city=@ciudad
end
go

exec listarclientesporciudad 'London'

create proc listarclientespornombre
@nombre nvarchar (40)
as  
begin
select* from Customers
where CompanyName like '''+@nombre +'''
end
go
--Realizar un sp para Calcular el Total de una orden.
create proc Totaldeunaorden
as 
begin
select (unitprice+quantity)
from [Order Details]
end

exec Totaldeunaorden

CREATE PROCEDURE CalcularTotalOrden
    @idOrden INT
AS
BEGIN
    DECLARE @total DECIMAL(10, 2);

    SELECT @total = SUM(UnitPrice * Quantity)
    FROM [Order Details]
    WHERE OrderID = @idOrden

    SELECT @total AS TotalOrden
END

exec CalcularTotalOrden '@total'

Alter PROCEDURE CalcularTotalOrden
    @total int
AS
BEGIN

    SELECT @total= SUM(UnitPrice * Quantity)
    FROM [Order Details]
    WHERE OrderID = @total

END
--Realizar un sp para Actualizar la Cantidad de Productos en Stock

Create proc ActualizarlaCantidaddeProductosenStock

--Realizar un SP que calcule las ventas totales hechas por cada
--empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final

ALTER PROCEDURE CalcularVentasPorEmpleadoYAnio 
    @nombreEmpleado NVARCHAR(50),
    @anioInicial INT,
    @anioFinal INT
AS
BEGIN
    SELECT 
        e.FirstName + ' ' + e.LastName AS NombreEmpleado,
        YEAR(o.OrderDate) AS Anio,
        SUM(od.UnitPrice * od.Quantity  ) AS VentasTotales
    FROM 
        Employees e
    INNER JOIN 
        Orders o ON e.EmployeeID = o.EmployeeID
    INNER JOIN 
        [Order Details] od ON o.OrderID = od.OrderID
    WHERE 
        e.FirstName + ' ' + e.LastName = @nombreEmpleado
        AND YEAR(o.OrderDate) BETWEEN @anioInicial AND @anioFinal
    GROUP BY 
        e.FirstName, e.LastName, YEAR(o.OrderDate)
    ORDER BY 
        e.FirstName, e.LastName, YEAR(o.OrderDate)
END

EXEC CalcularVentasPorEmpleadoYAnio 'Nancy Davolio', 1990,1998

select * from Employees

--crear y  sp que Muestre el precio
--promedio de los productos dentro de cada categoría, incluyendo solo aquellas
--categorías cuyo precio promedio de producto supere el precio enviado en el store procedure
Create proc MostrarPrecioPromedioPorCategoria
    @precioMinimo MONEY
As
BEGIN
    SELECT 
        c.CategoryName AS Categoria,
        AVG(p.UnitPrice) AS PrecioPromedio
    FROM 
        Products p
    INNER JOIN 
        Categories c ON p.CategoryID = c.CategoryID
    GROUP BY 
        c.CategoryName
    HAVING 
        AVG(p.UnitPrice) > @precioMinimo
    ORDER BY 
        PrecioPromedio DESC
END

EXEC MostrarPrecioPromedioPorCategoria @precioMinimo = 50.00

