-- El lenguaje CQL (Cassandra Query Language) es un lenguaje de consulta similar a SQL por ello puse esta extension, por supuesto que tienen algunas diferencias pero es muy similar.

-- Cluster: Es un conjunto de nodos que se comunican entre si.
-- Keyspace: Es un conjunto de column families, es como una base de datos en SQL

DESC KEYSPACES; -- Muestra los keyspaces que tenemos en el cluster

-- Muy parecida o la que hacemos en SQL
USE keyspace_name; -- Selecciona el keyspace que vamos a utilizar

-- En este caso vamos a acceder al que cree
-- Esto podemos verlo en la terminal donde estemos ejecutando el servidor de cassandra ya que nos muestra el keyspace que estamos utilizando
USE camilo;

-- Para describir nuestras tablas
-- En SQL es SHOW TABLES;
DESC TABLES;

-- Para el crud haremos el mismo ejercicio de redis, una simulación de una red social que guardaremos los usuarios y sus publicaciones  

-- El UUID es un tipo de dato que nos genera un id único

-- Creación de tablas

CREATE TABLE users (
  user_id UUID PRIMARY KEY,
  username TEXT,
  email TEXT,
  password TEXT,
  full_name TEXT
);

-- Esto es lo que nos permite precisamente las BD orientadas a columnas ya que les dan prioridad. Permiten agrupar varios campos dentro de los propósitos para los que vayamos a almacenar la información, en este caso como nuestra tabla va a crear la 'relación' entre el usuario y sus publicaciones, por lo que podemos poner estos dos campos como llaves primarias ya que son los importantes y a partir de estos podemos obtener los demás datos de nuestra tabla. 

CREATE TABLE user_posts(
  user_id UUID,
  post_id UUID,
  post_content TEXT,
  create_at TIMESTAMP,
  PRIMARY KEY (user_id, post_id)
);

-- No es que existan llaves foráneas sino que estamos delimitando las llaves primarias que serán como indices y el orden sera el de importancia a la hora de extraer la información.

CREATE TABLE user_followers(
  user_id UUID,
  follower_id UUID,
  follower_username TEXT,
  PRIMARY KEY (user_id, follower_id)
);

----------
-- CRUD --
----------

-- Insertar datos
-- Es exactamente igual a como lo hacemos en SQL

-- Usuarios

INSERT INTO users (user_id, username, email, password, full_name) VALUES
  (uuid(), 'john_doe', 'john@example.com', 'my_password', 'John Doe' );

INSERT INTO users (user_id, username, email, password, full_name) VALUES
  (uuid(), 'jane_smith', 'jane@example.com', 'secret123', 'Jane Smith');

INSERT INTO users (user_id, username, email, password, full_name) VALUES
  (uuid(), 'alex_wilson', 'alex@example.com', 'alexpass', 'Alex Wilson');

INSERT INTO users (user_id, username, email, password, full_name) VALUES
  (uuid(), 'lisa_johnson', 'lisa@example.com', 'lisa123', 'Lisa Johnson');

INSERT INTO users (user_id, username, email, password, full_name) VALUES
  (uuid(), 'michael_brown', 'michael@example.com', 'michaelpass', 'Michael Brown');

-- Posts

-- Para estos debemos tener en cuenta el uuid que nos dio la BD al momento de insertar los usuarios

-- Usuario 1
INSERT INTO user_posts (user_id, post_id, post_content, create_at) VALUES
  (238f5190-164f-4e8b-a7c0-63dce5ccf2a8, uuid(), 'Hola a todos!', toTimeStamp(now()));

INSERT INTO user_posts (user_id, post_id, post_content, create_at) VALUES
  (238f5190-164f-4e8b-a7c0-63dce5ccf2a8, uuid(), 'Estoy emocionado de unirme a esta comunidad.', toTimeStamp(now()));

-- Usuario 2
INSERT INTO user_posts (user_id, post_id, post_content, create_at) VALUES
  (16635722-2324-404a-9be1-84072803de0e, uuid(), 'Hoy es un hermoso dia.', toTimeStamp(now()));

INSERT INTO user_posts (user_id, post_id, post_content, create_at) VALUES
  (16635722-2324-404a-9be1-84072803de0e, uuid(), 'Compartiendo my ultima experiencia de viaje..', toTimeStamp(now()));

-- Usuario 3
INSERT INTO user_posts (user_id, post_id, post_content, create_at) VALUES
  (31e8468c-3b9e-44fe-86f0-1c80d1fb1320, uuid(), 'Feliz cumpleaños para mi!', toTimeStamp(now()));

-- Select 

-- El select es parecido al de SQL, con algunas peculiaridades

SELECT * FROM users WHERE user_id = 31e8468c-3b9e-44fe-86f0-1c80d1fb1320;

-- Para las queries que puedan traer mucha información debemos marcar un limite para que tengamos un mejor rendimiento
SELECT * FROM users WHERE username = 'john_doe' LIMIT 200 ALLOW FILTERING; 


-- Para el Update y Delete es igual a como estoy acostumbrado en SQL
-- Nunca olvidar el WHERE de ninguna de las dos operaciones

UPDATE users SET email = 'newemail@example.com' WHERE user_id = 31e8468c-3b9e-44fe-86f0-1c80d1fb1320;

DELETE FROM users WHERE user_id = 31e8468c-3b9e-44fe-86f0-1c80d1fb1320;