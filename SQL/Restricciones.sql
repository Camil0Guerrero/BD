-- Una de las restricciones que podemos notar es cuando tenemos enlazadas tablas por medio de llaves foráneas, ya que no podremos borrar nuestro registro si este esta siendo referenciado por otro, esto es importante para mantener la integridad de los datos.

-- En SQL, sobretodo en operaciones de tipo DELETE y UPDATE, podemos especificar que acciones se puede realizar 

-- En MySQL tenemos 4 acciones que podemos realizar, las cuales son:

-- CASCADE: Esta acción lo que hace es que si borramos o actualizamos un registro en la tabla padre, se borraran o actualizaran los registros en la tabla hija

-- SET NULL: En este caso los campos que estaban enlazados a la tabla padre se pondrán en NULL

-- SET DEFAULT: En este caso los campos que estaban enlazados a la tabla padre se pondrán en el valor por defecto que se haya especificado

-- RESTRICT: Esta acción es la que se ejecuta por defecto al borrar y actualizar, no se borraran o actualizaran los registros en la tabla hija, y nos mostrara un error

CREATE TABLE lenguajes (
  lenguaje_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  lenguaje VARCHAR(30) NOT NULL
);
--

INSERT INTO lenguajes (lenguaje) VALUES 
  ('JavaScript'),
  ('PHP'),
  ('Python'),
  ('Ruby'),
  ('JAVA');
--

CREATE TABLE entornos (
  entorno_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  entorno VARCHAR(30) NOT NULL
);

INSERT INTO entornos (entorno) VALUES 
  ('Frontend'),
  ('Backend');
--

-- Without restrictions
CREATE TABLE frameworks (
  framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  framework VARCHAR(30) NOT NULL,
  lenguaje INT UNSIGNED,
  FOREIGN KEY (lenguaje) REFERENCES lenguajes(lenguaje_id)
);
--

CREATE TABLE frameworks (
  framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  framework VARCHAR(30) NOT NULL,
  lenguaje INT UNSIGNED,
  entorno INT UNSIGNED,
  -- Las restricciones se deben hacer por cada llave foránea, de hecho, podemos poner diferentes restricciones para cada una
  -- FOREIGN KEY (lenguaje) 
    -- REFERENCES lenguajes(lenguaje_id) 
    -- ON DELETE SET NULL 
    -- ON UPDATE CASCADE

  FOREIGN KEY (lenguaje) 
    REFERENCES lenguajes(lenguaje_id) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,

  FOREIGN KEY (entorno)
    REFERENCES entornos(entorno_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
--

INSERT INTO frameworks (framework, lenguaje, entorno) VALUES 
  ('React', 1, 1 ),
  ('Angular', 1, 1 ),
  ('Vue', 1, 1 ),
  ('Svelte', 1, 1 ),  
  ('Laravel', 2, 2 ),
  ('Symfony', 2, 2 ),
  ('Flask', 3, 2 ),
  ('Django', 3, 2 ),
  ('On Rails', 4, 2 );
--

SELECT * FROM lenguajes;
SELECT * FROM frameworks;
SELECT * FROM entornos;

SELECT f.framework AS FRAMEWORK, l.lenguaje AS LANGUAGE, e.entorno AS ENVIRONMENT 
  FROM frameworks f
    INNER JOIN lenguajes l ON f.lenguaje = l.lenguaje_id 
    INNER JOIN entornos e ON f.entorno = e.entorno_id; 

-- Con RESTRICT no podemos eliminar este registro hasta que en la tabla padre no tengamos registros con este valor 
-- Con SET NULL los datos que tenían que ver con esta tabla pasan a null
DELETE FROM lenguajes WHERE lenguaje_id = 3;

-- En ese orden de ideas, si podríamos eliminar el registro 5 'JAVA', ya que no tenemos registros de con este valor 
DELETE FROM lenguajes WHERE lenguaje_id = 5;


DELETE FROM entornos WHERE entorno_id = 1;


-- De la misma forma cuando queremos actualizar
UPDATE lenguajes SET lenguaje_id = 13 WHERE lenguaje_id = 3;

UPDATE entornos SET entorno_id = 19 WHERE entorno_id = 1;

DROP TABLE lenguajes;
DROP TABLE frameworks;
DROP TABLE entornos;