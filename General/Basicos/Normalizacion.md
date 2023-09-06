# Normalización

Es un proceso que se utiliza para organizar y optimizar la estructura de la BD para asegurar su integridad, evitar redundancia y por ende mejorar el rendimiento

Consiste en la division de las entidades en otras mas pequeñas e ir relacionando a partir de las llaves primarias y foráneas

Se realiza a traves de varias etapas o niveles que se conocen como las formas normales. Las tres primeras son mas comunes y las mas utilizadas

La cuarta forma normal también se le puede llamar como la forma normal de Boyce-Codd y la quinta forma normal como la forma normal de proyeccion-union o dominio clave-valor

El objetivo de la normalización es evitar la redundancia y garantizar la integridad de los datos, asegurando que los datos se almacene en un solo lugar, es decir, vamos a evitar duplicados y por ende nuestros datos van a tener mayor consistencia y coherencia. También va a ayudar al rendimiento porque al tener optimizada la BD reducirá el tamaño y la complejidad entre las entidades

La normalización se puede comparar con la programación orientada a componentes u objetos, ya que sigue como el mismo objetivo, que es dividir en partes mas pequeñas para que sea mas fácil de mantener y de entender
En este contexto seria tener varias tablas pero que cada una de ellas se preocupe por almacenar un dato o un conjunto de datos que hagan referencia a una sola entidad, es decir, que no mezclemos entidades

Esto es exclusivo de las BD relacionales, sin embargo, esta puede dar pie a que nos reemplantiemos si hemos elegido bien el modelo de BD, ya que si no lo hemos hecho bien, la normalización no nos va a servir de nada

## Formas normales

### Primera forma normal

Cada atributo de una entidad debe contener un solo valor atómico, es decir, los valores deben ser indivisibles no pueden ser divididos en atributos mas pequeños

### Segunda forma normal

Ademas de cumplir con la primera, cada atributo no dependiente funcionalmente de la llave principal debe estar en una entidad separada

### Tercera forma normal

Ademas de cumplir con la anteriores formas normales, todas las dependencias funcionales deben ser eliminadas, es decir, no debe de existir dependencias funcionales transitivas o transitorias. Que los atributos solo hagan referencia a un solo concepto

### Cuarta forma normal (Boyce-Codd)

Es una forma normal mas rigurosa que las anteriores y requiere de que cada dependencia funcional sea una clave candidata única

### Quinta forma normal (Proyeccion-Union) (Dominio-clave)

En esta se va a garantizar de que no hayan dependencias multiples de conjuntos de entidades. Como lo vimos en la segunda y tercer forma pero después de haber pasado por la cuarta forma, estar revisando de que nuestro modelo cumpla con esta definición, de que cada entidad tenga los elementos que directamente dependen de el

---

La BD no siempre debe cumplir con estas 5 formas normales, esto va a depender de la complejidad que tenga la BD. Puede que por la complejidad y la estructura de las entidades el modelo llega a la primera o segunda forma normal. Si tenemos 3 o 4 entidades seguramente se llegara a la segunda formal, en ocasiones hasta la tercera de hecho lo ideal es cumplir las primeras 3 formas normales. La cuarta y quinta forma normal es en modelos mas complejos, también tenemos de tener en cuenta que si tenemos que pasar nuestro modelo por la cuarta y quinta forma normal puede ser un indicativo de que quizás el modelo no esta bien diseñado

También se puede abusar de la normalización y si estamos iterando, iterando, iterando el modelo de datos es un síntoma de que no se esta llevando correctamente el modelado. Lo natural es llegar hasta la tercera forma normal en incluso sistemas muy complejos
