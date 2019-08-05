drop database if exists Laboratorio;

create database Laboratorio;

use laboratorio;

create table factura(
	Letra char		not null
	,Numero int 	not null
	,Fecha date		null
	,Monto double	null
    ,primary key (Letra,Numero)
);
create table articulo(
	Codigo integer 		not null
	,Nombre varchar(50) null
	,Precio double		null
	,Stock integer		null
    ,primary key (Codigo)
);
create table cliente(
	Nombre varchar (50)
	,Apellido varchar (50)
	,Cuit char(16) -- xx-xxxxxxxx-x
	,Direccion varchar (50)
);

insert into factura(Letra, Numero,Fecha,Monto) value ('A',12,'2011/4/11',4578.2);
insert into factura(Letra, Numero,Fecha,Monto) value ('A',13,'2011/3/2',412.21);
insert into factura(Letra, Numero,Fecha,Monto) value ('A',14,'2011/4/5',558.7);
insert into factura(Letra, Numero,Fecha,Monto) value ('A',15,'2011/2/7',418.5);
insert into factura(Letra, Numero,Fecha,Monto) value ('A',16,'2011/1/11',1223.2);

select * from factura;

-- insert into articulo(Codigo,
