-- 7. Simulación del proceso de ventas de una empresa

-- Note:
-- La practica de los caballeros del zodiaco se hace en el video, por lo que no lo hare nuevamente
-- Usare la misma tabla de países, solo agregare registros

-- Creación de tablas

CREATE TABLE IF NOT EXISTS sales(
  sale_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  client_id INT UNSIGNED NOT NULL,
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  amount FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS products(
  product_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  photo VARCHAR(255) DEFAULT 'default.png',
  price FLOAT NOT NULL,
  quantity INT UNSIGNED NOT NULL
);

-- Tabla pivote
CREATE TABLE IF NOT EXISTS article_x_sale(
  axs INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sale_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  quantity INT UNSIGNED NOT NULL,
  FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabla principal
CREATE TABLE IF NOT EXISTS clients(
  client_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(10),
  email VARCHAR(50) NOT NULL UNIQUE,
  address VARCHAR(100) NOT NULL UNIQUE,
  CP CHAR(5),
  city VARCHAR(50),
  country INT UNSIGNED NOT NULL,
  FOREIGN KEY (country) REFERENCES countries(id_country)
);

DESCRIBE clients;

-- Inserción de datos
INSERT INTO products(name, description, photo, price, quantity) VALUES
  ('Computadora', 'Macbook Air M2', 'https://images.macrumors.com/t/q-5kInZZC0CU3HsHL3HyBIHYWKQ=/1600x0/article-new/2022/06/M2-MacBook-Air-2022-Feature0012.jpg', 30000, 5),
  ('Celular', 'Motorola G9', 'https://s1.eestatic.com/2020/11/05/elandroidelibre/el_androide_libre_533709502_180297806_1200x675.jpg', 6000, 10),
  ('Cámara Web', 'Logitech C920', 'https://m.media-amazon.com/images/S/aplus-media/vc/614bdd15-3677-4df6-be81-28a046f10d55._CR0,0,1464,600_PT0_SX1464__.jpg', 1500, 19),
  ('Micrófono', 'Blue Yeti', 'https://www.coimprit.com.mx/wp-content/uploads/2021/11/988-000100-04.jpg', 2500, 19),
  ('Audífonos', 'Audífonos Bose', 'https://m.media-amazon.com/images/I/41jSuUHT8eL._AC_.jpg', 6500, 10);


INSERT INTO clients (name, last_name, phone, email, address, CP, city, country ) VALUES
  ( 'Jonathan', 'Miranda', '5512345678', 'jonmircha@gmail.com', 'Calle 19 Número 20', '03100', 'CDMX', 1 ),
  ( 'Nora', 'Espino', '5587654321', 'irma@gmail.com', 'Calle 20 Número 19', '03200', 'CDMX', 1),
  ( 'Daniel', 'Aguilar', '5511223344', 'daniel@gmail.com', 'Calle 9 Número 3', '03300', 'CDMX', 1 ),
  ( 'Irma', 'Campos', '5500998877', 'ceci@gmail.com', 'Calle 1 Número 10', '03400', 'CDMX', 1 ),
  ( 'Alejandro', 'Imaz', '5523324114', 'nora@gmail.com', 'Calle 5 Número 3', '03500', 'CDMX', 1 );


-- Para el registro de ventas, creare un stored procedure ya que agregare esta información en mi tabla pivote

DELIMITER //

CREATE PROCEDURE sp_create_sale(
  IN i_client_id INT UNSIGNED,
  IN i_product_id INT UNSIGNED,
  IN i_quantity INT UNSIGNED
)

BEGIN 

  DECLARE v_amount FLOAT;
  DECLARE v_stock INT UNSIGNED;
  DECLARE v_quantity INT UNSIGNED;
  DECLARE v_sale_id INT UNSIGNED;

  START TRANSACTION;

  SELECT price INTO v_amount FROM products WHERE product_id = i_product_id;
  SELECT quantity INTO v_stock FROM products WHERE product_id = i_product_id;

  IF v_stock >= i_quantity THEN
    INSERT INTO sales(client_id, amount) VALUES (i_client_id, v_amount * i_quantity);
    SET v_sale_id = LAST_INSERT_ID();
    INSERT INTO article_x_sale(sale_id, product_id, quantity) VALUES (v_sale_id, i_product_id, i_quantity);
    SET v_quantity = v_stock - i_quantity;
    UPDATE products SET quantity = v_quantity WHERE product_id = i_product_id;
  
  ELSE 
    SELECT 'No hay suficiente stock' AS message;

  END IF;

END //

DELIMITER ;

-- Hacemos uso de nuestro stored procedure para agregar una venta
CALL sp_create_sale(1, 1, 2);


-- De esta forma podemos hacer crecer nuestra BD a partir de nuestras necesidades.

-- Por ultimo un ejemplo de como podemos hacer un reporte de ventas por cliente

SELECT c.name, c.last_name, SUM(s.amount) AS total FROM clients c
  INNER JOIN sales s ON c.client_id = s.client_id
  GROUP BY c.client_id;