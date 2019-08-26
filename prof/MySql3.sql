Use curso1;

-- Deshabilito el modo seguro de modificacion
SET SQL_SAFE_UPDATES = 0;

-- ------------------------------------------------------------
-- Elimino TODOS los registros junto con su referencia
-- ------------------------------------------------------------
truncate table facturas;

-- ------------------------------------------------------------
-- Elimino TODOS los registros solamente
-- ------------------------------------------------------------
delete from facturas;

-- -------------------------------------------------------------
-- Eliminacion de registros
-- -------------------------------------------------------------
delete from 
	facturas
where 
	(letra='A' and numero =1)
    and fecha < '3017-01-09';
    
delete from
	facturas 
where letra='B';

truncate table facturas;

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

-- -------------------------------------------------------------------
-- Modificacion de registros
-- -------------------------------------------------------------------

update 
	facturas
set
	monto= 1001, id_cliente=2
where letra='A' and numero=1;



update
	facturas
set
	fecha= date_add(fecha, INTERVAL -1 year);


-- ------------------------------------------------------
-- Funciones de agregado y agrupaciones
-- ------------------------------------------------------
--  Obtengo la cantidad de registros
select 
	count(1) cantidad_registros
from 
	facturas;

-- Obtengo las maxima facturacion
select 
	min(monto) as 'minima facturacion',
	max(monto) as 'maxima facturacion'
from 
	facturas;

-- Obtengo la maxima facturacion por producto
select 
	id_codigo,
    min(monto) as 'minima facturacion',
	max(monto) as 'maxima facturacion'
from 
	facturas
group by id_codigo;


-- Obtengo el promedio de facturacion por producto
select 
	avg(monto) as 'promedio'
from 
	facturas;

-- Obtengo el total de la facturacion
select 
	sum(monto) as 'total facturado'
from 
	facturas;
    
-- Obtengo el total de la facturacion discriminado por id_codigo    
select 
	id_codigo,
	sum(monto) as 'total facturado'
from 
	facturas
group by id_codigo;

-- Obtengo el total de la facturacion discriminado por id_codigo cuando supere los $3000
select 
	id_codigo,
	sum(monto) as 'total facturado'
from 
	facturas
group by id_codigo
having sum(monto)>3000;


-- Obtengo el total de la facturacion discriminado por id_codigo distintos de 4 cuando supere los $3000 
select 
	id_codigo,
	sum(monto*.21) as 'total facturado',
    round(sum(monto*.21),2) as 'total facturado redondeado'
from 
	facturas
where 
	id_codigo <> 4
group by id_codigo
having sum(monto*.21)>3000;

-- Obtengo la cantidad de facturas realizadas por mes
select 
	count(1) as cantidad,
    MONTH(fecha) as mes
from 
	facturas
group by MONTH(fecha);

-- Obtengo la cantidad de facturas realizadas por mes
select 
	count(1) as cantidad,
    month(fecha) as mes,
    year(fecha) as año
from 
	facturas
group by year(fecha), month(fecha);


-- Habilito el modo seguro de modificacion
SET SQL_SAFE_UPDATES = 1;

/**************************************************************************** 
Anexo laboratorio 
                        
                        
-- 1_ Obtener el detalle de factura para el articulo con mayor monto
-- 2_ Obtener el total facturado correspondienta a letra y articulo
-- 3_ obtener el total facturado por articulo cuya total se encuentre entre 2000 y 3000


******************************************************************************/
-- Resultado anexo laboratorio
-- 1
select 
		letra, 
        numero
from 
		facturas
where monto in ( 
						select 
						max(monto)
						from 
						facturas
				) 
--2
select
		letra,
		id_codigo,
		sum(monto)
from 
		facturas
group by 
		letra, id_codigo
    
--3_
select id_codigo,
		sum(monto)
from 
		facturas
group by 
		id_codigo
having 
		sum(monto) between 2000 and 3000