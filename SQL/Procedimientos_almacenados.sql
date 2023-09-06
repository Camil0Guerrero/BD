-- Procedimientos almacenados o stored procedures

-- Es un conjunto de instrucciones SQL que se almacenan en la BD como si fuera una función, por lo tanto lo podemos llamar y ejecutar tantas veces como lo necesitemos. Puede recibir parámetros de entrada y retornar estos como una función en cualquier lenguaje de programación

-- Se utilizan para encapsular la lógica de negocio y reducir la complejidad de las aplicaciones en el momento que interactúan con la bD

SHOW TABLES;

CREATE TABLE IF NOT EXISTS suscripciones(
  suscripcion_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  suscripcion VARCHAR(30) NOT NULL,
  costo DECIMAL(5,2) NOT NULL
);

INSERT INTO suscripciones (suscripcion, costo) VALUES
  ('Bronce', 199.99),
  ('Plata', 299.99),
  ('Oro', 399.99);

CREATE TABLE IF NOT EXISTS clientes(
  cliente_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  correo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tarjetas (
  tarjeta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente INT UNSIGNED NOT NULL,
  tarjeta BLOB NOT NULL,
  FOREIGN KEY (cliente) REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS servicios(
  servicio_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente INT UNSIGNED,
  tarjeta INT UNSIGNED,
  suscripcion INT UNSIGNED,
  FOREIGN KEY (cliente) REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY (tarjeta) REFERENCES tarjetas(tarjeta_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY(suscripcion) REFERENCES suscripciones(suscripcion_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

SELECT * FROM suscripciones;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;

-- Sintaxis para crear un procedimiento almacenado
-- En SQL se utilizan los ; para decir hasta donde va nuestra sentencia, sin embargo, en el store procedure vamos a tener varias sentencias y no quedar decir que debe terminar en el ; para ello usamos el DELIMITER, luego de esta sentencia marcaremos el signo que queremos que SQL tome como el final de la sentencia, los símbolos mas comunes para usar son '$$' o '//'

DELIMITER $$

-- De esta forma se crea el procedimiento almacenado
CREATE PROCEDURE nombre_store_procedure() 

  -- La instrucción BEGIN es para definir en donde iniciará el código de nuestro procedure
  BEGIN

  -- >>> Sentencias a ejecutar

  -- Con el END le decimos que termina el código de nuestro procedure, por lo tanto pondremos los signos que hemos definido en el DELIMITER (en nuestro caso '$$')

  END $$ 

  -- Seguido del END pondremos el DELIMITER para decir que termina la creación del procedure, este debe ir con el ; al final, pero debemos hacerlo con un espacio entre la sentencia y el
DELIMITER ;

-- Ejemplo:

-- En VScode no esta habilitada la creación de procedimientos almacenados, aunque lo podemos hacer en DBeaver
DELIMITER $$  
CREATE PROCEDURE sp_obtener_suscripciones()
  BEGIN
    SELECT * FROM suscripciones;
  END $$
DELIMITER ;


-- Para ejecutar o llamar nuestro procedure usamos la sentencia CALL seguido del nombre del procedure
CALL sp_obtener_suscripciones();

-- De esta forma podemos ver los procedimientos almacenados que tenemos en nuestra BD
SHOW PROCEDURE STATUS WHERE db = 'curso_sql';

-- Para eliminar el procedure:
-- OJO sin los paréntesis

DROP PROCEDURE sp_obtener_suscripciones;

-- Parámetros de entrada y salida en los procedimientos almacenados
-- Los parámetros de entrada se definen con la palabra IN, ademas como una buena practica esta anteponer la i y la tabla a la que pertenece el parámetro, por ejemplo: i_tabla_parámetro 
-- Los parámetros de salida se definen con la palabra OUT, igualmente, también podemos agregar la o para diferenciarlo de los demás. A este no es necesario hacerlo de la tabla
-- Estos parámetros se deben definir dentro de las parámetros en la definición de nuestro procedure

DELIMITER $$ 
CREATE PROCEDURE sp_asignar_servicio(
  IN i_suscripcion INT UNSIGNED,
  IN i_nombre VARCHAR(30),
  IN i_correo VARCHAR(50),
  IN i_tarjeta VARCHAR(16),
  OUT o_respuesta VARCHAR(50)
)
  BEGIN 

    -- Si necesitamos declarar variables dentro de nuestro procedure lo hacemos de la siguiente forma
    DECLARE exist_correo INT DEFAULT 0;
    DECLARE cliente_id INT DEFAULT 0;
    DECLARE tarjeta_id INT DEFAULT 0;

    START TRANSACTION;

    -- Con la clausula INTO podemos asignar el resultado de una consulta a una variable
    SELECT COUNT(*) INTO exist_correo 
      FROM clientes WHERE correo = i_correo;

    -- Condicional en SQL
    IF exist_correo <> 0 THEN 
      SELECT 'El correo ya ha sido registrado' INTO o_respuesta; 
    
    ELSE 

      INSERT INTO clientes (nombre, correo) VALUES (i_nombre, i_correo);

      -- De esta forma podemos obtener el id del cliente que acabamos de insertar, ya que esta función nos trae el ultimo id insertado en nuestra BD
      SELECT LAST_INSERT_ID() INTO cliente_id;

      INSERT INTO tarjetas (cliente, tarjeta) 
        VALUES (cliente_id, AES_ENCRYPT(i_tarjeta, cliente_id));

      SELECT LAST_INSERT_ID() INTO tarjeta_id;

      INSERT INTO servicios (cliente, tarjeta, suscripcion) 
      VALUES (cliente_id, tarjeta_id, i_suscripcion);

      SELECT 'Servicio asignado correctamente' INTO o_respuesta;

    -- Finalizamos nuestro IF
    END IF;

    COMMIT;

  END $$
DELIMITER ;


-- Usando nuestro store procedure

SELECT * FROM suscripciones;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;

-- Para declarar una variable fuera de los procedures usamos el @ al igual que en php
-- Nuestra variable tomara el valor de la variable de salida de nuestro procedure en la misma posición
CALL sp_asignar_servicio(3, 'Jon', 'jonmircha@gmail.com', '1234567890123456', @res);
SELECT @res;