-- En SQL, una vista es una tabla virtual que se deriva de una o de varias existente dentro de la misma, en otras palabras, una vista no es que almacena físicamente los datos sino que es una consulta predefinida y preexistente en nuestra BD. Y que cada vez que se quiera acceder a ella, se ejecuta la consulta

-- La vista se define utilizando una clausula SELECT y una vez definida puede ser tratada como si fuese otra tabla dentro de la BD, permitiendo esto que se realicen incluso consultas de actualización y eliminación de registros aunque si no se tiene un buen control o conocimiento de la lógica de la BD lo sugerido es que solo se utilice para consultas.

-- Las vistas son útiles porque nos van a poder proporcionar una capa adicional de abstracción, por ejemplo, usuarios de nivel medio que no necesitan conocer todos los detalles de la BD, y que solo necesitan parte de los datos, para ello se podría construir una vista para que estas personas, por ejemplo, puedan obtener los reportes y trabajar con esa información sin necesidad de saber todo el universo que conforma la BD

-- También sirven para simplificar consultas complejas, ya que pueden contener consultas mas elaboradas dentro de otros y al final la podemos usar como una tabla

-- Sintaxis:
CREATE VIEW nombre_vista AS SELECT * FROM nombre_tabla;

CREATE VIEW vista_caballeros AS SELECT c.caballero_id, c.nombre, a.armadura,
  s.signo, r.rango, e.ejercito, p.pais 
  FROM caballeros c 
  INNER JOIN armaduras a ON c.armadura = a.armadura_id 
  INNER JOIN signos s ON c.signo = s.signo_id
  INNER JOIN rangos r ON c.rango = r.rango_id
  INNER JOIN ejercitos e ON c.ejercito = e.ejercito_id
  INNER JOIN paises p ON c.pais = p.pais_id;


CREATE VIEW vista_signos AS 
  SELECT signo,
    (SELECT COUNT(*) FROM caballeros c WHERE c.signo = s.signo_id) AS caballeros
  FROM signos s;
--

SELECT * FROM vista_caballeros;
SELECT * FROM vista_signos;

DROP VIEW vista_caballeros;

-- De esta forma podemos ver las vistas que tenemos en nuestra BD
SHOW FULL TABLES IN curso_sql WHERE TABLE_TYPE LIKE 'VIEW';