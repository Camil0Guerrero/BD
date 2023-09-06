# Entidades y Atributos

## Entidades

Una entidad es un objeto del mundo real, que pretendemos controlar dentro del sistema de información, por ejemplo, una persona, un producto, una cuenta, un servicio, una empresa, una factura, una compra, etc.
Es ese objeto del cual vamos a almacenar información, las entidades al ser objetos tendrán características que las describen y estas propiedades son a los que se les llama atributos de la entidad. Por ejemplo, con la entidad persona, esta tiene atributos como nombre, apellido, fecha de nacimiento, domicilio, correo, etc.

Esto es lo primero que debemos hacer al diseñar una base de datos, identificar las entidades que vamos a controlar dentro del sistema de información por consiguiente sus atributos.

### Tipos de entidades

#### De Datos

Son aquellas que van a almacenar la información del sistema, en ellas vamos a almacenar, a capturar e interactuar con los datos. Por ejemplo, si tenemos un sistema gestor de educativo, tendremos personas, por lo que podemos tener una entidad donde almacene todos los atributos de estas personas como su nombre, apellido, fecha de nacimiento, etc.

#### Catálogos

Una entidad que funciona como catalogo, todos los registros de datos que tenga, cuando empecemos a interactuar con el modelo de datos su información ya debe estar previamente capturada ya que las entidades de datos, en las entidades donde se almacenan la información, en ocasiones habrán campos donde jales justamente este listado del catalogo, por ello debe estar cargado previamente. Retomando nuestro ejemplo anterior, podemos tener muchas personas, pero dentro de un sistema de gestión escolar podemos diferenciar tres tipos de personas: Estudiantes, Administrativos y Profesores. De este modo podemos tener en la entidad personas un campo que se llame tipo y dependiendo de este elegir Estudiante, Profesor o Administrativo. Pero estos datos se estarían tomando de un catalogo, de una entidad que funciona para justamente que los valores ya estén cargadas todas estas opciones.

#### Pivote

Estas entidades son las que nos permiten hacer relación de información entre dos o mas entidades, nos ayudaran sobre todo en un modelo relacional a mantener la consistencia del sistema y evitar duplicidad de datos, también se les suele llamar _entidades de enlace_ o _entidades de asociación_. En nuestro ejemplo, podemos tomar una entidad profesor, este profesor va a estar relacionado a ciertas materias o grupos de estudiantes.

## Atributos

Los atributos son las características, esos datos que se almacenan de las entidades que están en nuestro sistema y de los que queremos almacenar información.

Esto conlleva a otro termino fundamental en la programación y también atañe a las BD que son los diferentes _tipos de datos_ en este caso que podemos almacenar en un modelo de datos, entonces los atributos al final se convierten a nivel de programación en los tipos de datos que podemos almacenar

**Los tipos de datos que podemos tener en nuestra BD son:**

- Números enteros y flotantes
- Cadenas y caracteres de texto
- Fechas y horas -> Siempre es importante guardar el momento de una transacción para tenerlo como referencia
- Booleanos
- Binarios -> Imágenes, archivos, etc. | Aunque se puede no es recomendado hacerlo ya que al momento de recuperar la información demanda mucho, lo mejor es almacenarlo en una SAN(Storage Area Network) o en un servicio de la nube y guardar la ruta en la BD
- Datos geográficos -> Coordenadas, mapas, etc. | Este tipo de dato se usa mas en los modelos orientados a grafos
