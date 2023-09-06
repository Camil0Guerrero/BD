-- Comentario en una linea en SQL

/*
Este es un comentario
de varias
lineas
*/

/* 
SQL, NO distingue entre MAYÚSCULAS y minúsculas pero: 
  - Comandos y palabras reservadas de SQL van en MAYÚSCULAS.
  - Nombres de objetos y datos van en minúsculas con _snake_case_
  - Para strings usar comillas simples ( ' ' )
  - Todas las sentencias terminan con punto y coma (;)
*/

SHOW DATABASES;

show databases;

ShOw dAtAbAsEs;


-- Con esta linea de comando se creara una base de datos con el nombre del string que pasamos como parámetro
-- Un problema que podemos tener es que si ejecutamos este comando cuando ya existe la base de datos nos dará un error
CREATE DATABASE curso_sql;

-- Para eliminar una base de datos hacemos uso de la keyword DROP 

DROP  DATABASE curso_sql;

/* Para evitar estos errores tenemos la posibilidad de las condicionales */
-- Todo el código de SQL se debe hacer en una linea 

-- La agregar la condición 'IF NOT EXISTS' ya no nos dará el error, ya que si existe no intentara crear la BD
CREATE DATABASE IF NOT EXISTS curso_sql;

-- Esto igualmente sucede para el DROP, si no existe la BD no la eliminara  
DROP DATABASE IF EXISTS curso_sql;