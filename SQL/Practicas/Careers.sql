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

-- Creamos un stored procedure que nos ayudara al momento de crear una nueva maratón

DELIMITER $$ 

CREATE PROCEDURE sp_create_career(
  IN i_name VARCHAR(50),
  IN i_type_career INT UNSIGNED,
  IN i_date DATE,
  IN i_duration VARCHAR(10),
  IN i_altitude INT,
  IN i_place VARCHAR(50),
  IN i_country INT UNSIGNED,
  IN i_description_career TEXT,
  IN i_distance_career INT,
  IN i_best_time BOOLEAN,
  IN i_photo VARCHAR(255)
)

BEGIN
  -- Declaramos las variables que nos ayudaran a validar los datos que nos envían
  DECLARE v_type_career INT UNSIGNED;
  DECLARE v_country INT UNSIGNED;

  -- Validamos que el tipo de carrera exista
  SELECT id_type_career INTO v_type_career FROM type_career WHERE id_type_career = i_type_career;

  IF v_type_career IS NULL THEN
    -- Si la carrera no existe la agregaremos a nuestra tabla
    INSERT INTO type_career( description, distance ) VALUES 
      ( i_description_career, i_distance_career);
    
    SELECT LAST_INSERT_ID() INTO v_type_career;
  END IF;

  -- Validamos que el país exista
  SELECT id_country INTO v_country FROM countries WHERE id_country = i_country;

  -- Haremos lo mismo que con las carreras
  IF v_country IS NULL THEN
    -- Si el país no existe lo agregaremos a nuestra tabla
    INSERT INTO countries( name ) VALUES 
      ( i_country );
    
    SELECT LAST_INSERT_ID() INTO v_country;
  END IF;

  INSERT INTO careers( name, type_career, date, duration, altitude, place, country, best_time, photo ) VALUES
    ( i_name, i_type_career, i_date, i_duration, i_altitude, i_place, i_country, i_best_time, i_photo)
END $$

DELIMITER ;