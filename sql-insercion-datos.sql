CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(45) NOT NULL, 
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla));
     
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT(9) NOT NULL, 
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR (45) NOT NULL,
    ciudad VARCHAR (45) NULL,
    provincia VARCHAR (45) NOT NULL,
    pais VARCHAR (45) NOT NULL,
    codigo_postal VARCHAR (45) NOT NULL,
    PRIMARY KEY (id_cliente));

CREATE TABLE empleados (
	id_empleados INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    tienda VARCHAR (45) NOT NULL,
    salario INT NULL,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleados));

CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT NOT NULL,
    numero_factura VARCHAR(45) NOT NULL, 
    fecha DATE NOT NULL,
    id_empleados INT NOT NULL,
    id_cliente INT,
    id_zapatilla INT,
    PRIMARY KEY (id_factura),
	CONSTRAINT `fk_empleados_facturas`
		FOREIGN KEY (id_empleados) 
        REFERENCES empleados (id_empleados),
        FOREIGN KEY (id_zapatilla)
        REFERENCES zapatillas (id_zapatilla),
        FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        );
        
ALTER TABLE zapatillas
	ADD COLUMN marca VARCHAR(45) NOT NULL;
    
ALTER TABLE zapatillas
	ADD COLUMN talla INT NOT NULL;
    
ALTER TABLE empleados
	MODIFY COLUMN salario FLOAT;
    
ALTER TABLE clientes
	DROP COLUMN pais;
    
ALTER TABLE clientes
	MODIFY codigo_postal INT;
    
ALTER TABLE clientes
	ADD CONSTRAINT `CH_codigo_postal`
    CHECK ((length(codigo_postal) = 5));
    
ALTER TABLE facturas
	ADD COLUMN total FLOAT;
    
INSERT INTO zapatillas(
	modelo, color, marca, talla)
    VALUES ('XQYUN', 'negro', 'Nike', 42),
			('UOPMN', 'rosas', 'Nike', 39),
            ('OPYNT', 'verdes', 'Adidas', 35);

INSERT INTO empleados(
	nombre, tienda, salario, fecha_incorporacion)
    VALUES ('Laura', 'Alcobendas', 25987, '2010-09-03'),
			('Maria', 'Sevilla', NULL, '2001-04-11'),
            ('Esther', 'Oviedo', 30165.98, '2000-11-29');
            
INSERT INTO clientes(
	nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
    VALUES ('Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Mostoles', 'Madrid', 28176),
			('Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
            ('Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);
            
INSERT INTO facturas(
	numero_factura, fecha, id_empleados, id_cliente, id_zapatilla, total)
    VALUES (123, '2001-12-11', 2, 1, 1, 54.98),
			(1234, '2005-05-23', 1, 3, 1, 89.91),
            (12345, '2015-09-18', 3, 3, 2, 76.23);
            
UPDATE zapatillas
	SET color = 'amarillo'
    WHERE id_zapatilla = 2;
    
    
UPDATE clientes
	SET numero_telefono = 123456728
    WHERE id_cliente = 1;
    
UPDATE facturas
	SET total = 89.91
    WHERE id_zapatilla = 2;


UPDATE empleados
	SET tienda = 'La Coruña'
    WHERE id_empleados = 1;
    
    
    
    
    

    
    
            
	

    
    
    

    
    
    
    
    
    
    
    
    
    
    