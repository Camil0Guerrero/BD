-- El delete es la condición mas sencilla de ejecutar, solo debemos tener en cuenta de no olvidar el WHERE cuando la ejecutemos

-- Para eliminar un registro usamos la siguiente sintaxis:

-- DELETE FROM [dbo].[tabla] WHERE [condicion];

DELETE FROM usuarios WHERE usuario_id = 6;

-- Ejemplo de DELETE sin WHERE, esto borrara todos los registros de la tabla, por lo que es muy importante nunca olvidarnos de ella

DELETE FROM usuarios;

SELECT * FROM usuarios;


/* TRUNCATE */

-- Si tenemos la necesidad de reiniciar una tabla no lo debemos hacer con el DELETE, debemos hacer uso de la sentencia TRUNCATE. Para ver la diferencia entre ambas sentencias podemos verlo en el id de los nuevos registros, ya que con el DELETE continuara con el ultimo id que se tenia, mientras que con el TRUNCATE se reiniciara el id

TRUNCATE TABLE usuarios;

SELECT * FROM usuarios;
