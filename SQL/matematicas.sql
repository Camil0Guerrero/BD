-- El SELECT no solo nos sirve para consultar datos, también nos permite ver el resultado de operaciones

SELECT 6 + 5 AS Addition;

SELECT 6 - 5 AS subtraction;

SELECT 6 * 5 AS multiplication;

SELECT 6 / 5 AS division;

# Funciones matemáticas

-- Los paréntesis de las operaciones deben ir pegados a su keyword
-- El MOD es el módulo, es decir, el resto de la división, como primer parámetro se le pasa el dividendo y como segundo el divisor 4/2 = 2 y sobra 0
SELECT MOD(4, 2) AS modulo;

SELECT MOD(5, 2) AS modulo2;

-- Para redondear los números, esta función redondea a la alza
SELECT CEILING(7.1) AS ceiling;

-- Esta función redondea a la baja
SELECT FLOOR(7.9) AS floor;

-- Esta función redondea dependiendo del decimal, si esta entre 0 y 4 redondea a la baja, si esta entre 5 y 9 redondea a la alza

SELECT ROUND(7.5) AS round;
SELECT ROUND(7.4999) AS round;

-- POWER nos ayuda a elevar un número a una potencia, el primer parámetro es el número y el segundo la potencia
SELECT POWER(2, 6) AS power;

-- SQRT nos ayuda a sacar la raíz cuadrada de un número
SELECT SQRT(81);
