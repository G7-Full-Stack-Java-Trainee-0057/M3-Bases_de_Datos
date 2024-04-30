Contexto del caso.
Aplicando los conocimientos de carga de scripts SQL, deberás importar el archivo que creará las tablas de actores y películas. Para este ejercicio deberás descargar el archivo “Material de apoyo - Modelos Entidad-Relación y Relacional (I)” que estará disponible en la plataforma. Una vez descargado, realiza el proceso de importación de script.

Se desarrolla la estructura logica de las entidades, relaciones basado en el modelo de entidad-relacion, donde se identificaron entidades como "Actores", "Peliculas" y "ActoresPeliculas", esta ultima entodad es una entidad interemedia que nos ayuda a relacionar la entidad "Actores" y "Peliculas".  

| id_actor | nombre     |
|----------|------------|
| INT      | VARCHAR(30)|

| Columna     | Tipo          | Restricciones      |
|-------------|---------------|--------------------|
| id_pelicula | INT           | PRIMARY KEY        |
| pelicula    | VARCHAR(30)   |                    |
| genero      | VARCHAR(30)   | NOT NULL           |

| Columna     | Tipo        | Restricciones                                             |
|-------------|-------------|-----------------------------------------------------------|
| id_pelicula | INT         | FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) |
| id_actor    | INT         | FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)        |
| PRIMARY KEY | (id_actor, id_pelicula) |                                           |

En estas tablas se identificaron las entidades, atributos y su tipo, ademas de cada restriccion para darle identidad al campo.  
En la imagen (png) se creada la estructura logica, identificando las cardinalidades y sus campos en forma entidad-relacion.
