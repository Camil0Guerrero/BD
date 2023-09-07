-- 3. Ejercicio de un formulario de encuesta

-- Creación de tablas

USE practices;

-- Inicio con las tablas que están mas alejadas o que no tienen dependencias de la principal, esto lo baso en el modelo relacional
-- Sin embargo, al momento de crearlas o ejecutar nuestra sentencia debemos hacerlo desde la tabla principal, en este caso es la de encuestas

-- Encuestados
CREATE TABLE IF NOT EXISTS surveyed (
  surveyed_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age INT UNSIGNED NOT NULL,
  email VARCHAR(100) UNIQUE
);

-- Respuestas
CREATE TABLE IF NOT EXISTS answers (
  answer_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  question_id INT UNSIGNED NOT NULL,
  answer VARCHAR(255) NOT NULL,
  correct BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Resultados
CREATE TABLE IF NOT EXISTS results (
  result_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  survey_id INT UNSIGNED NOT NULL,
  surveyed_id INT UNSIGNED NOT NULL,
  questions INT UNSIGNED NOT NULL,
  corrects INT UNSIGNED NOT NULL,
  FOREIGN KEY (survey_id) REFERENCES surveys(survey_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (surveyed_id) REFERENCES surveyed(surveyed_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Preguntas
CREATE TABLE IF NOT EXISTS questions (
  question_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  survey_id INT UNSIGNED NOT NULL,
  question VARCHAR(255) NOT NULL,
  FOREIGN KEY (survey_id) REFERENCES surveys(survey_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Encuestas
CREATE TABLE IF NOT EXISTS surveys (
  survey_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  image VARCHAR(255) DEFAULT 'default.png',
  date DATETIME NOT NULL DEFAULT NOW(),
  surveyed INT UNSIGNED DEFAULT 0
);
SHOW TABLES FROM practices;

-- Inserción de datos
-- Encuestados
INSERT INTO surveyed (name, last_name, age, email) VALUES
  ('Juan', 'Perez', 20, 'juan@gmail.com'),
  ('Maria', 'Gomez', 25, 'maria@gmail.com'),
  ('Pedro', 'Gonzalez', 30, 'pedro@gmail.com'),
  ('Luis', 'Rodriguez', 35, 'luis@gmail.com'),
  ('Ana', 'Hernandez', 40, 'ana@gmail.com');
--

-- Encuestas
INSERT INTO surveys (name, description, surveyed) VALUES
  ('Encuesta 1', 'Encuesta de prueba 1', 5);

-- Preguntas
INSERT INTO questions (survey_id, question) VALUES 
  (1, '¿Cuál es la capital de México?'),
  (1, '¿Cuál es la capital de Colombia?'),
  (1, '¿Cuál es la capital de Argentina?'),
  (1, '¿Cuál es la capital de Brasil?'),
  (1, '¿Cuál es la capital de Chile?');
--

-- Respuestas
INSERT INTO answers (question_id, answer, correct) VALUES
  (1, 'Ciudad de México', TRUE),
  (1, 'Bogotá', FALSE),
  (1, 'Buenos Aires', FALSE),
  (1, 'Brasilia', FALSE),
  (1, 'Santiago', FALSE),
  (2, 'Ciudad de México', FALSE),
  (2, 'Bogotá', TRUE),
  (2, 'Buenos Aires', FALSE),
  (2, 'Brasilia', FALSE),
  (2, 'Santiago', FALSE),
  (3, 'Ciudad de México', FALSE),
  (3, 'Bogotá', FALSE),
  (3, 'Buenos Aires', TRUE),
  (3, 'Brasilia', FALSE),
  (3, 'Santiago', FALSE),
  (4, 'Ciudad de México', FALSE),
  (4, 'Bogotá', FALSE),
  (4, 'Buenos Aires', FALSE),
  (4, 'Brasilia', TRUE),
  (4, 'Santiago', FALSE),
  (5, 'Ciudad de México', FALSE),
  (5, 'Bogotá', FALSE),
  (5, 'Buenos Aires', FALSE),
  (5, 'Brasilia', FALSE),
  (5, 'Santiago', TRUE);
--


-- Resultados
INSERT INTO results (survey_id, surveyed_id, questions, corrects) VALUES
  (1, 1, 5, 1),
  (1, 2, 5, 2),
  (1, 3, 5, 3),
  (1, 4, 5, 4),
  (1, 5, 5, 5);


-- Consultas 

-- Podemos traer varia información de nuestra BD, por ejemplo: ¿cuantas encuestas ha llenado cada encuestado?

SELECT s.name, s.last_name, COUNT(r.result_id) AS 'Encuestas llenadas' FROM surveyed s
INNER JOIN results r ON s.surveyed_id = r.surveyed_id
GROUP BY s.surveyed_id;