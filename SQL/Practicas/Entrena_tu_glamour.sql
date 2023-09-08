-- 4. Entrena tu glamour, este es un proyecto que Jon hizo hace un tiempo para una compañía y nos la puso como ejemplo. Esta consiste en una base de datos para almacenar clientes que participaran en distintas actividades de entrenamiento ya definidas con sus respectivos horarios.

-- Creación de Bases de Datos

CREATE TABLE IF NOT EXISTS activities(
  activity_id CHAR(2) PRIMARY KEY,
  block VARCHAR(10) NOT NULL,
  discipline VARCHAR(20) NOT NULL,
  schedule VARCHAR(20) NOT NULL,
  capacity INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS participants(
  email VARCHAR(100) PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  last_name VARCHAR(50) NOT NULL,
  nacimiento DATE NOT NULL 
);

-- Esta sera nuestra tabla principal, en esta se llevara toda la información de los participantes y las actividades en las que participaran.
CREATE TABLE IF NOT EXISTS registers(
  register_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  activity_id CHAR(2),
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (email) REFERENCES participants(email) ON DELETE CASCADE,
  FOREIGN KEY (activity_id) REFERENCES activities(activity_id) ON DELETE RESTRICT
);


-- Inserción de datos de prueba
INSERT INTO activities (activity_id, block, discipline, schedule, capacity) VALUES
  ('1K', 'Bloque 1', 'Kick Boxing', '9:00 a 12:00', 10),
  ('1Y', 'Bloque 1', 'Yoga', '9:00 a 12:00', 20),
  ('1P', 'Bloque 1', 'Pilates', '9:00 a 12:00', 10),
  ('1Z', 'Bloque 1', 'Zumba', '9:00 a 12:00', 10),

  
  ('2K', 'Bloque 2', 'Kick Boxing', '14:00 a 17:00', 10),
  ('2Y', 'Bloque 2', 'Yoga', '14:00 a 17:00', 20),
  ('2P', 'Bloque 2', 'Pilates', '14:00 a 17:00', 10),
  ('2Z', 'Bloque 2', 'Zumba', '14:00 a 17:00', 10),

  ('3K', 'Bloque 3', 'Kick Boxing', '18:00 a 21:00', 10),
  ('3Y', 'Bloque 3', 'Yoga', '18:00 a 21:00', 20),
  ('3P', 'Bloque 3', 'Pilates', '18:00 a 21:00', 10),
  ('3Z', 'Bloque 3', 'Zumba', '18:00 a 21:00', 10);
--
-- En este caso si debemos crear stored procedure ya que necesitamos que se ejecute una serie de instrucciones en un orden especifico.
DELIMITER // 

CREATE PROCEDURE sp_register_participant(
  IN i_activity_id CHAR(2),
  IN i_email VARCHAR(100),
  IN i_name VARCHAR(50),
  IN i_last_name VARCHAR(50),
  IN i_nacimiento DATE
)

BEGIN 
  
  DECLARE v_capacity INT UNSIGNED DEFAULT 0;

  SELECT capacity INTO v_capacity FROM activities WHERE activity_id = i_activity_id;


  IF v_capacity > 0 THEN

    INSERT INTO participants(email, name, last_name, nacimiento) 
      VALUES(i_email, i_name, i_last_name, i_nacimiento);

    INSERT INTO registers(email, activity_id) 
      VALUES(i_email, i_activity_id);

    UPDATE activities SET capacity = capacity - 1 WHERE activity_id = i_activity_id;

  ELSE

    SELECT 'No hay cupo disponible';

  END IF;


END // 

DELIMITER ;

-- Usamos nuestro stored procedure
CALL sp_register_participant('2K', 'Camilo@gmail.com', 'Camilo', 'Guerrero', '1980-01-01');


-- Igualmente cuando queremos remover uno de los participantes a una actividad
DELIMITER // 

CREATE PROCEDURE sp_remove_participant(
  IN i_activity_id CHAR(2),
  IN i_email VARCHAR(100)
)

BEGIN 

  DELETE FROM registers WHERE activity_id = i_activity_id;

  DELETE FROM participants WHERE email = i_email;

  UPDATE activities SET capacity = capacity + 1 WHERE activity_id = i_activity_id;

END // 

DELIMITER ;

CALL sp_remove_participant('2k', 'Camilo@gmail.com');

SELECT * FROM activities;
SELECT * FROM participants;
SELECT * FROM registers;