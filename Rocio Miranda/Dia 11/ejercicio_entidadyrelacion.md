-- Creo una tabla con las entidades Actores y películas.
-- En la entidad actores debe tener atributos: Actor_ID, Nombre y ID_pelicula
-- En la entidad peliculas debe tener Actor_ID, nombre y ID_pelicula.
-- Se crea la relación o tabla intermedia que une estas dos entidades, dado que es una relación N:N y por lo tanto no es posible graficar estas tablas, por lo que se crea una tabla intermedia que muestre la relación. En ese caso seria una tabla llamada "PARTICIPACIÓN".
-- creo tres tablas mostrando los atributos y su cardinalidad.
### Tabla: Actores

- **Actores:**
  - ID_actor
  - Nombre

### Tabla: Participación

- **Participación:**
  - ID_participación
  - ID_actor (de la tabla Actores)
  - ID_pelicula (de la tabla Peliculas)

### Tabla: Peliculas

- **Peliculas:**
  - ID_pelicula
  - Nombre
  - Genero

Resolucion de los otros ejercicios adjuntados en imagen png en la misma carpeta c:
