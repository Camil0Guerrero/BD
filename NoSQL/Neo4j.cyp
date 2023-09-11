// En un grafo los datos se van a representar como nodos y la relación entre nodos se van a representar como aristas
// Si lo queremos comparar con SQL, los nodos serian como una tabla y las aristas serian la relación entre tablas
// A los nodos también se les pueden llamar vertices y a las aristas también se les pueden llamar bordes o edges

// La gran diferencia entre las queries de SQL y las queries de Grafo es que en SQL esta forzado a entregarnos la información que nosotros estamos obteniendo a partir de ese query. En los grafos digamos que es mas flexible, porque podemos obtener información que no necesariamente esta relacionada con el query que estamos haciendo ya que los nodos estan conectados entre si. Por ello una característica importante de estas BD es el descubrimiento de patrones y recomendaciones

// La extension del lenguaje chypher es .cyp

// El caso que se planteara para practicar y realizar nuestro CRUD es el de crear un sistema de recomendaciones de películas a nuestros usuarios y también ir viendo las películas que han visto nuestros usuarios

// Creación de un usuario 
// Con el :User estamos indicando que crearemos un nodo con el nombre de User y luego, entre llaves como si fuese un objeto de JavaScript pasamos los atributos queremos guardar en ese nodo

CREATE (:User {name: 'Jon', age: 39})

// Creación de una película
CREATE (:Movie {title: 'Inception', genre: 'Thriller'})

// Creación de una relación entre un usuario y una película. Esto es lo que se llama una arista o edge
// Para esto es que tenemos la función MATCH

// La u y la m son alias que le estamos dando a los nodos que estamos creando. Esto es para que sea mas fácil de leer y escribir

// CREATE: es un comando que nos permite crear un nodo o una relación entre nodos

// El HAS_SEEN es el nombre de la relación que estamos creando entre el usuario y la película. Esta relación es unidireccional, es decir, el usuario ha visto la película, pero la película no ha visto al usuario

// Esta relación se puede entender muy bien relacionando el diagrama de entidad relación, en el cual se creaba un rombo y se ponía el nombre o el verbo de la relación entre las dos entidades

MATCH (u:User {name: 'Jon'}), (m:Movie {title: 'Inception'})
CREATE (u)-[:HAS_SEEN]->(m)

// CRUD

// Create 
// Poblando mas nuestra BD

// Nodos
CREATE (:User {name: 'Alice', age: 30})
CREATE (:User {name: 'Bob', age: 28})

CREATE (:Movie {title: 'The Shawshank Redemption', genre: 'Drama'})
CREATE (:Movie {title: 'Pulp Fiction', genre: 'Crime'})

// Relaciones
MATCH (u:User {name: 'Jon'}), (m:Movie {title: 'The Shawshank Redemption'})
CREATE (u)-[:HAS_SEEN]->(m)

MATCH (u:User {name: 'Jon'}), (m:Movie {title: 'Pulp Fiction'})
CREATE (u)-[:HAS_SEEN]->(m)

MATCH (u:User {name: 'Alice'}), (m:Movie {title: 'The Shawshank Redemption'})
CREATE (u)-[:HAS_SEEN]->(m)

MATCH (u:User {name: 'Bob'}), (m:Movie {title: 'Pulp Fiction'})
CREATE (u)-[:HAS_SEEN]->(m)

// El return es para que se muestre en pantalla la información de lo que se ha creado 
CREATE (:User {name: 'kEnAi', age: 10})

// Read

// Estos dos comandos no se pueden ejecutar en paralelo ya que estamos tratando de recuperar la información de algo que se esta creando. Podemos ejecutar varios comandos a la misma vez siempre y cuando no estén afectando a la misma información o tengan algo en común
MATCH (u:User {name: 'kEnAi'})
RETURN u

// UPDATE

// Para actualizar un nodo, lo que hacemos es que buscamos el nodo que queremos actualizar y luego le pasamos los atributos que queremos actualizar
MATCH (u:User {name: 'kEnAi'})
SET u.age = 11

// DELETE

// El DETACH es para que se elimine la relación entre el nodo y las relaciones que tenga con otros nodos y luego este se elimine

MATCH (u:User {name: 'kEnAi'})
DETACH DELETE u
