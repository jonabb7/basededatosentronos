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
create table empleado(
idempleado int not null,
nombre varchar (50) not null,
apellidos varchar (80),
sexo char (1) not null,
salario decimal (10,2),
constraint pk_empleado
primary key (idempleado),
constraint chk_salario
check(salario>400 and salario<=50000),
)
go
drop table empleado

create table venta (
idventa int not null,
constraint pk_venta
primary key (idventa),
fecha date not null,
idcliente int not null,
constraint fk_venta_cliente
foreign key (idcliente)
references cliente (idcliente),
idempleado int not null,
constraint fk_venta_empleado
foreign key(idempleado)
references empleado(idempleado)
)
go

create table producto(
idProducto int not null,
descripcion varchar (50) not null,
exitencia int not null,
precioUnitario decimal (10,2),
constraint pk_producto
primary key (idProducto),
constraint unique_descrip
unique (descripcion)
)
go

CREATE TABLE detalleventa (
idventa int not null,
cantidad int not null,
idProducto int not null,
constraint pk_detalle 
primary key (idventa, idProducto),

precio decimal (10,2) not null,
foreign key (idventa) references venta(idventa),
)
go

