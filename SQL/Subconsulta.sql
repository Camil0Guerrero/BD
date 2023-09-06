-- Una sub consulta seria una consulta de dentro de otra
-- En el paréntesis ponemos la consulta que queremos hacer dentro de otra, en este caso iremos a la tabla de caballeros dentro de la consulta de la tabla de signos
SELECT signo, 
  (SELECT COUNT(*) FROM caballeros c WHERE c.signo = s.signo_id )
  AS total_caballeros 
  FROM signos s;

SELECT rango, (SELECT COUNT(*) FROM caballeros c WHERE c.rango = r.rango_id) AS total_caballeros FROM rangos r;

SELECT ejercito,
  (SELECT COUNT(*) FROM caballeros c WHERE c.ejercito = e.ejercito_id) AS total_caballeros FROM ejercitos e;

SELECT pais,
  (SELECT COUNT(*) FROM caballeros c WHERE c.pais =  p.pais_id) AS total_caballeros FROM paises p;