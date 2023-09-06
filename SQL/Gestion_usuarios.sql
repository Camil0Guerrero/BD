-- Para crear un usuario en SQL debemos hacerlo con una secuencia definida, es decir, ponemos el nombre del usuario, luego ponemos el separador que casi siempre es @ y luego el nombre del servidor en donde se va a alojar, en nuestro caso, como estamos en el mismo computador usamos localhost, luego ponemos el identificado de la contraseña que es IDENTIFIED BY y luego la contraseña que queremos que tenga el usuario, en nuestro caso usaremos Jm_12345678 ya que he configurado MySQL para que tengamos contraseñas con una seguridad alta, y por ultimo ponemos el punto y coma para terminar la sentencia.

CREATE USER 'jonmircha'@'localhost' IDENTIFIED BY 'Jm_12345678';

-- Creamos una base de datos para nuestro usuario
CREATE DATABASE IF NOT EXISTS para_jonmircha;

-- Para acceder a la base de datos como el usuario que acabamos de crear debemos usar la sentencia USE o con la interfaz de DBeaver. Sin embargo, en este caso lo haremos desde la terminal: 

-- Cuando estamos en el mismo computador podemos omitir el @localhost 

-- Los usuarios que creamos no tendrán todos los privilegios o permisos para nuestra BD
-- mysql -u jonmircha -p y luego ponemos la contraseña

-- Por ejemplo, si luego de entrar a la BD con el usuario jonmircha ejecutamos la sentencia 'SHOW DATABASES' nos saldrán tan solo las que se crean por defecto que son 2

-- Para dar los privilegios a los usuarios usamos GRANT y en forma de array pasamos lqs que le queremos agregar
-- Los privilegios se asignan por base de datos  y si queremos ser mas específicos por tabla

GRANT [privilegios] ON [base de datos].[tabla] TO [usuario]@[servidor];

-- Para darle todos los privilegios a un usuario, hacerlo administrador, usamos ALL PRIVILEGES

GRANT ALL PRIVILEGES ON para_jonmircha.* TO 'jonmircha'@'localhost';

-- Una buena practica luego de dar o quitar privilegios es recargar los privilegios con la sentencia FLUSH PRIVILEGES

FLUSH PRIVILEGES;


-- Para ver los privilegios que tiene un usuario usamos SHOW GRANTS
-- También podemos hacerlo desde la interfaz de DBeaver con doble click en el usuario, de esta forma nos dará una pestaña con lo que podemos hacer o no con el usuario
SHOW GRANTS FOR 'jonmircha'@'localhost';

-- Para quitar o como se le llama en SQL: revocar los los permisos de un usuario usamos REVOKE y en forma de array pasamos los permisos que queremos quitar

REVOKE [privilegios] ON [base de datos].[tabla] TO [usuario]@[servidor];

REVOKE ALL, GRANT OPTION FROM 'jonmircha'@'localhost';

-- Para eliminar un usuario también podemos usar el comando DROP, solo que esta vez debemos usar la sentencia USER

DROP USER 'jonmircha'@'localhost';