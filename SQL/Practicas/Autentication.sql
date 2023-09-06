-- 1. Este es el primer ejercicio de los que se crearon en el curso de modelado de datos de JonMircha
-- En este caso los pasare a nuestra BD

CREATE DATABASE IF NOT EXISTS practices;
USE practices;
SHOW TABLES;

-- Creación de tablas
CREATE TABLE IF NOT EXISTS roles(
  rol_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT
);
--

CREATE TABLE IF NOT EXISTS permissions(
  permission_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT
);
--

-- Tablas pivote 
-- Estas tablas se deben desarrollar cuando tenemos relaciones muchos a muchos ya que nos facilitan la conexión
CREATE TABLE IF NOT EXISTS roles_x_user(
  rxu_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  rol_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--

CREATE TABLE IF NOT EXISTS permissions_x_roles(
  pxr_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  rol_id INT UNSIGNED NOT NULL,
  permission_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (permission_id) REFERENCES permissions(permission_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--

CREATE TABLE IF NOT EXISTS users(
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(20) NOT NULL UNIQUE,
  password BLOB NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  avatar VARCHAR(255) NOT NULL DEFAULT 'default.png',
  active BOOLEAN NOT NULL DEFAULT FALSE,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

DROP TABLE users;
DROP TABLE roles_x_user;

-- Inserción de datos
-- Es importante hacer estas dos de primeras ya que las demás dependen de ellas
INSERT INTO roles(name, description) VALUES
  ('admin', 'You can do everything'),
  ('user', 'You can read our content');

INSERT INTO permissions(name, description) VALUES
  ('create', 'You can insert new data into our database'),
  ('read', 'You can obtain data from our database'),
  ('update', 'You can modify data from our database'),
  ('delete', 'You can remove data from our database'),
  ('all', 'You can do everything');
--

-- Inserción de datos en las tablas pivote
INSERT INTO roles_x_user(user_id, rol_id) VALUES
  (1, 1),
  (2, 2);
--

INSERT INTO permissions_x_roles(rol_id, permission_id) VALUES
  (1, 5),
  (2, 2);
--

SHOW TABLES;

-- Y por ultimo insertaremos la información de nuestra BD que actuara como nodo
-- Como el crear un usuario implica manipular y tomar datos de otras tablas, lo haremos con un stored procedure ya que necesito pasar parámetros

DELIMITER $$
CREATE PROCEDURE sp_create_user(
  IN i_username VARCHAR(20),
  IN i_password VARCHAR(20),
  IN i_email VARCHAR(50),
  IN i_name VARCHAR(50),
  IN i_last_name VARCHAR(50),
  IN i_avatar VARCHAR(255),
  IN i_active BOOLEAN,
  IN i_rol INT,
  OUT res VARCHAR(50)
)

  BEGIN 

    DECLARE client_id INT DEFAULT 0; 
    DECLARE exist_correo INT DEFAULT 0;

    START TRANSACTION;

    SELECT COUNT(*) FROM users WHERE email = i_email INTO exist_correo;

    IF exist_correo <> 0 THEN

      ROLLBACK;
      SELECT 'El correo ya ha sido registrado' INTO res;

    ELSE   

    -- Insertamos los datos a nuestra BD principal
    INSERT INTO users(username, password, email, name, last_name, avatar, active) VALUES
      (i_username, AES_ENCRYPT(i_password, i_email), i_email, i_name, i_last_name, i_avatar, i_active);

    -- Obtenemos el id del cliente que insertamos en la linea anterior
    SELECT LAST_INSERT_ID() INTO client_id;
    
    -- Luego de tener el id de nuestro cliente y el rol que este tendrá en nuestra BD, podemos agregarlo en nuestra otra BD
    INSERT INTO roles_x_user(user_id, rol_id) VALUES
      (client_id, i_rol);

    SELECT 'Usuario creado correctamente' INTO res;
    END IF;

    COMMIT;

  END $$

DELIMITER ;
-- 

-- Para ver si se creo nuestro store procedure
SHOW PROCEDURE STATUS WHERE db = 'practices';

-- Usamos nuestro procedure para crear un usuario
CALL sp_create_user('Camilo', '12345678', 'camilo@gmail.com', 'Camilo', 'Guerrero', 'default.png', TRUE, 1, @res);
SELECT @res;

SELECT * FROM users;
SELECT * FROM roles_x_user;

-- De esta forma podríamos tomar la información que necesitamos de nuestra BD

SELECT username, password, email, permissions.name AS permissions
  FROM users 
  INNER JOIN roles_x_user ON users.user_id = roles_x_user.user_id 
  INNER JOIN permissions_x_roles ON roles_x_user.rol_id = permissions_x_roles.rol_id 
  INNER JOIN permissions ON permissions_x_roles.permission_id = permissions.permission_id;