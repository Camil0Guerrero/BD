-- 5. En este caso haremos una suposición del modelado de la BD de Instagram en sus inicios

USE practices;

-- Creación de tablas

CREATE TABLE IF NOT EXISTS follows(
  follow_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  follow_user INT UNSIGNED NOT NULL,
  following_user INT UNSIGNED NOT NULL,
  FOREIGN KEY (follow_user) REFERENCES users_MirchaGram(user_id),
  FOREIGN KEY (following_user) REFERENCES users_MirchaGram(user_id)
);

-- El plot es el texto que acompaña a la foto
CREATE TABLE IF NOT EXISTS posts(
  post_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  plot TEXT,
  photo VARCHAR(255),
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users_MirchaGram(user_id)
);

CREATE TABLE IF NOT EXISTS hearts(
  heart_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  heart_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  post_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts(post_id),
  FOREIGN KEY (user_id) REFERENCES users_MirchaGram(user_id)
);

CREATE TABLE IF NOT EXISTS comments(
  comment_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  comment TEXT,
  post_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts(post_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Tabla principal
CREATE TABLE IF NOT EXISTS users_MirchaGram(
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password BLOB NOT NULL,
  phone VARCHAR(20) NOT NULL UNIQUE,
  bio VARCHAR(255) DEFAULT 'Without bio',
  web VARCHAR(50),
  avatar VARCHAR(255) DEFAULT 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
  birthdate DATE,
  genre ENUM('Masculino', 'Femenino', 'No Binario'),
  country INT UNSIGNED NOT NULL,
  FOREIGN KEY (country) REFERENCES countries(id_country)
);

-- Inserción de datos

-- En el ejercicio de las maratones de Jon ya había creado esta tabla, por que la reutilizo
INSERT INTO countries (name) VALUES 
  ('Colombia');

SELECT * FROM countries;

INSERT INTO users_MirchaGram (user_name, email, password, phone, bio, web, avatar, birthdate, genre, country) VALUES 
  ('Camilo', 'Camilo@gmail.com', AES_ENCRYPT('Camilo123', 'Camilo'), '3112312349', 'Developer', 'www.camilo.com.co', NULL, '2000-01-01', 'Masculino', 6);

-- Igualmente tenemos varias opciones para hacer con estas tablas, yo tan solo pondré un ejemplo, sin embargo, también podemos hacer otros como los likes y los seguidores

INSERT INTO posts (plot, photo, user_id) VALUES 
  ('Mi primera foto', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg', 1),
  ('Mi segunda foto', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg', 1),
  ('Mi tercera foto', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg', 1);

INSERT INTO comments(comment, post_id, user_id) VALUES 
  ('Que bonita foto', 1, 1),
  ('Que bonita foto', 2, 1),
  ('Que bonita foto', 3, 1);


-- Para obtener la información de nuestras tablas podemos hacerlo de la siguiente manera:
SELECT comment, p.plot, u.user_name FROM comments c 
  INNER JOIN users_MirchaGram u ON c.user_id = u.user_id 
  INNER JOIN posts p ON c.post_id = p.post_id;