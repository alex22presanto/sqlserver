
-- --------------------------------------------------------
-- Ordenamiento de la entidad articulos
-- --------------------------------------------------------         
 select 
		id_cliente,
		nombre, 
        apellido, 
        telefono, 
        mail, 
        fechaNac
from 
		clientes
order by 
		id_cliente; -- ASC - DESC

-- ----------------------------------------------------------------------
-- Acceso a la entidad clientes aplicando buenas practicas y paginacion
-- ---------------------------------------------------------------------- 
select 
		id_cliente,
		nombre, 
        apellido, 
        telefono, 
        mail, 
        fechaNac
from 
		clientes
order by 
		id_cliente desc
limit 2;


select 
		id_cliente,
		nombre, 
        apellido, 
        telefono, 
        mail, 
        fechaNac
from 
		clientes

order by id_cliente
limit 4,2;

select 
		id_cliente,
		nombre, 
        apellido, 
        telefono, 
        mail, 
        fechaNac
from 
		clientes
order by id_cliente
limit 2 offset 6;

-- --------------------------------------------------------
-- Acceso a la entidad articulos con alias y predicado 
-- -------------------------------------------------------- 
select 	
		id_codigo,
		nombre,
		precio,
		stock,
        precio * stock as precio_nominal
from 
		articulos 
where 
		id_codigo>2
        and precio * stock<= 1000
		and precio<>35;
      
-- --------------------------------------------------------
-- Acceso a la entidad articulos con alias y predicado 
-- -------------------------------------------------------- 	
select 	
		id_codigo,
		nombre,
		precio,
		stock
from 
		articulos 
where 	precio between 35.00 and 36.00
		and stock not between 1 and 10;
-- --------------------------------------------------------------
-- Acceso a la entidad articulos y clientes con LIKE - NOT LIKE
-- -------------------------------------------------------------- 
select 	
		id_codigo,
		nombre,
		precio,
		stock
from 
		articulos 
where 
		nombre like '%a%'
	    and nombre not like '%a';
        
select 	
		id_codigo,
		nombre,
		precio,
		stock
from 
		articulos 
where 
		nombre like '%a_a%';
        
select 	
		nombre, 
        apellido, 
        telefono, 
        mail, 
        fechaNac, 
        id_localidad
from 
		clientes 
where 
		mail like 'juan%'
		and mail not like 'juan\_%';
        
-- --------------------------------------------------------
-- Acceso a la entidad articulos con operadores logicos
-- --------------------------------------------------------         
select 	
		id_codigo,
		nombre,
		precio,
		stock
from 
		articulos  
where  
		(nombre ='destornillador' or nombre ='pinza' or nombre ='martillo' )
	    and (stock >0 and stock <=100);
        
-- --------------------------------------------------------
-- Acceso a la entidad articulos con IN - NOT IN
-- --------------------------------------------------------         
select 	
		id_codigo,
		nombre,
		precio,
		stock
from 
		articulos  
where  
		nombre in ('destornillador','pinza','martillo')
		and nombre in ( 	
							select 
									nombre 
							from 
									articulos 
							where 	(nombre ='destornillador' or nombre ='pinza' or nombre ='martillo')
					   )
        and stock not in (28);
  

-- --------------------------------------------------------
-- Acceso a la entidad clientes con NULL Y NOT NULL
-- --------------------------------------------------------  
select 
		nombre,
        apellido
from 
	clientes
where 
	mail is null
	and telefono is not null
-- --------------------------------------------------------------------------------------------------------
-- 												ANEXO
-- --------------------------------------------------------------------------------------------------------
/*

1_ Obtener letra y numero de las facturas emitidas en el mes de febrero cuyo monto supere los $3000
2_ Obtener los datos de los destornilladores y tambien los articulos cuyo nombre finalice en 'a' que posean una existencia mayor o igual a 50 unidades y cuyo precio individual este comprendido en el rango de $20 y $50     
3_ Obtener los clientes cuyo mail contenga el caracter '_' o no se posea esa informacion
4_ Obtner las localidades de Buenos Aires y Entre Rios se requiere dos consultas para este caso

*/