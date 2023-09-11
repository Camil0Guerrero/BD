# Muestra todas nuestras bases de datos
show dbs

# No hay un comando como tal para crear una BD ya que este sistema gestor es de lazy writing ( escritura lenta ) esto quiere decir que cuando ejecutamos por primera vez una instruccion donde indiquemos el nombre de una BD e insertemos un documento, hasta ese momento se creara nuestra BD.

# Por ejemplo si ejecutamos el comando para usar una BD que no existe, esta nos mostrara un mensaje de que se creo la BD pero en realidad no se creo hasta que insertemos un documento en ella.

use db_name

# En este caso se plantea el caso de tener los libros con autores para hacer nuestro CRUD tradicional

# Coleccion: Libros

# En mongoDB y en general las BD No relecionales se acostumbra a tener el nombre de las colecciones en plural y con el id de cada documento en singular con un _ al inicio. Este id se puede saltar al momento de crear nuestro documento ya que mongoDB lo crea automaticamente.

db.books.insertMany([

{
  title: "El Gran Gatsby",
  author: "F. Scott Fitzgerald",
  publishedYear: 1925,
  genres: ["Ficcion", "Clasico"],
  price: 12.99
},

{
  title: "1984",
  author: "George Orwell",
  publishedYear: 1949,
  genres: ["Ficcion", "Distopia"],
  price: 9.99
},

{
  title: "Orgullo y prejuicio",
  author: "Jane Austen",
  publishedYear: 1813,
  genres: ["Ficcion", "Romance"],
  price: 10.99
}])

# Coleccion Autores

# Guardaremos los id's de nuestros books en un array, sin embargo, esto no es una relacion como tal, ya que no hay una relacion entre las colecciones, solo estamos guardando el id de un documento en otro. Tambien es valido poner el titulo de nuestro libro en el array de books, pero esto no es recomendable ya que si el titulo cambia, tendriamos que cambiarlo en todos los documentos donde se encuentre.

db.authors.insertMany(
[{
  name: "F. Scott Fitzgerald",
  nationality: "Estadounidense",
  birthDate: ISODate("1896-09-24"),
  books: [
    ObjectId("64ff402d6fa04dd7df5faff9"),
    ObjectId("64ff402d6fa04dd7df5faffa")
  ]
},

{
  name: "George Orwell",
  nationality: "Britanico",
  birthDate: ISODate("1903-06-25"),
  books: [
    ObjectId("64ff402d6fa04dd7df5faffa")
  ]
},

{
  name: "Jane Austen",
  nationality: "Britanico",
  birthDate: ISODate("1775-12-16"),
  books: [
    ObjectId("64ff402d6fa04dd7df5faffb")
  ]
}])

# CRUD 

# Create

# Para insertar un documento en una coleccion usamos el comando insertOne() y le pasamos como parametro un objeto con los campos y valores que queremos insertar.

db.books.insertOne({
  title: 'Nuevo Libro',
  author: 'Autor Desconocido',
  publishedYear: 2023, 
  genres: ['Ficcion', 'Misterio'],
  price: 14.99
})

# Read
# Tenemos varias formas de obtener la informacion de nuestra BD, la primera es usando el comando find() y pasandole como parametro un objeto vacio, esto nos devolvera todos los documentos de la coleccion.

db.books.find({})

# Para buscar un documento en especifico usamos el comando findOne() y le pasamos como parametro un objeto con los campos y valores que queremos buscar.

db.books.findOne({ title: 'El Gran Gatsby' })

# Para actualizar nuestra coleccion lo recomendado es unar el comando updateOne() y le pasamos como parametro un objeto con los campos y valores que queremos buscar y otro objeto con los campos y valores que queremos actualizar. Este segundo objeto como buena practica debe ir acompañado de un operador de actualizacion, en este caso usaremos $set ya que este busca cuales son los campos que hemos modificado y los actualiza, si no agregamos este operador lo que hariamos es 'machacar' los datos, es decir, borrar todo y agregar unos nuevos.

db.books.updateOne({ title: 'El Gran Gatsby' }, { $set: { price: 11.99 } })

# Delete
# Para eliminar un documento usamos el comando deleteOne() y le pasamos como parametro un objeto con los campos y valores que queremos buscar.

db.books.deleteOne({ title: "Nuevo Libro"})

# Ejemplo de CRUD con Autores

db.authors.insertOne({
  name: "Nuevo Autor",
  "nationality": "Desconocida",
  birthDate: new Date("1990-01-01"),
  books: []
})

db.authors.findOne({ name: "F. Scott Fitzgerald" })
db.authors.updateOne({ name: "F. Scott Fitzgerald" }, { $set: { nationality: "Estadounidense"} })
db.authors.deleteOne({ name: "Nuevo Autor" })