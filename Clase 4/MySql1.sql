-- -------------
-- Motores 

-- InnoDB es una tecnología de almacenamiento de datos de código abierto para la base de datos MySQL,
-- incluido como formato de tabla estándar en todas las distribuciones de MySQL AB a partir de las 
-- versiones 4.0. Su característica principal es que soporta transacciones de tipo ACID y bloqueo de 
-- registros e integridad referencial. InnoDB ofrece una fiabilidad y consistencia muy superior 
-- a MyISAM, la anterior tecnología de tablas de MySQL, si bien el mejor rendimiento de uno u otro 
-- formato dependerá de la aplicación específica.

-- MyISAM
--     Mayor velocidad en general a la hora de recuperar datos.
--     Recomendable para aplicaciones en las que dominan las sentencias SELECT ante los INSERT / UPDATE.
--     Ausencia de características de atomicidad ya que no tiene que hacer comprobaciones de la integridad referencial, ni bloquear las tablas para realizar las operaciones, esto nos lleva como los anteriores puntos a una mayor velocidad.


-- Tipos de datos
-- BIT o BOOL, para un número entero que puede ser 0 ó 1
-- TINYINT es un número entero con rango de valores válidos desde -128 a 127. Si se configura como unsigned (sin signo), el rango de valores es de 0 a 255
-- SMALLINT, para números enteros, con rango desde -32768 a 32767. Si se configura como unsigned, 0 a 65535.
-- MEDIUMINT para números enteros; el rango de valores va desde -8.388608 a 8388607. Si se configura como unsigned, 0 a 16777215
-- INT para almacenar números enteros, en un rango de -2147463848 a 2147483647. Si configuramos este dato como unsigned, el rango es 0 a 4294967295
-- BIGINT número entero con rango de valores desde -9223372036854775808 a 9223372036854775807. Unsigned, desde 0 a 18446744073709551615.
-- FLOAT (m,d) representa números decimales. Podemos especificar cuántos dígitos (m) pueden utilizarse (término también conocido como ancho de pantalla), y cuantos en la parte decimal (d). Mysql redondeará el decimal para ajustarse a la capacidad.
-- DOUBLE Número de coma flotante de precisión doble. Es un tipo de datos igual al anterior cuya única diferencia es el rango numérico que abarca
-- DECIMAL almacena los números como cadenas.
-- 





# Verifico si existe la base de datos curso1
drop database if exists curso1;
# Creo la base de datos curso1
create database curso1;

# Verifico las bases de datos del servidor
show databases;

use curso1;

-- --------------------------------------------------------
-- Estructura de entidad clientes
-- -------------------------------------------------------- 
# Verifico si existe entidad clientes
drop table if exists clientes;
# Creo la entidad clientes
create table clientes 
(
 id_cliente 	integer unsigned NOT NULL auto_increment,
 id_localidad   integer unsigned,
 nombre 		varchar(40),
 apellido 		varchar(100),
 telefono 		varchar(30),
 mail 			varchar(50),
 fechaNac 		date default '0000-00-00',
 PRIMARY KEY  (id_cliente) 
);

-- --------------------------------------------------------
-- Estructura de entidad articulos
-- -------------------------------------------------------- 
# Verifico si existe la entidad articulos
drop table if exists articulos;
# Creo la entidad articulos
create table articulos 
(
  id_codigo		integer 				NOT NULL,
  nombre	 	varchar(50),
  precio		double,
  stock			integer,
  PRIMARY KEY  (id_codigo)
);
-- --------------------------------------------------------
-- Estructura de entidad facturas
-- -------------------------------------------------------- 
# Verifico si existe la entidad facturas
drop table if exists facturas;
# Creo la entidad facturas
create table facturas 
(
  letra	 		    char				NOT NULL,
  numero	 		integer 			NOT NULL,
  id_cliente		integer unsigned 	NOT NULL,
  id_codigo			integer 			NOT NULL,
  fecha	 		    date,
  monto				double,
  PRIMARY KEY  (letra,numero)
);

-- --------------------------------------------------------
-- Estructura de entidad provincias
-- -------------------------------------------------------- 
# Verifico si existe la entidad provincias
drop table if exists provincias;
# Creo la entidad provincias
create table provincias 
(
  id_provincia		integer unsigned 	NOT NULL auto_increment,
  provincia	 		varchar(50), 		
  PRIMARY KEY  (id_provincia)
);

-- --------------------------------------------------------
-- Estructura de entidad localidades
-- -------------------------------------------------------- 
# Verifico si existe la entidad localidades
drop table if exists localidades;
# Creo la entidad localidades
create table localidades 
(
  id_localidad	    integer unsigned 	NOT NULL auto_increment,
  id_provincia		integer unsigned,
  localidad	 		varchar(50), 		

  PRIMARY KEY  (id_localidad)
);

