# Relaciones

Son esas asociaciones que hacemos entre las entidades para poder recuperar y vincular los datos.
Para crear una relación semántica se utiliza un verbo para relacionar la entidad en cuestión

## Tipos

- 1 a 1 -> Un elemento con otro
  - Ejemplo: Las placas con un automóvil | otros automóviles no pueden tener las mismas placas y las placas no pueden tener mas de un automóvil
- 1 a muchos -> Un elemento con muchos

  - Las facturas de una empresa. Esta empresa puede tener muchas facturas pero una factura solo puede pertenecer a una empresa

- Muchos a muchos -> Muchos elementos con muchos elementos
  - Si estamos usando una BD Relacional esto no debe pasar mucho ya que no es el objetivo de estas o revisar el diseño de la BD
  - Ejemplo: Los alumnos y los cursos. Un alumno puede estar en muchos cursos y un curso puede tener muchos alumnos
