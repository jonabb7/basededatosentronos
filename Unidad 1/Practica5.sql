--Practica#5

---Crear una tabla con un campo calculado

CREATE DATABASE Practica#4
go

USE Practica#4
go

CREATE TABLE pruebaCalculado(
	id int not null identity (1,1),
	nombre varchar(50),
	precio decimal(10,2) not null,
	existencia int not null,
	importe as
	(precio * existencia),
	constraint pk_pruebacalculado
	primary key (id)
)

select * from pruebaCalculado

insert into pruebaCalculado
values ('chanclotas', 354, 4)