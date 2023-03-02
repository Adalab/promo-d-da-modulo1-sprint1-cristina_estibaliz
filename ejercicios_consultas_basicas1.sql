/*Como ya explicamos en la lección anterior, durante la ejecución de estas sesiones de pair programming vamos a trabajar 
**sobre la base de datos Northwind. Esta base de datos se basa en una empresa ficticia: Northwind Traders. 
**Contiene información acerca de las transacciones de ventas entre la empresa y sus clientes así como detalles acerca de 
**compras de la empresa a sus proveedores. Los datos que incluye la base de datos son: tablas de inventario, pedidos, 
**clientes, información de las empleadas, etc. Historicamente ha sido la base de muchos tutoriales y libros sobre el 
**aprendizaje y el uso de SQL.
** El día de hoy vamos a realizar ejercicios en los que practicaremos sentencias SQL sencillas usando los operadores 
SELECT, FROM y WHERE. Este tipo de sentencias nos servirán para ir extrayendo información de la base de datos e irla conociendo.*/

/*Ejercicio 1
**Conociendo a las empleadas:
**El objetivo de toda buena jefa (o trabajadora) de una empresa debería ser conocer bien a sus compañeras. 
**Para ello, vamos a diseñar una consulta para obtener una lista con los datos de las empleadas y 
**empleados de la empresa Northwind. Dicha consulta tiene que tener los campos employee_id, last_name y first_name.*/

USE northwind; 

SELECT employee_id, last_name, first_name
FROM employees; 


/* Ejercicio 2
**Conociendo los productos más baratos:
Supongamos que en nuestro primer día en la empresa nos cuentan que la misma se encuentra en un momento de 
reestructuración de su negocio. Nuestras compañeras nos comentan que en estos momentos Northwind tiene 
demasiados productos a la venta, algunos de ellos con escaso éxito entre las clientas.
Nuestro primer encargo es ver aquellos productos (tabla products) cuyos precios por unidad 
se encuentren entre los 0 y 5 dólares, es decir, los productos más baratos.*/

SELECT product_name, unit_price
FROM products
WHERE unit_price <= 5; 

/* Ejercicio 3
**Conociendo los productos de los que queremos maximizar ventas:
** Por otra parte, queremos también conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares
**(unos valores muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro).*/
 
SELECT product_name, unit_price
FROM products
	WHERE unit_price >= 18
    AND unit_price <= 20;

/*Ejercicio 4
**El rango de productos que puede dar más beneficios a la empresa podría ser el de aquellos con un 
**precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. Selecciona los datos de ese rango de productos.*/
   
SELECT product_name, unit_price
FROM products
	WHERE unit_price >= 15
    AND unit_price <= 50; 
    
/*Ejercicio 5
**Conociendo los productos que no tienen precio:
**Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos 
**productos que no tengan precio, porque lo hayan dejado vacio al introducir los datos (NULL).*/

SELECT product_id, unit_price
FROM products
	WHERE unit_price IS NULL; 
   
/*Ejercicio 6
**Comparando productos:
**Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID menor que 10 
**(para tener una muestra significativa pero no tener que ver todos los productos existentes).*/

SELECT product_id, product_name, unit_price
FROM products
	WHERE product_id <= 10 
    AND unit_price <= 15; 
    
/*Ejercicio 7
**Cambiando de operadores:
**Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo invirtiendo el uso de los 
operadores y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 10.*/

SELECT product_id, product_name, unit_price
FROM products
	WHERE product_id > 10 
    AND unit_price > 15; 

/*Ejercicio 8
**Conociendo los paises a los que vendemos:
**A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) 
**para focalizar el negocio en esas regiones y al mismo tiempo crear campañas de marketing para conseguir 
**mejorar en las otras regiones. Realiza una consulta para obtener ese dato.*/

SELECT ship_country
FROM orders;

