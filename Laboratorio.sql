drop database if exists Laboratorios;

create database Laboratorios;

use Laboratorios;

-- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:
-- Letra char y PK
-- Numero integer y PK
-- Fecha date
-- Monto double
-- PK significa Primary Key
-- observar que se está declarando una clave primaria compuesta
-- es decir (letra, código)
-- cada campo por sí solo no es clave, ni tampoco identifica al registro
-- pero la suma de los dos forman la clave

drop table if exists facturas;
Create table facturas
(
	letra 	char,
	Numero	integer,
	Fecha	date,
	Monto 	double,
	Primary key(letra,numero)
);
describe facturas;

-- Crear la tabla Artículos dentro de la base de datos con el siguiente detalle:
-- Codigo integer y PK
-- Nombre varchar (50)
-- Precio double
-- Stock intege
drop table if exists articulos;
create table Articulos
(
	codigo int,
	nombre	varchar(50),
    precio	double,
    stock	int,
    Primary key(codigo)
);
describe Articulos;

show tables;    
-- 3- Cargar 5 registros en la tabla Facturas y Artículo    
insert into facturas (letra, Numero, Fecha, Monto) values ('A', 1, '2018-02-05', 200);
insert into facturas (letra, Numero, Fecha, Monto) values ('A', 2, '2018-02-05', 500);
insert into facturas (letra, Numero, Fecha, Monto) values ('A', 3, '2018-02-05', 1500);
insert into facturas (letra, Numero, Fecha, Monto) values ('B', 1, '2018-02-07', 900);
insert into facturas (letra, Numero, Fecha, Monto) values ('B', 2, '2018-02-07', 600);
insert into facturas (letra, Numero, Fecha, Monto) values ('B', 3, '2018-02-07', 900);
insert into facturas (letra, Numero, Fecha, Monto) values ('C', 1, '2018-02-07', 1900);
insert into facturas (letra, Numero, Fecha, Monto) values ('C', 2, '2018-02-07', 100);
insert into facturas (letra, Numero, Fecha, Monto) values ('C', 3, '2018-02-07', 10);

-- select * from facturas;  

insert into articulos (codigo, nombre, precio, stock) values (1, 'destornillador', 25.25, 50);
insert into articulos (codigo, nombre, precio, stock) values (2, 'pinza'		 , 35.00, 22);
insert into articulos (codigo, nombre, precio, stock) values (3, 'martillo'		 , 15.78, 28);
insert into articulos (codigo, nombre, precio, stock) values (4, 'maza'			 , 35.00, 18);
insert into articulos (codigo, nombre, precio, stock) values (5, 'balde'		 , 55.00, 13);
insert into articulos (codigo, nombre, precio, stock) values (6, 'plomada'		 , 35.00, 100);
insert into articulos (codigo, nombre, precio, stock) values (7, 'pala'			 , 11.00, 15);
  
-- select * from articulos;  


select nombre,precio from articulos where
	precio > 100;

select nombre,precio from articulos where
	precio > 20 and precio <40;
    
select nombre,precio from articulos where
	precio between 40 and 60;
    
select nombre,precio,stock from articulos where
	precio = 20 and stock > 30;

select nombre,precio from articulos where
	precio = 12 or precio = 20 or precio = 40;

select nombre,precio from articulos where
	precio in (12,20,40);
    
select nombre,precio from articulos where
	precio not in (12,20,30);
    
select nombre,precio from articulos 
	order by precio desc, nombre asc; 
    
select nombre,precio,(21*precio/100)+precio as IVA from articulos;

select 
	nombre
	,precio
    ,'3' as 'Cantidad de cuanta'
    ,((precio*5/100)+precio)/3 as 'Valor cuota' 
from articulos;