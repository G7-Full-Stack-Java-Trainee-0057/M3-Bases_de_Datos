--Creación Base de datos
CREATE DATABASE peliculasyTags;

--Creación Tabla peliculas 
CREATE TABLE peliculas(
id_peliculas INT PRIMARY KEY,
nombre VARCHAR(255),
año INT
);

--Creación Tabla tags
CREATE TABLE tags(
id_tags INT PRIMARY KEY,
tag VARCHAR(32)
);

--Creacion tabla intermedia peliculas_tags
CREATE TABLE peliculas_tags(
id_peliculasTags INT PRIMARY KEY,
id_peliculas INT,
id_tags INT,
FOREIGN KEY(id_peliculas) REFERENCES peliculas (id_peliculas),
FOREIGN KEY(id_tags) REFERENCES tags (id_tags)
);




--2.- Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados.

--Inserte datos en la tabla peliculas
INSERT INTO peliculas (id_peliculas, nombre, año)
VALUES 
(1, 'El código de Da Vinci', 2011),
(2, 'Harry Potter', 2002),
(3, 'El Señor de los Anillos', 2005),
(4, 'El gran truco', 2010),
(5, 'La Isla Siniestra', 2016);

--Inserte datos en la tabla tags
INSERT INTO tags (id_tags, tag)
VALUES
(1, 'Misterio'),
(2, 'Acción'),
(3, 'Fantasía'),
(4, 'Suspenso'),
(5, 'Drama');

--Inserte registros en la tabla intermedia peliculas_tags
INSERT INTO peliculas_tags (id_peliculasTags, id_peliculas, id_tags)
VALUES 
(1, 1, 1),
(2, 1, 4),
(3, 1, 5),
(4, 2, 3),
(5, 2, 5);

--3.- Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.
SELECT peliculas.id_peliculas, peliculas.nombre, COUNT(peliculas_tags.id_tags) AS Numero_tags
FROM peliculas
LEFT JOIN peliculas_tags ON peliculas.id_peliculas = peliculas_tags.id_peliculas
LEFT JOIN tags ON peliculas_tags.id_tags = tags.id_tags
GROUP BY peliculas.id_peliculas, peliculas.nombre;
