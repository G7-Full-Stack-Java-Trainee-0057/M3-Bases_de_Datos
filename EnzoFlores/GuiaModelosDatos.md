####**MODELO CONCEPTUAL** 
* Se realiza el primer modelo representado las entidades "Actores" y "Peliculas". "Actores"  tiene los atributos actor_id y nombre. "Peliculas" tiene los atributos pelicula_id, nombre y genero.
* Para poder conectar ambas tablas se crea una tabla intermedia como entidad "Actores-Peliculas" con los atributos actor_id y
pelicula_id.

####**MODELO LÓGICO** 
* Aqui se establece la cardinalidad entre las tablas. La tabla "Actores" está relacionada con "Actores-Peliculas" a través del
atributo actor_id. Esta relación es 1:n, es decir, 1 es a muchos. 
* "Actores-Peliculas" está relacionada con "Películas" a través del atributo pelicula_id. Esta relación es n:1, es decir, muchos es a 1.

####**MODELO FÍSICO** 
* Incluye la estructuras de las tablas, deﬁniendo cada uno de sus atributos y tipo de dato para cada atributo, las restricciones de las columnas, las claves primarias, claves foráneas y las relaciones entre las tablas.
* En este caso a la tabla "Actores" se le asigna un atributo nombre con un dato de tipo varchar con un máximo de 30 caracteres y también se le asigna la restricción NOT NULL. El atributo actor_id tiene un tipo de dato INT (entero) y la restricción de PK.
* La tabla "Actores-Peliculas" tiene como atributos actor_id y pelicula_id, ambos con la restricción de FK (foreign key).
* "Peliculas" tiene los atributos pelicula_id con un tipo de dato INT (entero) y la restricción de PK (primary key). El atributo nombre tiene un tipo de dato varchar con un máximo de 50 caracteres y la restricción NOT NULL. Por último, el atributo genero 
tiene un tipo de dato varchar con un máximo de 30 caracteres y la restricción NOT NULL. 
