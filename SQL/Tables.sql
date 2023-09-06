-- Mostramos todas las bases de datos
SHOW DATABASES;

-- Si queremos entrar a una base de datos, usuario o tabla en especifico usamos la sentencia USE
USE curso_sql;

-- Para mostrar todas las tablas de nuestro BD
SHOW TABLES;

-- Para mostrar la estructura de una tabla
DESCRIBE usuarios;

-- Para crear una tabla usamos CREATE TABLE y luego el nombre de la tabla, luego abrimos paréntesis y dentro de este ponemos los campos que tendrá nuestra tabla, cada campo lo separamos con una coma, luego cerramos el paréntesis y ponemos el punto y coma para terminar la sentencia
CREATE TABLE usuarios(nombre VARCHAR(50), correo VARCHAR(50));

-- Para agregar una columna a una tabla usamos ALTER TABLE lo cual nos permite modificar la estructura de una tabla, luego ponemos el nombre de la tabla, luego ADD COLUMN y luego el nombre de la columna y el tipo de dato que tendrá
ALTER TABLE usuarios ADD COLUMN years INT;

-- Para modificar el tipo de dato de una columna usamos ALTER TABLE, luego ponemos el nombre de la tabla, luego MODIFY  y luego el nombre de la columna y el nuevo tipo de dato
ALTER TABLE usuarios MODIFY years DATE;

-- Para renombrar una columna usamos ALTER TABLE, luego ponemos el nombre de la tabla, luego RENAME COLUMN y luego el actual nombre de la columna y el nuevo nombre que tendrá
ALTER TABLE usuarios RENAME COLUMN years TO nacimiento;

-- Para eliminar una columna usamos ALTER TABLE, luego ponemos el nombre de la tabla, luego DROP COLUMN y luego el nombre de la columna que queremos eliminar
ALTER TABLE usuarios DROP COLUMN nacimiento;

-- De esta forma eliminamos nuestra tabla, esto hará que nos salte una alerta, la cual es importante ya que podríamos eliminar datos importantes para nuestros usuarios o para nosotros
DROP TABLE usuarios;

-- A los atributos que pasamos en los paréntesis podemos agregarles algunas propiedades 

--NOT NULL, esto hará que el campo no pueda ser nulo, es decir, que siempre tenga que tener un valor, si no le pasamos esta propiedad, por defecto el campo puede ser nulo

-- UNSIGNED esto hará que el campo no pueda ser negativo, es decir, que solo pueda tener valores positivos

-- AUTO_INCREMENT: Cada vez que insertemos un nuevo registro, este campo se auto incremente en 1

CREATE TABLE usuarios(
  usuario_id INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  -- Podemos asignar el primary key de dos formas, una de ellas es la siguiente, al final de la sentencia poner entre paréntesis el atributo que queremos que sea el primary key
  PRIMARY KEY(usuario_id)
)

-- La otra forma, mas fácil y legible es ponerlo como otra propiedad al atributo
-- Al no especificar el NOT NULL, significa que nuestro atributo es opcional, no es necesario poner el NULL para que pueda serlo
-- Para poner un valor por defecto podemos hacerlo con el DEFAULT y luego el valor que queremos que tenga si no le pasamos nada 

CREATE TABLE usuarios(
  usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(50) UNIQUE,
  direccion VARCHAR(100) DEFAULT "Sin dirección",
  edad INT UNSIGNED DEFAULT 0
);

DESCRIBE usuarios;