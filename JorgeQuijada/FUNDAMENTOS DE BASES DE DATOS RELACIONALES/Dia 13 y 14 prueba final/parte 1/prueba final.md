# Tabla Peliculas
| Atributo        | Tipo          | Restricciones     |
|-----------------|---------------|-------------------|
| id_peli         | SERIAL        | PRIMARY KEY       |
| nombre          | VARCHAR(255)  | NOT NULL          | 
| año             | INT           |                   |

- **id_peli :** identificador unico de la tabla peliculas.
- **nombre :** nombre de la pelicula.
- **año :** año en que se estreno la pelicula.

# Tabla Tags
| Atributo        | Tipo         | Restricciones    |
|-----------------|--------------|------------------|
| id_tag          | SERIAL       | PRIMARY KEY      |
| tag             | VARCHAR(32)  | NOT NULL         | 

- **id_tag :** identificador unico de la tabla tags.
- **tag :** categoria de la pelicula.

# Tabla catalogo
| Atributo        | Tipo     | Restricciones          |
|-----------------|----------|------------------------|
| id_catalogo     | SERIAL   | PRIMARY KEY
| id_peliculas    | INT      | FOREIGN KEY            |
| id_tags         | INT      | FOREIGN KEY            | 

- **id_catalogo :** identificador unico de la tabla catalogo.
- **id_peliculas :** llave foranea que hace referencia a la tabla peliculas.
- **id_tags :** llave foranea que hace referencia a la tabla tags.

Relaciones:
-
- Una pelicula puede tener uno o mas tags.
- Un tag puede estar presente en una o mas peliculas.