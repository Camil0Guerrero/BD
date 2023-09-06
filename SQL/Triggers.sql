-- Los triggers son objetos que se utilizan para ejecutar de forma automática una acción en reacción a ciertos eventos dentro de la BD, seria como el EventListener de JS
-- Estos eventos se van a disparar cuando se llegue a ejecutar dentro de la BD alguna operación que afecte datos, es decir, un insert, un update o un delete.

-- Sintaxis: 

/* 
  DELIMITER $$

  CREATE TRIGGER nombre_trigger
  Le definimos si va a ser antes (BEFORE) o después (AFTER) de que se ejecute la operación INSERT, UPDATE o DELETE la cual definimos inmediatamente luego
  {BEFORE | AFTER} {INSERT | UPDATE | DELETE} ON nombre_tabla

  luego agregamos las sentencias FOR EACH NOW, esta instrucción siempre debe llevarla y lo que le dice a nuestro trigger es que por cada fila que se vea afectada por la operación que definimos anteriormente, se va a ejecutar el código que definamos dentro del trigger

  FOR EACH ROW

  y luego definimos la lógica de nuestro trigger dentro de un bloque BEGIN y END

  BEGIN 
  END $$

  DELIMITER ;
*/

-- Sin comentarios:
/* 
  DELIMITER $$

  CREATE TRIGGER nombre_trigger
  {BEFORE | AFTER} {INSERT | UPDATE | DELETE} ON nombre_tabla
  FOR EACH ROW
  BEGIN 

  END $$

  DELIMITER ;
*/

-- Ejemplo:

CREATE TABLE actividad_clientes(
  ac_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  cliente INT UNSIGNED,
  fecha DATETIME,
  FOREIGN KEY (cliente) REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

SELECT * FROM actividad_clientes;

DELIMITER $$ 
  CREATE TRIGGER tg_actividad_clientes 
    AFTER INSERT ON clientes 
      FOR EACH ROW

  BEGIN 
    -- El objeto NEW nos data todos los valores del evento que se disparo
    -- La función NOW() nos da la fecha y hora actual
    INSERT INTO actividad_clientes (cliente, fecha) VALUES (NEW.cliente_id, NOW());

  END $$
DELIMITER ;


-- Podemos ver los triggers de una BD con la sentencia:

SHOW TRIGGERS FROM nombre_bd;
SHOW TRIGGERS FROM curso_sql;

-- Para eliminar un trigger:
DROP TRIGGER tg_actividad_clientes;


-- Usando nuestro trigger
SELECT * FROM clientes;

SELECT * FROM actividad_clientes;


-- Creamos un nuevo cliente haciendo uso de nuestro procedimiento almacenado
CALL sp_asignar_servicio(2, 'Kenai', 'Kenai@gmail.com', '1234567890123490', @res);
SELECT @res;