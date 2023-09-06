
-- Usuarios

CREATE TABLE usuarios (
  usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  edad INT UNSIGNED DEFAULT 0
);

INSERT INTO usuarios (nombre, apellidos, correo, edad) VALUES 
  ("Jon", "MirCha", "jonmircha@gmail.com", 38),
  ("kEnAi", "MirCha", "kenai@gmail.com", 10),
  ("Irma", "Campos", "irma@outlook.com", 38),
  ("Pepito", "Perez", "pepito@hotmail.com", 28),
  ("Macario", "Guzman", "macario@outlook.com", 55);
  ("Rosita", "Juarez", "rosita@yahoo.com", 19),

--
-- Productos

-- El tipo de dato DECIMAL acepta dos parámetros, el primero es la cantidad de dígitos que tendrá y el segundo es la cantidad de decimales, el segundo parámetro se le descuenta al primero

-- Ejemplo: DECIMAL(7,2) acepta 5 dígitos y 2 decimales.
CREATE TABLE productos (
  producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50),
  precio DECIMAL(7,2),
  cantidad INT UNSIGNED
);

INSERT INTO productos (nombre, descripcion, precio, cantidad) VALUES 
  ("Computadora", "Macbook Air M2", 29999.99, 5),
  ("Celular", "Nothing Phone 1", 11999.99, 15),
  ("Cámara Web", "Logitech C920", 1500, 13),
  ("Micrófono", "Blue Yeti", 2500, 19),
  ("Audífonos", "Audífonos Bose", 6500, 10);

--

-- Caballeros del Zodiaco
CREATE TABLE IF NOT EXISTS caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30),
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30)
);

INSERT INTO caballeros (nombre, armadura, rango, signo, ejercito, pais) VALUES 
  ("Seiya", "Pegaso", "Bronce", "Sagitario", "Athena", "Japón"),
  ("Shiryu", "Dragon", "Bronce", "Libra", "Athena", "Japón"),
  ("Hyoga", "Cisne", "Bronce", "Acuario", "Athena", "Rusia"),
  ("Shun", "Andromeda", "Bronce", "Virgo", "Athena", "Japón"),
  ("Ikki", "Fénix", "Bronce", "Leo", "Athena", "Japón"),
  ("Kanon", "Geminis", "Oro", "Geminis", "Athena", "Grecia"),
  ("Saga", "Geminis", "Oro", "Geminis", "Athena", "Grecia"),
  ("Camus", "Acuario", "Oro", "Acuario", "Athena", "Francia"),
  ("Rhadamanthys", "Wyvern", "Espectro", "Escorpión", "Hades", "Inglaterra"),
  ("Kanon", "Dragon Marino", "Marino", "Geminis", "Poseidon", "Grecia"),
  ("Kagaho", "Bennu", "Espectro", "Leo", "Hades", "Rusia");
--

-- Muestra de datos
SELECT * FROM usuarios;
SELECT * FROM productos;
SELECT * FROM caballeros;

-- Descripción

DESCRIBE usuarios;
DESCRIBE productos;
DESCRIBE caballeros;

-- Eliminación de tablas
DROP TABLE usuarios;
DROP TABLE productos;
DROP TABLE caballeros;

-- Reinicio de tablas
TRUNCATE TABLE usuarios;
TRUNCATE TABLE productos;
TRUNCATE TABLE caballeros;


-- Normalización de la tabla caballeros

CREATE TABLE IF NOT EXISTS armaduras (
  armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  armadura VARCHAR(30) NOT NULL
);

INSERT INTO armaduras (armadura) VALUES 
  ('Pegaso'),
  ('Dragon'),
  ('Cisne'),
  ('Andromeda'),
  ('Fénix'),
  ('Geminis'),
  ('Acuario'),
  ('Wyvern'),
  ('Dragon Marino'),
  ('Bennu');
--

CREATE TABLE IF NOT EXISTS  signos (
  signo_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  signo VARCHAR(30) NOT NULL
);

INSERT INTO signos (signo) VALUES 
  ('Aries'),
  ('Tauro'),
  ('Geminis'),
  ('Cancer'),
  ('Leo'),
  ('Virgo'),
  ('Libra'),
  ('Escorpión'),
  ('Sagitario'),
  ('Capricornio'),
  ('Acuario'),
  ('Piscis');
--

CREATE TABLE IF NOT EXISTS rangos (
  rango_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  rango VARCHAR(30) NOT NULL
);

INSERT INTO rangos (rango) VALUES 
  ('Bronce'),
  ('Oro'),
  ('Espectro'),
  ('Marino');
--

CREATE TABLE IF NOT EXISTS ejercitos (
  ejercito_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  ejercito VARCHAR(30) NOT NULL
);


INSERT INTO ejercitos (ejercito) VALUES 
  ('Athena'),
  ('Hades'),
  ('Poseidon');

--


CREATE TABLE IF NOT EXISTS paises (
  pais_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  pais VARCHAR(30) NOT NULL
);

INSERT INTO paises (pais) VALUES 
  ('Japón'),
  ('Rusia'),
  ('Grecia'),
  ('Francia'),
  ('Inglaterra');
--

-- Debemos definir nuestras claves foráneas al final de la creación de nuestra tabla
-- Antes de hacer referencia a estas tablas deben de estar creadas
-- sintaxis:
-- FOREIGN KEY(campo) REFERENCES nombre_tabla(campo_d_referencia);

CREATE TABLE IF NOT EXISTS caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura INT UNSIGNED,
  rango INT UNSIGNED,
  signo INT UNSIGNED,
  ejercito INT UNSIGNED,
  pais INT UNSIGNED,
  FOREIGN KEY(armadura) REFERENCES armaduras(armadura_id),
  FOREIGN KEY(rango) REFERENCES rangos(rango_id),
  FOREIGN KEY(signo) REFERENCES signos(signo_id),
  FOREIGN KEY(ejercito) REFERENCES ejercitos(ejercito_id),
  FOREIGN KEY(pais) REFERENCES paises(pais_id)
);

INSERT INTO caballeros (nombre, armadura, rango, signo, ejercito, pais) VALUES 
  ( "Seiya", 1, 1, 9, 1, 1 ),
  ( "Shiryu", 2, 1, 7, 1, 1 ),
  ( "Hyoga", 3, 1, 11, 1, 2 ),
  ( "Shun", 4, 1, 6, 1, 1 ),
  ( "Ikki", 5, 1, 5, 1, 1 ),
  ( "Kanon", 6, 2, 3, 1, 3 ),
  ( "Saga", 6, 2, 3, 1, 3 ),
  ( "Camus", 7, 2, 11, 1, 4 ),
  ( "Rhadamanthys", 8, 3, 8, 2, 5 ),
  ( "Kanon", 9, 4, 3, 3, 3 ),
  ( "Kagaho", 10, 3, 5, 2, 2 );
--

SELECT * FROM caballeros;

SHOW TABLES;
DESCRIBE caballeros;