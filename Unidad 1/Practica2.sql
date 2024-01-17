--Practica 2
--Creamos base de datos 
CREATE DATABASE practica2
go
use practica2
go
Create table cliente(
idcliente int not null,
nombre varchar (100) not null,
direccion varchar (100)not null,
tel varchar (20)not null,
constraint pk_idcliente
primary key (idcliente),
constraint unique_nombre
unique (nombre)
)
go
create table empelado(
idempleado int not null,
nombre varchar (50) not null,
apellidos varchar (80),
sexo char (1) not null,
salario decimal (10,2),
constraint pk_empleado
primary key (idempleado),
)
go

create table venta (
idventa int not null,
fecha date not null,
constraint fk_venta_cliente
foreign key (idcliente)
constraint fk_venta_empleado

)