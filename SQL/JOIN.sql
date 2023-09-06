-- El JOIN hace una agrupación de las coincidencias de las tablas que le especificamos 

-- Sintaxis: 
-- SELECT * FROM tabla1 JOIN tabla2 ON tabla1.campo = tabla2.campo

-- Ejemplo:

-- El LEFT JOIN hará la agrupación de las coincidencias de la tabla de la izquierda, en este caso los caballeros con la derecha de los signos, si el dato que estamos pasando del caballero no esta en la de signos, este no hará la agrupación
-- Nos mostrara toda la tabla de la izquierda y luego complementara la información con la tabla de la derecha

-- En este caso no aparecerán los signos que no estén contemplados en nuestra tabla de la izquierda ya que la toma como principal

-- La c es la forma acortada de poner el alias para usar esta tabla en la misma sentencia de una forma mas cómoda
SELECT * FROM caballeros c 
  LEFT JOIN signos s 
  ON c.signo = s.signo_id;

-- Por supuesto que tiene una contraparte, el RIGHT JOIN, pero en este caso mostrara lo que coincida de las tablas y nos mostrara toda la tabla de la derecha 
-- Podemos ver un ejemplo en los signos, si no tenemos caballeros con algún signo el JOIN completara nuestra primera tabla con NULL

SELECT * FROM caballeros c 
  RIGHT JOIN signos s 
  ON c.signo = s.signo_id;


-- INNER JOIN
-- En este caso, el resultado es muy similar al LEFT JOIN ya que el inner JOIN solamente nos traerá la información que coincida en amabas tablas

SELECT * FROM caballeros c
  INNER JOIN signos s
  ON c.signo = s.signo_id;

-- FULL OUTER JOIN 
-- Hay gestores que no soportan esta clausula ya que esta es como si creáramos una matriz
-- MySQL no soporta el FULL OUTER JOIN, no obstante, podemos simularlo uniendo el LEFT con RIGHT JOIN
-- Para ello usaremos UNION el cual sirve para unir dos consultas

SELECT * FROM caballeros c 
  LEFT JOIN signos s  
  ON c.signo = s.signo_id
  UNION
  SELECT * FROM caballeros c
  RIGHT JOIN signos s
  ON c.signo = s.signo_id;
--

-- Traer la información de tablas a partir de la llave foránea
-- Debemos usar el INNER JOIN ya que nos interesan los registros que aparecen en ambas tablas
SELECT c.caballero_id, c.nombre, a.armadura,
  s.signo, r.rango, e.ejercito, p.pais 
  FROM caballeros c 
  INNER JOIN armaduras a ON c.armadura = a.armadura_id 
  INNER JOIN signos s ON c.signo = s.signo_id
  INNER JOIN rangos r ON c.rango = r.rango_id
  INNER JOIN ejercitos e ON c.ejercito = e.ejercito_id
  INNER JOIN paises p ON c.pais = p.pais_id;