#Verifico las entidades de la base de datos
show tables;


-- --------------------------------------------------------
-- Insercion de clientes forma generica
-- --------------------------------------------------------
-- insert into clientes values (1000, 'Juan', 'Perez', '4358-4787', 'juanperez@gmail.com', '2010-05-24'); 
-- -----------------------------------------------------------------------------
-- Insercion de clientes utilizando buenas practicas, autoincremento y dafault
-- -----------------------------------------------------------------------------
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Juan' , 'Ortega', '4289-2385', 'juan_ortega@gmail.com', default, 1);
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Jose'  , 'Quiroga', '4981-2367', 'josequiroga@gmail.com', '2008-01-01',1);
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Maria' , 'Magdalena', NULL, NULL, '1958-01-01',2);
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Marcos', 'Paz', NULL, NULL, '1932-01-01',2);
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Susana', 'Gomez', '3698-7852', NULL, '1954-03-06',3);
insert into clientes (nombre, apellido, telefono, mail, fechaNac, id_localidad) values ('Juan', 'Perez', '4358-4787', 'juanperez@gmail.com', '2010-05-24',3); 
 
select * from clientes;
-- --------------------------------------------------------
-- Insercion de provincias 
-- -------------------------------------------------------- 
insert into provincias (provincia) values ('Buenos Aires');
insert into provincias (provincia) values ('Cordoba');
insert into provincias (provincia) values ('Entre Rios');

select * from provincias;
-- --------------------------------------------------------
-- Insercion de localidades 
-- -------------------------------------------------------- 
insert into localidades (localidad, id_provincia) values ('Avellaneda', 1);
insert into localidades (localidad, id_provincia) values ('Castelar', 1);
insert into localidades (localidad, id_provincia) values ('San Martin', 1);
insert into localidades (localidad, id_provincia) values ('Capilla del Monte',2);
insert into localidades (localidad, id_provincia) values ('Bell Ville', 2);
insert into localidades (localidad, id_provincia) values ('Villa Carlos Paz', 2);
insert into localidades (localidad, id_provincia) values ('Colon', 3);
insert into localidades (localidad, id_provincia) values ('Villa Elisa', 3);
insert into localidades (localidad, id_provincia) values ('Villa Federacion', 3);

select * from localidades;

-- --------------------------------------------------------
-- Insercion de articulos 
-- -------------------------------------------------------- 
insert into articulos (id_codigo, nombre, precio, stock) values (1,'destornillador',25.25,50);
insert into articulos (id_codigo, nombre, precio, stock) values (2,'pinza'			,35.00,22);
insert into articulos (id_codigo, nombre, precio, stock) values (3,'martillo'		,15.78,28);
insert into articulos (id_codigo, nombre, precio, stock) values (4,'maza'			,35.00,18);
insert into articulos (id_codigo, nombre, precio, stock) values (5,'balde'			,55.00,13);
insert into articulos (id_codigo, nombre, precio, stock) values (6,'plomada'		,35.00,100);
insert into articulos (id_codigo, nombre, precio, stock) values (7,'pala'			,11.00,15);

select * from articulos;

-- --------------------------------------------------------
-- Insercion de facturas 
-- -------------------------------------------------------- 
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 1, 1, 1, '2017-01-01', 1000);	
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 2, 1, 2, '2017-01-03', 3000);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 3, 2, 3, '2017-01-04', 2000);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 4, 2, 4, '2017-01-05', 7000);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 5, 2, 4, '2017-02-01', 2500);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 6, 3, 5, '2017-02-07', 3850);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 7, 4, 5, '2017-03-08', 1600);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 8, 4, 5, '2017-03-09', 1120);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('A', 9, 2, 1, '2017-04-01', 1000);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 1, 5, 6, '2017-01-09', 1641);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 2, 5, 6, '2017-02-09', 999);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 3, 5, 6, '2017-02-10', 25);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 4, 5, 6, '2017-02-11', 39.99);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 5, 5, 6, '2017-03-09', 919);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 6, 5, 6, '2017-03-10', 25);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 7, 5, 6, '2017-04-11', 929.99);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 8, 5, 6, '2017-05-09', 16041);
insert into facturas (letra, numero, id_cliente, id_codigo, fecha, monto) value ('B', 9, 4, 5, '2017-03-01', 1600);

select * from facturas;


-- ---------------------------------------------------------------
-- Compruebo los objetos de la base de datos
-- ---------------------------------------------------------------
describe provincias;
describe localidades;
describe clientes;
describe articulos;
describe facturas;
