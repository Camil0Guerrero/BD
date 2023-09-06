-- Columnas Calculadas
SELECT nombre, precio, cantidad, (precio * cantidad) AS ganancia FROM productos;


-- Funciones de Agrupamiento
SELECT MAX(precio) AS precio_maximo FROM productos;

SELECT MIN(precio) AS precio_minimo FROM productos;

SELECT SUM(cantidad) AS existencias FROM productos;

-- avg = average = promedio
SELECT AVG(precio) AS precio_promedio FROM productos;

SELECT COUNT(*) AS total_productos FROM productos;

-- Esto no se puede hacer sin nada mas, ya que las funciones o se hacen solas o se hacen agrupadas
SELECT precio, MAX(precio) AS precio_maximo FROM productos;


/* GROUP BY */
-- Esta cláusula nos ayuda a agrupar los datos de una columna en específico. 

-- Sintaxis: 

-- SELECT columna1, columna2, columna3, ... FROM tabla GROUP BY columna1, columna2, columna3, ...;

SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio, nombre;

-- En esta sentencia estamos agrupando cuantos signos tenemos y cuantos caballeros tienen cada uno de ellos
-- En este caso estamos usando el COUNT para contar cuantos signos tenemos, es como que toma los datos que van llegando y verifica si uno anterior lo tenia
SELECT signo, COUNT(*) AS total FROM caballeros GROUP BY signo;  

SELECT armadura, COUNT(*) AS total FROM caballeros GROUP BY armadura;

SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango;

SELECT pais, COUNT(*) AS total FROM caballeros GROUP BY  pais;

SELECT ejercito, COUNT(*) AS total FROM caballeros GROUP BY ejercito;

/* HAVING  */
-- Es parecida a la clausula WHERE en las funciones de agrupamiento, pero esta se usa para filtrar los datos que se agrupan con GROUP BY

-- Sintaxis: 

-- SELECT columna1, columna2, columna3, ... FROM tabla GROUP BY columna1, columna2, columna3, ... HAVING condicion;

-- Si queremos poner las condiciones con el WHERE debemos hacerlo antes de la clausula GROUP BY

-- No posible: 
SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango WHERE ejercito = "Athena";

-- Posible:
SELECT rango, COUNT(*) AS total FROM caballeros WHERE ejercito = "Athena" GROUP BY rango;


-- Sin embargo, usar WHERE tiene algunas limitaciones, ya que no podremos hacer comparaciones con los datos que se crean con las funciones de agrupamiento. Ya que estos se crean con la sentencia, y WHERE esta diseñado para usarse con las columnas de la tabla que no sean dinámicos.

-- Cuando usamos las funciones de agrupamiento lo mejor y mas aconsejado es usar la clausula HAVING
-- Al contrario también es lo mismo, si no usamos funciones de agrupamiento, lo mejor es usar WHERE

SELECT rango, COUNT(*) AS total FROM caballeros WHERE ejercito = "Athena" GROUP BY rango HAVING total > 4;

SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio, nombre HAVING precio >= 10000;


/* DISTINCT -> Distinto */ 
-- Esta clausula nos sirve para eliminar los datos duplicados de una consulta, en JavaScript seria el Set

SELECT DISTINCT signo FROM caballeros;
SELECT DISTINCT armadura FROM caballeros;
SELECT DISTINCT ejercito FROM caballeros;
SELECT DISTINCT rango FROM caballeros;
SELECT DISTINCT pais FROM caballeros;


/* ORDER BY */ 
-- Nos permite ordenar nuestros datos a partir de un criterio en específico, ya sea de forma ascendente o descendente
-- Esta clausula debe estar siempre al final de nuestra sentencia

-- Si no ponemos nada en nuestra consulta, los registros se mostraran como los hemos insertado en nuestra tabla
SELECT * FROM caballeros;

-- Por ejemplo, ordenarlos alfabéticamente por el nombre
SELECT * FROM caballeros ORDER BY nombre ASC;

-- Para hacerlo de forma descendente tan solo agregamos luego de nuestra clausula el DESC
SELECT * FROM caballeros ORDER BY nombre DESC;

-- Podemos ordenar por mas de una columna, tan solo las pasamos separadas por comas
-- Luego de ordenar por la primera columna, se ordenara por la segunda, es decir, si se encuentran mas de un registro con el mismo nombre, se ordenaran por el signo, por defecto este parámetro es la llave primaria o el id
SELECT * FROM caballeros ORDER BY nombre, signo DESC;

-- Cuando queremos el orden de forma ascendente, no es necesario especificarlo
SELECT * FROM caballeros ORDER BY nombre, armadura;

-- Ejemplo para recordar que nuestra clausula ORDER BY debe ir al final de nuestra sentencia
SELECT * FROM caballeros ORDER BY nombre, armadura WHERE ejercito = "Athena";

-- De la forma anterior no funciona, ya que la clausula ORDER BY debe ir al final de nuestra sentencia, como de la siguiente manera: 
SELECT * FROM caballeros WHERE ejercito = "Athena" ORDER BY nombre, armadura;

-- Esta clausula también nos sirve en todas las sentencias
SELECT ejercito, COUNT(*) AS total FROM caballeros GROUP BY ejercito ORDER BY ejercito DESC;

SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio, nombre HAVING precio >= 2000 ORDER BY precio ASC;


/* BETWEEN */ 

-- Nos permite traer registros a partir de un rango de valores
-- Sintaxis:

-- SELECT * FROM tabla WHERE columna BETWEEN valor1 AND valor2;

SELECT * FROM productos;

-- El BETWEEN seria lo mismo de poner dos condicionales con el AND
SELECT * FROM productos WHERE precio >= 5000 AND precio <= 15000;

-- Pero tenemos una mejor forma ya que nos vuelve mas legible nuestra sentencia 
SELECT * FROM productos WHERE precio BETWEEN 5000 AND 15000;

/* REGEXP */
-- Nos permite hacer búsquedas de patrones en nuestros registros

SELECT * FROM productos WHERE nombre REGEXP '[a-z]';
SELECT * FROM productos WHERE descripcion REGEXP '[0-9]';