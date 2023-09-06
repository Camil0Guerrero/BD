-- Un motor de tablas o también conocido coma motor de almacenamiento es el componente del sistema gestor de la BD que se va a encargar de como almacenar, recuperar y posteriormente manipular los datos que se encuentran en la BD, los motores de las tablas son los responsables de como se van a organizar los datos físicamente en el disco duro asi como de las reglas y de los protocolos para poder acceder a ellos

-- Cada motor de BD tiene su propia gestión para generar tablas, vistas, transacciones, concurrencias, etc... por ejemplo, en MySQL que es el gestor que estamos usando, hay un par de sistemas gestores para sus tablas como InnoDB y MyISAM incluso hay un formato para poder exportar la información en csv 

-- Ahora el esquema por defecto de una tabla en MySQL es InnoDB el cual es un motor que es compatible con transacciones, con restricciones, vinculación de llaves foráneas, es decir, procura la integridad de los datos

-- Por lo que si trabajamos con versiones superiores a la 7.8 de MySQL todas nuestras tablas por defecto son relacionales
CREATE TABLE armaduras (
  armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  armadura VARCHAR(30) NOT NULL
);

-- Pero si tenemos versiones de MySQL mas antiguas o estamos en un hosting compartido o por alguna razón por defecto esto no es asi podemos especificar que motor de tablas queremos usar

-- Este era el motor de búsqueda usado por MySQL utilizado antes
-- Esta crea la tabla plana, es decir, la crea sin la capacidad de hacer transacciones, restricciones, relaciones, etc...
CREATE TABLE armas (
  arma_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  arma VARCHAR(30) NOT NULL
) ENGINE = MyISAM;

-- Por otro lado, podemos especificar el modelo actual, el cual es el recomendado, esto también es buena idea hacerlo cuando no tenemos la certeza de que motor de tablas se esta usando

CREATE TABLE armaduras (
  armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  armadura VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

-- Igualmente podemos especificar la decodificación de caracteres que queremos usar en nuestra BD, esto es importante no solo en la parte de mostrar los archivos, también al guardarlos ya que nos pueden dar problemas de compatibilidad

-- El de por defecto es el utf8mb4, el cual es el que soporta emojis, caracteres especiales, etc... este es el recomendado para el español

-- Esto es igualmente importante cuando estamos en una BD internacional o una que utiliza el ingles por defecto o simplemente tenemos problemas con el juego de caracteres es importante verificar que este valor este correctamente especificado

CREATE TABLE armaduras (
  armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  armadura VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;