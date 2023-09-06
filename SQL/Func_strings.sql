-- Funciones de Cadenas de Texto

SELECT ('Hola Mundo');

-- Poner en minúsculas una cadena de texto
SELECT LOWER('Hola Mundo');
SELECT LCASE('Hola Mundo')

-- Poner en mayúsculas una cadena de texto
SELECT UPPER('Hola Mundo');
SELECT UCASE('Hola Mundo');

-- Extraer una parte de una cadena de texto
-- Desde la izquierda hasta el carácter que pasamos como segundo parámetro
SELECT LEFT('Hola Mundo', 5);

-- Comenzar desde la derecha
SELECT RIGHT('Hola Mundo', 5);

-- Obtener la longitud de una cadena de texto
SELECT LENGTH('Hola Mundo');

-- Repetir una cadena de texto n cantidad de veces
SELECT REPEAT('Hola Mundo', 3);

-- Dar la vuelta a una cadena de texto
SELECT REVERSE('Hola Mundo');

-- Reemplazar ciertos caracteres de una cadena de texto
-- Sintaxis: REPLACE(cadena, caracter_a_reemplazar, caracter_reemplazo);
SELECT REPLACE('Hola Mundo', 'o', 'x');

-- Eliminar los espacios 
-- Izquierda
SELECT LTRIM('    Hola Mundo   ');

-- Derecha
SELECT RTRIM('    Hola Mundo   ');

-- De ambos lados
SELECT TRIM('    Hola Mundo   ');

-- Concatenar cadenas de texto
-- Sintaxis: CONCAT(cadena1, cadena2, cadena3, ...);
SELECT CONCAT('Hola Mundo', ' desde ', 'SQL');

-- Concatenar cadenas de texto con un separador, el primer parámetro es el separador y por cada palabra que posemos lo concatenara
SELECT CONCAT_WS('-', 'Hola', 'Mundo', 'desde', 'SQL');

-- Todas estas sentencias se pueden aplicar a todas nuestras sentencias SQL

SELECT UPPER(nombre), LOWER(descripcion), precio FROM productos;