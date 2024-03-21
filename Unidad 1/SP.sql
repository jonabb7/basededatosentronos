Declare @numero int
Set @numero=10
if @numero>5
begin 
Print ('El nuemuro es mayor a 5')
end
Else 
begin 
Print('El numero es menor o igual a 5')
end

--Realizar codigo transact para determinar si una persona tiene esdad 
--para beber alchol. El codigo debe tener una variable que ddetermine la edad minima
Declare @edadmin int
Declare @edadpersona int
Set @edadmin=18
set @edadpersona=18
if @edadmin<20
begin 
Print ('Edad Pirmitida')
end
Else 
begin 
Print('Edad no permitida')
end

--Solicitar una evaluacion 
declare @calificasion float
set @calificasion = 79.5
if @calificasion <= 100 and @calificasion >= 90.0
	begin
	print ('La calificacion es una A')
end

else if @calificasion >= 80.0 and @calificasion < 90.0
	begin
	print ('La calificacion es una B')
end

else if @calificasion>= 70.0 and @calificasion < 80.0
	begin
	print ('La calificacion es una C')
end
else 
	begin
	print ('La calificacion es Reprobaria')
end

--Solicitar un Salario
declare @salario float
set @salario = 5689
declare @porcemtaje float
declare @salaryfin float
if @salario >= 5000 
begin 
	set	@porcemtaje = @salario * 0.30
	set @salaryfin = @salario + @porcemtaje
	print ('el bono de salario del empleado es de 30%  ' + cast(@porcemtaje as varchar(20)) + ' ' + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else if @salario >= 4000 
begin 
	set	@porcemtaje = @salario * 0.20
	set @salaryfin = @salary + @porcemtaje
	print ('el bono de salario del empleado es de 20%  ' + cast(@porcemtaje as varchar(20)) + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else 
begin
	print('El empleado no tiene ningun tipo de bono, su salario sigue siendo de: ' + cast(@salary as varchar(20)))
end
