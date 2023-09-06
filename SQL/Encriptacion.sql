-- En SQL tenemos distintas formas de encriptar datos, esto es mas que todo usado para las contraseñas de nuestros usuarios y asi evitar que si alguien accede a nuestra base de datos pueda verlas.

-- MD5 
-- Esta función convertirá una cadena de texto a un valor de tipo HASH de 128bits (16 bytes) y es irreversible, es decir, no se puede obtener el texto original a partir del HASH.

-- Esta era usada por WordPress hace algunos años, pero ya no es recomendable usarla, ya que es muy fácil de romper. 

SELECT MD5('m1 Sup3r P4$$w0rd');


-- SHA1 
-- Este mecanismo igualmente convierte una cadena de texto a un valor de tipo HASH de hasta 160 bits (20 bytes) y es un poco mas seguro que MD5, pero igualmente no es muy recomendado actualmente.

SELECT SHA1('m1 Sup3r P4$$w0rd');

-- SHA2 
-- Esta nos permite indicar el numero de bits que formara el HASH, a mayor numero de bits mas seguro sera el HASH, pero mas lento sera el proceso.
SELECT SHA2('m1 Sup3r P4$$w0rd', 256);

-- AES_ENCRYPT
-- Esta función nos permite encriptar una cadena de texto usando el algoritmo AES, el cual es un algoritmo de encriptación simétrica, es decir, se usa la misma clave para encriptar y desencriptar.
-- Es como si usáramos un factor de doble autenticación para acceder a nuestra cuenta de correo, donde el usuario ingresa su contraseña y adicionalmente se le envía un código a su celular, el cual debe ingresar para poder acceder a su cuenta.
-- Este es el mecanismo recomendado actualmente

SELECT AES_ENCRYPT('m1 Sup3r P4$$w0rd', 'llave_secreta');

-- AES_DECRYPT
-- Esta función nos permite desencriptar una cadena de texto encriptada con AES_ENCRYPT, usando la misma llave secreta.

SELECT AES_DECRYPT(nobre_campo, llave_secreta) FROM nombre_tabla;


-- EJemplo

CREATE TABLE pagos_recurrentes(
  -- No se ha usado el tipo de dato INT porque no vamos a utilizar este valor para hacer operaciones matemáticas
  cuenta VARCHAR(8) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  -- Lo hemos guardado como BLOB para que no se pueda ver en texto plano
  tarjeta BLOB
);

-- Una buena practica o truco es usar uno de los campos del mismo usuario como llave secreta, por ejemplo, el numero telefónico, el correo, etc. Es importante tener en cuenta que si este campo cambia debemos asegurarnos de actualizar la llave secreta de los registros.
INSERT INTO pagos_recurrentes VALUES
  ('12345678', 'Jon', AES_ENCRYPT('1234567890123488', '12345678')),
  ('12345677', 'Irma', AES_ENCRYPT('1234567890123477', '12345677')),
  ('12345676', 'Kenai', AES_ENCRYPT('1234567890123466', '12345676')),
  ('12345674', 'Kala', AES_ENCRYPT('1234567890123455', 'super_llave')),
  ('12345673', 'Miguel', AES_ENCRYPT('1234567890123444', 'super_llave'));

SELECT * FROM pagos_recurrentes;

-- Casting: un Casting es el cambio de tipo de dato de un valor, por ejemplo, si tenemos un valor de tipo cadena de texto y lo queremos convertir a un valor de tipo entero, podemos hacerlo usando el CAST.

-- Sintaxis:
SELECT CAST(valor AS nuevo_tipo_valor) AS alias FROM tabla;

-- Ejemplo
SELECT CAST(AES_DECRYPT(tarjeta, '1234678') AS CHAR) AS tarjeta, nombre 
  FROM pagos_recurrentes;

SELECT CAST(AES_DECRYPT(tarjeta, 'super_llave ') AS CHAR) AS tarjeta, nombre 
  FROM pagos_recurrentes;
  