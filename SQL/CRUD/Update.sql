-- Para la actualización de un registro se utiliza la palabra UPDATE seguido del nombre de la tabla, luego SET y los campos que se van a actualizar y por último WHERE y la condición que debe cumplir el registro a actualizar.

-- Si hacemos el UPDATE sin el WHERE se actualizarán todos los registros de la tabla, por lo que borraremos todos los datos de la tabla.

UPDATE [dbo].SET [campos_actualizado] WHERE [condicion];

UPDATE usuarios SET correo = "irma@gmail.com", direccion = "direccion de irma" WHERE usuario_id = 3;


-- Ejemplo de UPDATE sin WHERE, esto es muy importante no hacerlo ya que SQL no sabe a que registro va a afectar, por lo que afectara a todos

UPDATE usuarios SET direccion = "nueva dirección";

SELECT * FROM usuarios;