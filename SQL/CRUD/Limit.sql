-- La clausula LIMIT se utiliza para poner un limite en la cantidad de registros que se devuelven de una consulta, este valor usualmente se usa en 10, 20, 50, 100, etc. Ya que si tenemos demasiada información no va a ser muy eficaz el siempre devolver toda los registros que no se utilizan.

-- Esta clausula es muy buena cuando estamos realizando una pagination, ya que podemos ir devolviendo los registros de 10 en 10, y así no sobrecargar el servidor.

SELECT * FROM frameworks LIMIT 2;

-- Para ir al siguiente grupo de registros, debemos poner el numero de registro desde donde queremos que empiece, y luego la cantidad de registros que queremos que devuelva.
-- En este orden de ideas seria, devuélveme desde el segundo registro con 4 registros, es decir, hasta el sexto.
SELECT * FROM frameworks LIMIT 2, 4;

-- Si quisiéramos seguir con esto debemos cambiar el primer valor, el numero de registro desde el cual se va a empezar a devolver, en este caso seria el sexto, y luego la cantidad de registros que queremos que devuelva.
SELECT * FROM frameworks LIMIT 6, 4;