-- 6. En este ejercicio simularemos el funcionamiento de un sistema de películas y series

-- Nota:
-- En este ejercicio igualmente vamos a reutilizar nuestra tabla de países, si es necesario agregare mas registros

-- Creación de tablas
-- Crearemos una tabla por cada una de las entidades ya que Varian en algunos atributos

-- Tabla catalogo
CREATE TABLE IF NOT EXISTS genres(
  genre_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  genre VARCHAR(50) NOT NULL
);

-- Tablas pivote
CREATE TABLE IF NOT EXISTS genres_x_movies(
  gxm_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  movie_id INT UNSIGNED NOT NULL,
  genre_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE IF NOT EXISTS genres_x_series(
  gxs_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  serie_id INT UNSIGNED NOT NULL,
  genre_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (serie_id) REFERENCES series(serie_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Tablas necesarias para las series 
CREATE TABLE IF NOT EXISTS episodes(
  episode_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  season_id INT UNSIGNED NOT NULL,
  episode_number INT UNSIGNED NOT NULL,
  premiere DATE NOT NULL,
  title VARCHAR(50) NOT NULL,
  sinopsis TEXT,
  director VARCHAR(50),
  duration TIME,
  FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

CREATE TABLE IF NOT EXISTS seasons(
  season_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  serie_id INT UNSIGNED NOT NULL,
  season_number INT UNSIGNED NOT NULL,
  premiere YEAR NOT NULL,
  title VARCHAR(50) NOT NULL,
  sinopsis TEXT,
  poster VARCHAR(255),
  trailer VARCHAR(255),
  FOREIGN KEY (serie_id) REFERENCES series(serie_id)
);

-- Tablas principales
CREATE TABLE IF NOT EXISTS movies(
  movie_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  premiere YEAR NOT NULL,
  duration TIME NOT NULL,
  sinopsis TEXT,
  studio VARCHAR(50),
  director VARCHAR(50),
  cast VARCHAR(255),
  poster VARCHAR(255),
  trailer VARCHAR(255),
  country INT UNSIGNED NOT NULL,
  FOREIGN KEY (country) REFERENCES countries(id_country)
);

CREATE TABLE IF NOT EXISTS series(
  serie_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  premiere YEAR NOT NULL,
  final YEAR NOT NULL,
  sinopsis TEXT,
  studio VARCHAR(50),
  creator VARCHAR(50),
  cast VARCHAR(255),
  poster VARCHAR(255),
  trailer VARCHAR(255),
  country INT UNSIGNED NOT NULL,
  FOREIGN KEY (country) REFERENCES countries(id_country)
);

-- Inserción de datos

INSERT INTO genres (genre) VALUES 
  ('sci-fi'),
  ('action'),
  ('comedy'),
  ('drama');
--

-- Creare un registro de película y uno de series para hacer el ejemplo simplemente, aunque igualmente podremos profundizar y hasta normalizar nuestras tablas


INSERT INTO movies (title, premiere, duration, sinopsis, studio, director, cast, poster, trailer, country) VALUES 
  ('The Matrix', 1999, '2:16:00', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'Warner Bros', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg', 'https://www.youtube.com/watch?v=m8e-FF8MsqU', 1);
--

INSERT INTO series(title, premiere, final, sinopsis, studio, creator, cast, poster, trailer, country) VALUES 
  ('Breaking Bad', 2008, 2013, 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family future.', 'AMC', 'Vince Gilligan', 'Bryan Cranston, Aaron Paul, Anna Gunn', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Breaking_Bad_logo.svg/1920px-Breaking_Bad_logo.svg.png', 'https://www.youtube.com/watch?v=HhesaQXLuRY', 1);
--

INSERT INTO seasons (serie_id, season_number, premiere, title, sinopsis, poster, trailer) VALUES
  (1, 1, 2008, 'Pilot', 'Un profesor de química con cáncer terminal decide iniciar un negocio de metanfetamina para asegurar el futuro financiero de su familia.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Breaking_Bad_Season_1_Poster.jpg/220px-Breaking_Bad_Season_1_Poster.jpg', 'https://www.youtube.com/watch?v=oZkR15_u-1k'),
  (1, 2, 2008, 'Grilled', 'Walter y Jesse se ven obligados a hacer un trato con un traficante de drogas local.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Breaking_Bad_Season_2_Poster.jpg/220px-Breaking_Bad_Season_2_Poster.jpg', 'https://www.youtube.com/watch?v=s12-4mI1kS8'),
  (1, 3, 2009, 'No Más', 'Walter y Jesse se separan, pero Walter es forzado a regresar al negocio cuando su familia es amenazada.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Breaking_Bad_Season_3_Poster.jpg/220px-Breaking_Bad_Season_3_Poster.jpg', 'https://www.youtube.com/watch?v=l_494Xs1m28'),
  (1, 4, 2010, 'Box Cutter', 'Walter y Jesse son forzados a trabajar con un nuevo socio peligroso.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Breaking_Bad_Season_4_Poster.jpg/220px-Breaking_Bad_Season_4_Poster.jpg', 'https://www.youtube.com/watch?v=-7X_hX9578o'),
  (1, 5, 2011, 'Felina', 'Walter White finalmente enfrenta las consecuencias de sus acciones.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Breaking_Bad_Season_5_Poster.jpg/220px-Breaking_Bad_Season_5_Poster.jpg', 'https://www.youtube.com/watch?v=i-QsP278a3k');
--


INSERT INTO episodes (season_id, episode_number, premiere, title, sinopsis, director, duration) VALUES 
  (1, 1, '2008-01-20', 'Pilot', 'Un profesor de química con cáncer terminal decide iniciar un negocio de metanfetamina para asegurar el futuro financiero de su familia.', 'Vince Gilligan', 49),
  (1, 2, '2008-02-06', "Cat's in the Bag...", 'Walter y Jesse se ven obligados a deshacerse del cuerpo de Emilio.', 'Vince Gilligan', 45),
  (1, 3, '2008-02-13', "...And the Bag's in the River", 'Walter y Jesse intentan deshacerse del cuerpo de Krazy-8.', 'Vince Gilligan', 45),
  (1, 4, '2008-03-06', 'Cancer Man', 'Walter le dice a Skyler que tiene cáncer.', 'Michelle MacLaren', 45),
  (1, 5, '2008-03-13', 'Gray Matter', 'Walter se reencuentra con su ex socio en el negocio de la metanfetamina.', 'Vince Gilligan', 45),
  (1, 6, '2008-03-20', "Crazy Handful of Nothin'", 'Walter y Jesse intentan vender su metanfetamina a un traficante local.', 'Tim Hunter', 45),
  (1, 7, '2008-03-27', 'A No-Rough-Stuff-Type Deal', 'Walter y Jesse se ven obligados a hacer un trato con un traficante de drogas local.', 'Adam Bernstein', 45),
  (1, 8, '2008-04-10', 'Better Call Saul', 'Walter y Jesse contratan a un abogado para que los represente.', 'Vince Gilligan', 45),
  (1, 9, '2008-04-17', 'BBQ', 'Walter y Jesse se ven obligados a matar a un traficante de drogas.', 'Michelle MacLaren', 45),
  (1, 10, '2008-05-10', 'Fly', 'Walter y Jesse pasan un día enteros encerrados en un laboratorio tratando de matar una mosca.', 'Vince Gilligan', 45);
--

-- Con esta información ya podemos hacer todas las operaciones y consultas necesarias
-- Como en las anteriores tan solo hare consultas de ejemplo ya que mi enfoque es la estructura de la base de datos

-- Obtengo todas los episodios de una serie
SELECT s.title as Serie, e.episode_number AS episodio, e.title AS Titulo FROM seasons s INNER JOIN episodes e ON s.season_id = e.season_id WHERE s.serie_id = 1;
