-- Con 'INSERT INTO' podemos agregar registros a una tabla

-- Sin embargo, esta tiene distintas opciones que podemos utilizar


/* 1. */

-- MALA PRACTICA

-- Podemos poner el id como 0 ya que hemos dicho que este valor se debe incrementar automáticamente
-- De estas forma tenemos que insertar todos los campos de la tabla, incluso los que no son obligatorios si es que uno de los siguientes campos lo es

INSERT INTO usuarios VALUES (0, 'John', 'Mircha', 'jonmircha@gmail.com', 'direccion de mircha', 38);


/* 2. */

-- UNA MEJOR OPCIÓN

-- De esta forma tenemos mas control de los campos que vamos a estar insertando en la tabla, por ejemplo, en este caso no insertamos los campos que no sean obligatorios

-- Ademas, podemos cambiar el orden de los campos que vamos a insertar
INSERT INTO usuarios ( apellidos, edad, nombre) VALUES ('Mircha', 10, 'kEnAi');

/* 3. */

-- OTRA OPCIÓN 

-- Esta es menos usada pero también es valida

INSERT INTO usuarios SET nombre = 'Irma', apellidos = 'campos', edad = 38;

-- Para agregar mas de un registro a la vez podemos hacerlo de la siguiente forma: 

-- debemos separar cada registro con una coma
-- Y en el ultimo registro no debemos poner la coma sino el punto y coma para finalizar la sentencia

INSERT INTO usuarios (nombre, apellidos, correo, edad) VALUES
 ("Pepito", "Perez", "pepito@gmail.com", 28),
 ("Rosita", "Juarez", "rosita@gmail.com", 19),
 ("Macario", "Guzman", "macario@gmail.com", 55);

-- Si queremos traer todos los registros de la tabla usuarios podemos hacerlo con:
-- También podemos poner en lugar del '*' que es para traer todos los campos, el nombre de los campos que queremos traer

SELECT * FROM usuarios;