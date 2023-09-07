-- 2. Ejercicio de las maratones en la que ha participado Jon

-- Creación de tablas, pondré el nombre de los campos en ingles para que sea mas fácil de entender

USE practices;

CREATE TABLE IF NOT EXISTS type_career(
  id_type_career INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description TEXT,
  distance INT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS countries(
  id_country INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

-- Principal
  CREATE TABLE IF NOT EXISTS careers(
    id_career INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name Varchar(50) NOT NULL,
    type_career INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    duration VARCHAR(10) NOT NULL,
    best_time BOOLEAN DEFAULT FALSE,
    altitude INT,
    place VARCHAR(50),
    country INT UNSIGNED NOT NULL,
    photo VARCHAR(255) DEFAULT 'default.png',
    FOREIGN KEY (type_career) REFERENCES type_career(id_type_career) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (country) REFERENCES countries(id_country) ON DELETE RESTRICT ON UPDATE CASCADE
  );

-- Insertamos datos para nuestras tablas que servirán como catálogos
-- Países, Jon solo ha tenido la oportunidad de correr en dos países por lo que no pondré mas
INSERT INTO countries( name ) VALUES 
  ('México'),
  ('Estados Unidos de América');

-- Las carreras si agregare las mas comunes
INSERT INTO type_career( description, distance ) VALUES 
  ('Carrera de 3k', 3),
  ('Carrera de 5K', 5),
  ('Carrera de 8K', 8),
  ('Carrera de 10K', 10),
  ('Carrera de 15K', 15),
  ('Carrera de 16K', 16),
  ('Medio Maratón', 21),
  ('Maratón', 42),
  ('UltraMaratón 50k', 50),
  ('UltraMaratón 100k', 100);
-- 

SELECT * FROM countries;
SELECT * FROM type_career;

-- Insertamos las carreras en las que ha participado Jon
-- Me percate que no necesitaba un store procedure, ya que solo debemos afectar esta tabla, si queremos agaragar un nuevo tipo de carrera o un nuevo país, lo haremos directamente a esta tabla desde nuestro código
INSERT INTO careers( name, type_career, date, duration, altitude, place, country, photo) VALUES 
  ('Carrera We Run México 2011', 4, '2011-11-26', '0:56:59', 2250, 'CDMX', 1, 'img/carrera-01.jpg' ),
  ('Reto Bosques de las Lomas', 5, '2012-05-13', '1:20:21', 2250, 'EdoMex', 1, 'img/carrera-02.jpg' ),
  ('Maratón de la Ciudad de México 2012', 8, '2012-09-02', '4:35:35', 2250, 'CDMX', 1, 'img/carrera-03'),
  ('Maratón de la Ciudad de México 2012', 8, '2012-09-02', '4:35:35', 2250, 'CDMX', 1, 'img/carrera-04'),
  ('San Francisco Marathon 2015', 8, '2015-07-26', '1:33:38', 20, 'San Francisco', 2, 'img/carrera/05');


SELECT * FROM careers;
TRUNCATE careers;

-- Y para obtener las carreras en las que ha participado Jon con los tipos de carreras y países, solo debemos hacer un join
-- De esta forma podremos tener toda la información que necesitemos de nuestras tablas
SELECT c.name, c.duration, c.altitude, countries.name AS country, tp.description AS type_career FROM careers c INNER JOIN countries ON c.country = countries.id_country INNER JOIN type_career tp ON c.type_career = tp.id_type_career ;