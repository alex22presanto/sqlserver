select * from facturas where letra='A' and numero=1;
select * from clientes where id_cliente=1;
select * from articulos where id_codigo=1;
select * from localidades where id_localidad=1;
select * from provincias where id_provincia=1;

-- Alias en el select
select precio*1.21 as iva  from articulos;


-- forma vieja
select 
	f.letra
    ,f.numero
    ,c.nombre
    ,c.apellido
    ,l.localidad
    ,p.provincia
from 
	facturas    	as f
	,clientes  		as c
	,articulos 		as a
	,localidades 	as l 
	,provincias 	as p
where 
	f.id_cliente=c.id_cliente
    and f.id_codigo=a.id_codigo
    and c.id_localidad=l.id_localidad
    and l.id_provincia=p.id_provincia;
    
    
-- forma nueva
select 
	f.letra
    ,f.numero
    ,c.nombre
    ,c.apellido
    ,l.localidad
    ,p.provincia
from 
	facturas    			as f
    
	inner join clientes  	as c
    on f.id_cliente=c.id_cliente
    
    inner join articulos 	as a
    on f.id_codigo=a.id_codigo
    
	inner join localidades 	as l 
    on c.id_localidad=l.id_localidad
    
	inner join provincias 	as p
	on l.id_provincia=p.id_provincia;
    
    
-- obtener nombre y apellido de los clientes que viven en avellaneda
select 
		c.nombre
        ,c.apellido
from 
	clientes c
    
    inner join localidades l
    on c.id_localidad=l.id_localidad
where 
	l.localidad='Avellaneda';
    
-- Obtener nombre, apellido y telefono de los clientes que compraron
select 
		c.nombre
        ,c.apellido
        ,c.telefono
from 
	clientes c
    
    inner join facturas f
    on c.id_cliente=f.id_cliente;
    
-- Obtener las localidades de la provincia de Buenos Aires
select 
	l.localidad
from 
	localidades l
    
    inner join provincias p
    on l.id_provincia=p.id_provincia
where 
	p.provincia='Buenos Aires';
    

-- Obtener los clientes de Avellaneda que compraron por montos mayor a $100.
select 
	c.*
from 
	clientes c
    
    inner join localidades l
    on c.id_localidad=l.id_localidad
    
    inner join facturas f
    on c.id_cliente=f.id_cliente
where
	l.localidad='Avellaneda'
    and f.monto>100;
    
    
