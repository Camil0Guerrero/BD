-- Una transacción, es un conjunto de instrucciones SQL que se pueden ejecutar una tras otra y si en algún momento alguna de estas falla se puede hacer un rollback ya que esta hará los cambios en nuestro BD hasta que todo haya salido bien.
-- Esto es muy importante hacerlo cuando tenemos muchas operaciones en distintas tablas

-- Sintaxis:
-- START TRANSACTION -- de esta forma iniciamos una transacción
--  -- Aquí van todas las operaciones que queremos hacer, todos deben terminar con el ; para que se ejecuten correctamente

-- Cuando terminamos nuestra transacción tenemos dos opciones:
-- ROLLBACK; La usamos para deshacer todos los cambios que se hicieron en la transacción
-- COMMIT -- de esta forma haremos los cambios en nuestra BD

SELECT * FROM frameworks;

-- Ejemplo

START TRANSACTION;
  UPDATE frameworks SET framework = 'Vue.js' WHERE framework_id = 3;
  DELETE FROM frameworks;
  INSERT INTO frameworks VALUES (0, 'Spring', 5, 2);

-- Esta clausula afecta a nuestra tabla como si se hubieran hecho todas las transacciones y luego hacemos todas al contrario, por lo que si agregamos un registro, y por alguna razón esta falla, se deshacen todos los cambios que se hicieron en la transacción, sin embargo, su id se incrementa, por lo que si agregamos otro registro, este tendrá el id que le corresponde 
ROLLBACK;
COMMIT;

SELECT * FROM frameworks;