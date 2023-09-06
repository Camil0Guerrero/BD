/* Operadores Relacionales */

-- Igual que 
SELECT * FROM usuarios WHERE edad = 38;

-- Diferente de 
-- El <> es para indicar que es diferente, en algunos casos puede traer problemas ya que no es soportado por todos los motores de base de datos
SELECT * FROM usuarios WHERE edad <> 38;
-- Estas dos serian equivalentes
SELECT * FROM usuarios WHERE edad != 38;

-- Mayor que
SELECT * FROM usuarios WHERE edad > 38;

-- Mayor o igual que
SELECT * FROM usuarios WHERE edad >= 38;

-- Menor que 
SELECT * FROM usuarios WHERE edad < 38;

-- Menor o igual que
SELECT * FROM usuarios WHERE edad <= 38;

/* Operadores Lógicos */

-- Nos ayudan cuando queremos hacer consultas mas complejas

-- NEGACIÓN
SELECT * FROM usuarios WHERE NOT direccion = "Sin dirección";

-- AND
-- Nos dará los registros que cumplan con todas las condiciones 
SELECT * FROM usuarios WHERE direccion != "Sin dirección" AND edad >= 38;

SELECT * FROM usuarios WHERE direccion != "Sin dirección" AND edad >= 38 AND nombre = 'John';

-- OR 
-- Traerá los registros que cumplan cualquiera de las condiciones
SELECT * FROM usuarios WHERE direccion != "Sin dirección" OR edad >= 38;

