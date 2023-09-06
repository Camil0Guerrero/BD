# Llaves

Una llave en una BD va a ser un identificador que permite hacer único a un registro de información

## Tipos de llaves

### Primarias

Va a identificar a un registro como único dentro de la identidad a la que va a pertenecer, en nuestro listado de atributos se les suele poner las siglas PK(Primary Key) delante del atributo que sera la llave principal

Los atributos mas comunes usados como llaves primarias son:

- **ID**. Es un numero que se va a ir incrementando conforme se vayan agregando registros a la BD
- **RFC**. Es un identificador único para cada persona en México
- **DNI**. Es un identificador único para cada persona en España

### Foráneas

Son las llaves que permiten la relación entre el registro de una entidad con la de otra, de tal manera que podamos hacer esta conexión

Por ejemplo, como en los casos anteriores cuando queríamos relacionar los profesores con los estudiantes y viceversa, esta relación se hará con la llave foránea de
las entidades, en este caso tendremos un atributo para saber cual es el profesor que imparte la clase y otro para saber cual es el estudiante que esta tomando la clase.

Estas llaves foráneas podemos tomarlas como si fuesen las llaves primarias pero de otra tabla

### Únicas

Un atributo único es aquel que no puede repetirse en ningún registro de la tabla, es decir, que no puede haber dos registros con el mismo valor en ese atributo y sin que necesariamente sea una llave primaria o una llave foránea, para ello tenemos este concepto, un atributo que no queremos que se repita pero que tampoco tenemos la necesidad de que sea una llave primaria o foránea

Esta técnica se usa a menuda para asegurarnos de que los datos sean consistentes y que no hayan duplicados en la entidad

Por ejemplo, para que un usuario no tenga la capacidad de crear dos cuentas con el mismo correo o con un mismo teléfono
