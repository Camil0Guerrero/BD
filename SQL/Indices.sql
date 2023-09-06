-- Indicies
-- Los indices son una estructura de datos que permite acceder a los datos de una tabla de forma rápida, declarar indicies en nuestras BD es muy importante porque nos puede mejorar la velocidad a la que hacemos búsquedas

-- Principalmente tenemos 3: 
  -- Campos únicos 
  -- LLaves primarias
  -- Indices personalizados

-- Esto se nota mas cuando tenemos una gran cantidad de datos, tal vez en las pequeñas BD no se note mucho la diferencia, sin embargo, lo mejor es hacerlo desde el principio ya que haremos nuestro producto escalable y no tendremos que preocuparnos por eso en un futuro

-- Los indices ocupan espacio de disco duro en nuestra BD pero precisamente en esto consiste, en sacrificar espacio para ganar velocidad, ya que va a tener como una referencia rápido para que cuando hagamos nuestra sentencia sepan donde se haya la referencia a la que queremos acceder

-- Para ver los indices de una tabla:

SHOW INDEX FROM usuarios;

-- En ocasiones tendremos la necesidad de agregar un indice a un campo de nuestra tabla sin que sea único a llave primaria, por llo es que podemos customized nuestros indices, en la mayoría de los casos y un ejemplo que se ve mucho es cuando queremos hacer búsquedas en un campo de manera recurrente  
DROP TABLE IF EXISTS caballeros;
TRUNCATE TABLE caballeros;

-- Para crear nuestro propios indices debemos hacerlo en la definición de la tabla de nuestra BD
-- Para los indices personalizados tenemos que agregar la palabra INDEX y el nombre que le queramos dar a nuestro indice, (la buena practica es iniciar el nombre con la i_ y el nombre del campo al que le queremos agregar el indice), por ultimo pasamos entre paréntesis el nombre del campo al que nos queremos referir
CREATE TABLE IF NOT EXISTS caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30) UNIQUE,
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30),
  INDEX i_rango (rango),
  INDEX i_signo (signo), 
  -- También podemos crear un indice y en tener dentro varios campos a los que queremos hacer referencia, esto es lo que normalmente se hace para no complicar la lógica de la BD 
  -- Cuando tenemos un indice que almacena varios campos, lo recomendado es poner el nombre de la tabla ya que se entiende que es el único indice que esta tendrá
  INDEX i_caballeros (ejercito, pais),
  -- Tenemos otro tipo de index, el usado para las búsquedas, este es el FULLTEXT, este tipo de index solo se puede usar en campos de tipo texto, y hará un SELECT especial en los campos que hemos definido, este indice demando un poco mas de memoria y capacidad, por lo que no debemos de abusar de el
  -- El nombre de este indice se acostumbra anteponerle el fi_
  FULLTEXT INDEX fi_search (armadura, rango, signo, ejercito, pais)
);

INSERT INTO caballeros (nombre, armadura, rango, signo, ejercito, pais) VALUES 
  ("Seiya", "Pegaso", "Bronce", "Sagitario", "Athena", "Japón"),
  ("Shiryu", "Dragon", "Bronce", "Libra", "Athena", "Japón"),
  ("Hyoga", "Cisne", "Bronce", "Acuario", "Athena", "Rusia"),
  ("Shun", "Andromeda", "Bronce", "Virgo", "Athena", "Japón"),
  ("Ikki", "Fénix", "Bronce", "Leo", "Athena", "Japón"),
  ("Kanon", "Géminis", "Oro", "Géminis", "Athena", "Grecia"),
  ("Saga", "Junini", "Oro", "Junini", "Athena", "Grecia"),
  ("Camus", "Acuario", "Oro", "Acuario", "Athena", "Francia"),
  ("Rhadamanthys", "Wyvern", "Espectro", "Escorpión Oro", "Hades", "Inglaterra"),
  ("Kanon", "Dragon Marino", "Marino", "Geminis Oro", "Poseidon", "Grecia"),
  ("Kagaho", "Bennu", "Espectro", "Leo", "Hades", "Rusia");
--

SELECT * FROM caballeros;

SELECT * FROM caballeros WHERE signo = "Leo";

-- Si queremos hacer un query de tipo buscador: 
-- Sintaxis: 
-- SELECT * FROM nombre_tabla WHERE MATCH(nombre_campo1, nombre_campo2, ...) AGAINST('valor a buscar');

-- El IN BOOLEAN MODE es para que nos de resultados mas exactos

SELECT * FROM caballeros WHERE MATCH(armadura, rango, signo, ejercito, pais) AGAINST('oro' IN BOOLEAN MODE);

SHOW INDEX FROM caballeros;

-- Agregar un index a una tabla existente
-- Sintaxis:
-- Constraint para las llaves primarias y los campos únicos
-- ALTER TABLE nombre_tabla ADD CONSTAINT nombre_indice (nombre_campo);

-- index para los indices 
-- ALTER TABLE nombre_tabla ADD INDEX nombre_indice (nombre_campo);

-- Agregar llave primaria
ALTER TABLE caballeros ADD CONSTRAINT pk_caballero_id PRIMARY KEY (caballero_id);

-- Agregar AUTO_INCREMENT
ALTER TABLE caballeros MODIFY COLUMN caballero_id INT AUTO_INCREMENT;

ALTER TABLE caballeros ADD CONSTRAINT uq_armadura UNIQUE (armadura);

ALTER TABLE caballeros ADD INDEX i_rango (rango);

ALTER TABLE caballeros ADD INDEX i_ejercito_pais (ejercito, pais);

-- Para los FULLTEXT tan solo tenemos que anteponerlo al INDEX
ALTER TABLE caballeros ADD FULLTEXT INDEX fi_search (nombre, signo);

-- Para eliminar un index
-- Para los campos únicos y la llave principal debemos hacer uso de CONSTRAINT

-- No es buena idea eliminar la llave principal de nuestra tabla
ALTER TABLE caballeros DROP CONSTRAINT pk_caballero_id;

ALTER TABLE caballeros DROP CONSTRAINT uq_armadura;

ALTER TABLE caballeros DROP INDEX i_rango;

ALTER TABLE caballeros DROP INDEX i_ejercito_pais;

ALTER TABLE caballeros DROP INDEX fi_search;

DESCRIBE caballeros;
SHOW INDEX FROM caballeros;