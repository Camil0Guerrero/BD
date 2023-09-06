# SQL

## Que es?

SQL, Structured Query Language, es un lenguaje de programación que se utiliza para manipular datos en Bases de Datos relacionales. Esta diseñado para ser fácil de aprender y usar

SQL se utiliza para realizar una variedad de tareas en Bases de Datos relacionales, incluyendo:

- Crear y modificar tablas
- Insertar, actualizar y eliminar tablas
- Recuperar datos de las tablas
- Administrar Bases de Datos

SQL es un lenguaje declarativo (no procedural) lo que significa que no especifica como se deben realizar las tareas. En cambio, especifica lo que se debe hacer. Este hace que este lenguaje sea muy poderoso y flexible

### Ejemplo

Un ejemplo de una consulta SQL que recupera todos los datos de la tabla 'clientes'

```SQL
SELECT * FROM clientes;
```

### Tipos de datos

Los tipos de datos son los tipos de valores que pueden almacenarse en una columna de una tabla. Estos pueden variar según el motor de base de datos que se este utilizando, pero los tipos de datos más comunes son:

| Tipo de dato | Descripción                                                                    |
| ------------ | ------------------------------------------------------------------------------ |
| VARCHAR      | Cadena de caracteres de longitud variable                                      |
| CHAR         | Cadena de caracteres de longitud fija                                          |
| INT          | Número entero, positivo y negativo                                             |
| BIGINT       | Número entero grande, positivo y negativo                                      |
| FLOAT        | Número decimal de precisión simple                                             |
| DOUBLE       | Número decimal de doble precisión                                              |
| DECIMAL      | Número decimal con precisión fija                                              |
| DATE         | Fecha, con valores de año, mes y día                                           |
| TIME         | Hora, con valores de hora, minutos y segundos                                  |
| DATETIME     | Fecha y hora combinadas                                                        |
| TIMESTAMP    | Marca de tiempo, que indica un momento especifico                              |
| BOOLEAN      | Valor booleano, verdadero o falso                                              |
| BLOB         | Objeto binario grande, para almacenar datos binarios, como imágenes o archivos |
| JSON         | Formato de texto estructurado para el intercambio de datos                     |

## Tipos de Sentencias

Una sentencia es una orden de código en este lenguaje que se utiliza para realizar una tarea específica, esta gramática o sintaxis es comúnmente imperativa, es decir, muy parecido a como se habla en el idioma ingles.

Dentro de estas sentencias que podemos ejecutar en SQL principalmente se pueden agrupar en 4 grupos:

### Data Definition Language (DDL)

Estas sentencias se utilizan para definir y modificar la estructura de la BD, por ejemplo, para crear o modificar la estructura de un objeto, como puede ser una tabla, una vista o incluso la misma BD.

algunos comandos DDL son:

- CREATE: crea un objeto en la BD
- ALTER: modifica la estructura de un objeto en la BD
- DROP: elimina un objeto de la BD
- TRUNCATE: elimina todos los registros de una tabla

### Data Manipulation Language (DML)

Estas sentencias se utilizan para manipular los datos dentro de la BD, por ejemplo, para insertar, actualizar o eliminar registros de una tabla.

comandos DML:

- SELECT: recupera datos de una o más tablas
- INSERT: inserta nuevos registros en una tabla
- UPDATE: actualiza los registros existentes en una tabla
- DELETE: elimina los registros existentes en una tabla

### Data Control Language (DCL)

Estas sentencias se utilizan para controlar el acceso a los datos dentro de la BD, por ejemplo, para otorgar o revocar permisos de acceso a los usuarios.

comandos DCL:

- GRANT: otorga permisos de acceso a los usuarios
- REVOKE: revoca permisos de acceso a los usuarios

### Transaction Control Language (TCL)

Son usadas para controlar las transacciones en una base de datos, sirven para cuando es necesario ejecutar varias sentencias de código SQL y estas afectan varias entidades. Estas se ejecutaran hasta que se hayan ejecutado todas las sentencias SQL que necesitemos por si alguna de estas fallan se puede realizar un rollback y revertir los cambios.

Estas instrucciones son fundamentales para cuando ejecutamos triggers o stored procedures.

comandos TCL:

- COMMIT: confirma una transacción
- ROLLBACK: revierte una transacción
- SET TRANSACTION: establece propiedades de transacción

### Comandos y funciones básicas SQL

| Comando  | Descripción                                                                                                               |
| -------- | ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| SELECT   | Recupera datos de una o varias tablas                                                                                     |
| INSERT   | Agrega nuevos datos a una tabla                                                                                           |
| UPDATE   | Actualiza los datos existentes de una tabla                                                                               |
| DELETE   | Elimina datos de una tabla                                                                                                |
| CREATE   | Crea una nueva tabla, vista, indice, procedimiento almacenado u otra estructura de base de datos                          |
| ALTER    | Modifica la estructura de una tabla existente, como agregar o eliminar columnas                                           |
| DROP     | Elimina una tabla, vista, indice, procedimiento almacenado u otra estructura de base de datos                             |
| GRANT    | Concede permisos a un usuario o grupo de usuarios para realizar operaciones en una tabla o en la base de datos en general |
| REVOKE   | Revoca permisos de un usuario o grupo de usuarios para realizar operaciones en una tabla o en la base de datos en general | Retira los permisos previamente otorgados a un usuario o grupo de usuarios |
| JOIN     | Combina datos de dos o más tablas en función de una columna en común                                                      |
| UNION    | Combina los resultados de dos o más consultas en una sola tabla                                                           |
| GROUP BY | Agrupa los resultados de una consulta en función de una o mas columnas                                                    |
| HAVING   | Permite filtrar los resultados de una consulta agrupada                                                                   |
| ORDER BY | Ordena los resultados de una consulta en función de una o mas columnas                                                    |
| LIMIT    | Limita el número de filas retornadas por una consulta                                                                     |
| WHERE    | Permite filtrar los resultados de una consulta                                                                            |

También tenemos funciones dentro del estándar SQL

| función     | Descripción                                                  |
| ----------- | ------------------------------------------------------------ |
| AVG()       | Devuelve el promedio de los valores de una columna numérica  |
| COUNT()     | Cuenta el numero de filas o valores distintos en una columna |
| MAX()       | Devuelve el valor máximo de una columna                      |
| MIN()       | Devuelve el valor mínimo de una columna                      |
| SUM()       | Devuelve la suma de los valores de una columna numérica      |
| CONCAT()    | Concatena dos o más cadenas de texto                         |
| SUBSTRING() | Devuelve una parte de una cadena de texto                    |
| UPPER()     | Convierte una cadena de texto a mayúsculas                   |
| LOWER()     | Convierte una cadena de texto a minúsculas                   |
| LEFT()      | Devuelve los caracteres iniciales de una cadena de texto     |
| RIGHT()     | Devuelve los caracteres finales de una cadena de texto       |
| DATE()      | Extrae la fecha de un valor de fecha y hora                  |
| YEAR()      | Devuelve el año de una fecha                                 |
| MONTH()     | Devuelve el mes de una fecha                                 |
| DAY()       | Devuelve el día de una fecha                                 |
| ROUND()     | Redondea un valor numérico de decimales especificado         |
