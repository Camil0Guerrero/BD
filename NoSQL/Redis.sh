# Un hash en Redis es un tipo de dato que representa una coleccion de pares clave-valor. Las claves y los valores son cadenas de caracteres. Los hashes son similares a los diccionarios en Python, los mapan en Java y los objetos en JavaScript.

# HSET: Este comando nos ayuda a crear o modificar el valor de un campo en un hash. Si el campo no existe, se crea y se establece el valor. Si el campo existe, se sobrescribe el valor anterior con el nuevo valor.

# La estructura de los comandos es algo distinta a la que estoy acostrumbrado, ya que esta no necesita de comillas para los valores, solo para los campos, ademas estos no se deben separar por comas, sino por espacios. tampoco debemos poner puntos y comas ya que estos comandos se deben ejecutar en la consola.

# user es el nombre de nuestro hash, el nombre de la coleccion, esto lo podriamos tomar como el nombre de la tabla en una base de datos relacional. O cuando damos el indice de un arreglo 'MyArray[0]' 

# Practicaremos poniendo el caso de uso de una red social en la cual almacenaremos tanto la informacion de nuestros usuarios como las publicacion que estos hagan.

# Creacion de usuarios 
HSET user:1 name "John Deo" age 30 location "New York"
HSET user:2 name "Jane Smith" age 25 location "London"


# LPUSH: Este es como el metodo push que tenemos para los arreglos de JavaScript, por lo que nos ayudara a agregar un nuevo elemento a una lista, en este caso se llama LPUSH ya que lo agrega al inicio de la lista, es decir, a la izquierda, si quisieramos que se agregara al final debemos usar RPUSH.

# Explicando el comando seria algo asi como: agrega al usuario con el id 1 un nuevo hash (campo) que se llame posts y que tenga como valor 1001, es decir, el id de la publicacion que acaba de crear.
# Creacion de publicaciones
LPUSH user:1:posts 1001
LPUSH user:1:posts 1002
LPUSH user:2:posts 2001

# Luego de crear los posts lo que haremos es agregarles informacion a estos, como el contenido, la fecha de creacion y los likes. 

# Para esta necesidad tambiennos sirve el comando HSET, ya que lo que haremos sera agregar un nuevo campo a cada uno de los hashes que acabamos de crear

HSET post:1001 content "Hola a todos!" created_at "2023-05-10 10:00:00" likes 10
HSET post:1002 content "Feliz cumpleaños a mi!" created_at "2023-05-09 15:30:00" likes 20
HSET post:2001 content "Gran dia en la playa!" created_at "2023-05-08 12:45:00" likes 15


# Creamos nuestro tercer usuario 
HSET user:3 name "Sarah Johnson" age 35 location "San Francisco"

# HGETALL: Este comando nos ayuda a traer todos los campos de un hash, es decir, todos los valores de un objeto, en este caso, todos los datos de un usuario.
# Es como si hicieramos un SELECT * FROM users WHERE id = 1

HGETALL user:1


# HGET: Este comando ya nos trae un campo especifico de un hash, es decir, un valor especifico de un objeto, en este caso, el nombre de un usuario.
# Es como si hicieramos un SELECT name FROM users WHERE id = 1

HGET user:1 name


# Para modificar un campo de un hash, es decir, un valor de un objeto, usamos el comando HSET, el cual ya vimos anteriormente, pero esta vez le pasamos el id del usuario, el nombre del campo que queremos modificar y el nuevo valor que queremos que tenga.
HSET user:2 age 26

# Para eliminar un campo de un hash usamos el comando DEL y le pasamos el id del usuario y el nombre del campo que queremos eliminar si queremos eleminar uno en especifico.

DEL user:3

# Creamos otro post
LPUSH user:1:posts 1003
HSET post:1003 content "Que gran dia!" created_at "2023-05-07 09:00:00" likes 15

# Para obtener la informacion de los posts
HGETALL post:1001

# Modificar un post
HSET post:1002 likes 30

# Eliminar un post
DEL post:1003