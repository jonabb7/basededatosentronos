create database pruebatrigger
	idproduct int not null,
	nombreprod varchar (100) not null,
	existencia int not null,
	preiouni decimal (10,2) not null,
	constraint pk_(idproduct)
	primary key (idproduct),
	constraint unique_nombreprod
	unique (nombreprod)

