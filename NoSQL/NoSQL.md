# Bases de datos NoSQL (Not Only SQL)

## Introducción

NoSQL es un termino que se utiliza para describir un conjunto de sistemas gestores de BD, es decir, software que nos permite manipular modelos de datos pero no relacionales, muy en contra posición de los sistemas basados en SQL

Los sistemas NoSQL están diseñados para manejar grandes cantidades de datos y que incluso estos datos no cumplan con la misma estructura. Por ello es que las BD no relacionales tienen una mayor flexibilidad y escalabilidad a la hora de acceder a los datos.

## Cuando usarlas

Tenemos algunas ventajas o puntos importante por los que podríamos usar NoSQL:

- Escalabilidad: Pueden manejar una gran cantidad de datos y trafico sin degradar el rendimiento
  - Esto lo hace ideal para aplicaciones web y móviles de alta demanda como podrían ser **Videojuegos o Redes sociales**
- Flexibilidad: No necesitan un esquema fijo, por lo que podemos agregar o quitar campos sin problema
- Alto Rendimiento: Podemos manejar una gran cantidad de información de forma rápida y eficiente
- Disponibilidad: La mayoría de estos servicios se manejan en la nube por lo que están diseñados para evitar las intermitencias o fallos en el servicio.
- BigData: El procesamiento de grandes volúmenes de información hoy en dia se ha vuelto muy critico y justamente los sistemas NoSQL se ajustan perfectamente a este tipo de necesidad frente al esquema tradicional rígida de SQL

## Tipos de SGBD'S NoSQL

Aunque hay mas tipos, podemos clasificarlos en 4 grandes grupos:

- Documentales: Guardan las Bases de Datos en documentos, un documento es parecido a la sintaxis de JSON, es decir, un objeto con atributos y valores. Estos documentos se guardan en colecciones, que serian como las tablas en SQL. Ejemplos de este tipo de BD son **MongoDB, CouchDB, etc**

- Clave-Valor: Almacenan los datos de manera similar a los objetos de JavaScript con un identificador único, en estas BD no tenemos el concepto de documento, ya que se almacenan en conjunto. Estas BD son muy útiles para almacenar y recuperar datos simples y muy rápidos. Ejemplos de sistemas gestores **Redis, DynamoDB, etc**

- Familia de Columnas: Almacenaran los datos en columnas en lugar de filas, es decir, en las BD relacionales tenemos una tabla con filas y columnas, en este caso es al revés, tenemos una tabla con columnas y filas. Estas BD son muy útiles ya que permiten una escalabilidad horizontal y especialmente util para seleccionar un conjunto de datos extraídos de una BD un poco mas grande pero que tenga poca viabilidad (por ejemplo, un conjunto de datos de un usuario). Ejemplos de estos sistemas **Cassandra, HBase, etc**

- Graph (Grafos): Estas almacenan los datos como si fuesen nodos y las relaciones que se puedan tener entre los datos se almacenan como una red neuronal donde se tienen ciertos datos y la relación que guarden se van a ir conectando a base de una red neuronal o de una gráfica orientada a grafos. Estas BD son importantes para el análisis de redes o de información compleja ya que nos ayudan a hacerlo de una forma mas eficiente y fácil. Ejemplos de estos sistemas **Neo4j, OrientDB, ArangoDB, etc**
