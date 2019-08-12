select form* articulos

select
	id_codigo
    , codigo
    , precio
    , stock
    ,2+2 as Calculo
    ,'hola mundo' as Saludo
    
from
	articulos;
    
select
	id_cliente
    , nombre
    , apellido
from
	clientes
 order by nombre asc, apellido desc
 limit 3;
 
 -- ejericio..
 
 select
	id_cliente
    , nombre
    , apellido
from
	clientes
 order by id_cliente desc
 limit 1;
 -- precio +20 -50 stock != 32 / 37 y el nombre termina con la A 
select
	nombre
    , precio
    , stock
from
	articulos
where -- between 20 and 50; >= <= // not between ;
	precio>20 and precio<50
	and (stock <> 32 or stock <>37);
    
select    
	nombre
from
	articulos
where -- [not] in or en funcion 
	nombre not in ('Pala') 
-- [not] like busqueda con parametros '' // % inicio final // _ caracter

select -- articulos letra A -> XXXX -> A  
	nombre
from
	articulos
where
	nombre like '%a_a%';
    