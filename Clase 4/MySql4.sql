Use curso1;

DROP user 'Admin'@'localhost';
CREATE user 'Admin'@'localhost' IDENTIFIED BY '123456789';

GRANT ALL PRIVILEGES ON curso1.articulos TO 'Admin'@'localhost';
FLUSH PRIVILEGES;


REVOKE ALL  ON curso1.articulos FROM 'Admin'@'localhost';
FLUSH PRIVILEGES;


-- --------------------------------------------------------------
-- referencias de la entidad facturas
-- --------------------------------------------------------------
ALTER TABLE facturas
ADD CONSTRAINT fk_articulo
    FOREIGN KEY(id_codigo) REFERENCES articulos(id_codigo);

ALTER TABLE facturas
DROP FOREIGN KEY fk_articulo;
--
ALTER TABLE facturas
ADD CONSTRAINT fk_cliente
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE facturas
DROP FOREIGN KEY fk_cliente;

-- --------------------------------------------------------------
-- referencias de la entidad localidades
-- --------------------------------------------------------------
ALTER TABLE localidades
ADD CONSTRAINT fk_provicia
    FOREIGN KEY(id_provincia) REFERENCES provincias(id_provincia);

ALTER TABLE localidades
DROP FOREIGN KEY fk_provicia;

-- --------------------------------------------------------------
-- referencias de la entidad clientes
-- --------------------------------------------------------------
ALTER TABLE clientes
ADD CONSTRAINT fk_localidad
    FOREIGN KEY(id_localidad) REFERENCES localidades(id_localidad);

ALTER TABLE clientes
DROP FOREIGN KEY fk_localidad;


-- --------------------------------------------------------------
-- Agregado de columnas
-- --------------------------------------------------------------
ALTER TABLE clientes ADD COLUMN obsevaciones VARCHAR(50) NULL;

ALTER TABLE clientes CHANGE obsevaciones observaciones VARCHAR(50) NOT NULL;
        
DESCRIBE clientes;


ALTER TABLE clientes DROP COLUMN observaciones; 

       
# Verifico si existe entidad clientes
DROP TABLE IF EXISTS tiposssss_iva;   
CREATE TABLE tiposssss_iva
(
	id_tipo_iva 	INT UNSIGNED  NOT NULL auto_increment,
    iva				ENUM ('RI','RNI','CF'),
    cuit			VARCHAR(16) NOT NULL UNIQUE KEY,
    PRIMARY KEY	(id_tipo_iva)
);
        
RENAME TABLE tiposssss_iva TO tipos_iva;

        
INSERT INTO tipos_iva (iva,cuit) values ('RI','1');
INSERT INTO tipos_iva (iva,cuit) values ('RNI','2');   
INSERT INTO tipos_iva (iva,cuit) values ('CF','3');
INSERT INTO tipos_iva (iva,cuit) values ('XX','4');
      
      
DROP TABLE IF EXISTS tipos_iva;   
        
-- Deshabilito el modo seguro de modificacion
SET SQL_SAFE_UPDATES = 0;        
 
 






-- anexo 
select *
from 
	clientes 
where id_cliente in (
							select  
								id_cliente
							from 
								facturas 
							group by 
								id_cliente
							having sum(monto)= (
													select 
														max(tot)
													from 
													(	select 
															sum(monto) as tot, 
															id_cliente
														from 
															facturas
														group by 
															id_cliente
													) x      
											   )
					 )
