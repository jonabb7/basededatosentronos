-- insertar datos a partir de consulta
select * from categoriacopia

insert into categoriacopia(categoriaid,nombre)
select idCategoria, descripcion from Categoria

alter table producto
add constraint pk_producto2
primary key(idproducto)

/*
Sintaxis update 
update nombre tabla
set campo = valor 
where condicion
*/

update producto
set idproducto = 2
where nombre= 'Paleta de pollo'

update producto
set idproducto = 2
where nombre= 'Chilindrina'

--Eliminar regitros de una tabla
 /*
 delate from tabla
 where expresion
 */
 Select * from producto
 delete from producto 
 where idproducto =4
