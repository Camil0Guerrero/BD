-- La sentencia select nos sirve para traer información de la Base de Datos

-- Estructura
SELECT campos_a_traer FROM tabla_a_consultar WHERE condicion_a_cumplir;

-- Ejemplos 
-- Con el * haremos que traiga todos los campos de la tabla
SELECT * FROM usuarios;

SELECT nombre, edad, usuario_id FROM usuarios;

-- Podemos usar la función count para saber cuantos registros hay en la tabla, igualmente podemos pasar los demás campos para que los cuente
SELECT COUNT(*) FROM usuarios;

-- Para cuando estamos usando funciones para tomar datos calculados o dinámicos, podemos usar el AS para darle un alias al campo

SELECT COUNT(*) AS total_usuarios FROM usuarios;

-- Para agregar un filtro a la consulta, usamos el WHERE. Esta es una clausula condicional y podemos usarla en combinación con operadores condicionales u operadores lógicos

/* WHERE */

-- De esta forma traeremos un registro en particular, esto también lo podemos hacer con los id's o incluso en combinación con otros que lo veré mas adelante
-- En estos casos es necesario que el valor sea exactamente igual (excepto las mayúsculas y minúsculas) al de la base de datos, si no, no lo encontrará
SELECT * FROM usuarios WHERE nombre = 'John';

/* WHERE IN */ 

-- Esta sentencia se utiliza para traer varios registros, seguido de la sentencia IN le pasamos entre paréntesis los valores que queremos traer, separados por comas
SELECT * FROM usuarios WHERE nombre IN ('John', 'kenai', 'irma');

/* LIKE */ 

-- Esta clausula nos ayuda a buscar registros que contengan una palabra o parte de ella, para esto usamos el operador % que nos ayuda a buscar cualquier coincidencia

-- Buscar con el carácter inicial
SELECT * FROM usuarios WHERE apellidos LIKE "M%";

-- Buscar con el carácter final
SELECT * FROM usuarios WHERE correo LIKE '%gmail.com';

-- En este caso no importa si la palabra está al inicio o al final, si la contiene la traerá
SELECT * FROM usuarios WHERE nombre LIKE '%it%';

/* NOT LIKE */ 
-- Esta clausula nos ayuda a buscar registros que no contengan una palabra o parte de ella, es la contraparte de LIKE

SELECT * FROM usuarios WHERE apellidos NOT LIKE "M%";

-- No traerá los registros que tengan gmail.com ni los que no tengan el correo  
SELECT * FROM usuarios WHERE correo NOT LIKE '%gmail.com';

SELECT * FROM usuarios WHERE nombre NOT LIKE '%it%';
