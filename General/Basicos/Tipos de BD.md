# Tipos de Bases de Datos

Existen dos grandes clasificaciones para los tipos de las bases de datos. Estas se califican a partir de su estructuración

## Bases de Datos Relacionales

Se caracterizan por ser una colección ordenada de registros que se van a organizar en un conjunto de tablas. Una tabla es el elemento principal de una BD relacional, estas son muy parecidas a una hoja de calculo, es decir, los registros de la información se van a organizar en filas y columnas

Para acceder los datos utilizamos el lenguaje de consulta estructurado (SQL - Structure Query Language). Con SQL vamos a obtener y alterar los datos de una forma organizada, siempre y cuando tengamos en cuenta la estructura de la base de datos que estamos trabajando. Para ello vamos a utilizar distintos comandos que SQL nos pone a disposición para poder trabajar con la información que almacene nuestra BD

Estas tablas también se organizan a traves de identificadores, es decir, cada tabla va a eligir a un campo como identificador único, de este modo, este es el que va a establecer la relación con el resto de las otras tablas que forman parte de la BD. A su vez estos identificadores hacen que sea mas fácil organizar cada una de la información que esta en estas tablas por separado

### Ejemplos

- MySQL
- MariaDB
- PostgreSQL
- SQLServer
- Oracle
- Entre otros

## Bases de Datos No Relacionales

Estas bases están diseñadas para modelar datos con estructuras un poco mas especificas y que no se necesite que unos datos estén relacionados con otros (a diferencia de las relacionales), cada identidad va a funcionar de forma independiente y son mucha mas sencillas que las relacionales. Esta sencillez de organización y acceso hace que por ejemplo:

- BigData -> Se almacena una gran cantidad de datos, se pueden tener redundancia de datos, esto se puede hacer ya que el objetivo de estas base no relacionales es mejorar el rendimiento. Se prioriza el acceso por sobre la organización y la integridad de los datos
  - En este tipo de modelado se requiere ahorrar poder de computo para poder procesar la mayor cantidad de datos en el menor tiempo posible

## Formatos

El mas popular de los formatos en las BD no relacionales son los documentos, un documento es un objeto organizado en claves y valores para acceder a la información de una manera muy sencilla (parecido al formato JSON)

A estas bases de datos también se les asocia el concepto (noSQL), esto no quiere decir que no lo podamos usar, quiere decir que no solo se utiliza SQL para acceder a la información, sino que también se pueden utilizar otros lenguajes de consulta para acceder a la información

### Ejemplos

#### Documentales

- MongoDB
- CouchDB

#### Clave - Valor

- Redis
- DynamoDB

#### Grafos

- Neo4j
- ArangoDB

### Ejemplo de almacenamiento

#### Relacional

Beers Table

| id   | name   | brewer | units |
| ---- | ------ | ------ | ----- |
| 1167 | Ale C  | Miller | 570   |
| 3424 | Beerio | Ians   | 340   |
| 5612 | Amstel | Amtel  | 121   |
| 2409 | Colt's | BeerCo | 98    |

#### No relacional

Beers Documents

beer_1167

```json
{
	"_id": "1167",
	"name": "Ale C",
	"brewer": "Miller",
	"units": 570
}
```

beer_3424

```json
{
	"_id": "3424",
	"name": "Beerio",
	"brewer": "Ians",
	"units": 340
}
```
