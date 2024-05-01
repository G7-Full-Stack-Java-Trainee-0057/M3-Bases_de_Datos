-- Inserción en la Tabla películas
INSERT INTO Peliculas (id, Nombre, anno) VALUES 
    ('1', 'El Padrino', 1972),
    ('2', 'La La Land', 2014),
    ('3', 'Interestelar', 2016),
    ('4', 'El Señor de los Anillos: El retorno del Rey', 2003),
    ('5', 'Parásitos', 2019);

-- Inserción en la Tabla tags
INSERT INTO Tags (ID, tag) VALUES 
    ('1', 'Drama'),
    ('2', 'Ciencia ficción'),
    ('3', 'Romance'),
    ('4', 'Fantasía'),
    ('5', 'Thriller');

-- Inserción en la Tabla Genero
INSERT INTO Genero (ID, id_pelicula, id_tag) VALUES
    ('1', '1', '1'),
    ('2', '1', '4'),
    ('3', '1', '5'),
    ('4', '3', '2'),
    ('5', '2', '1'),
    ('6', '2', '3'),
    ('8', '5', '1'),
    ('9', '5', '5');

-- Consulta: Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.
SELECT peliculas.nombre, COUNT(genero.id_tag) AS cantidad_tags 
FROM peliculas 
LEFT JOIN genero ON peliculas.id = genero.id_pelicula 
LEFT JOIN tags ON genero.id_tag = tags.id GROUP BY peliculas.nombre;
--                   nombre                    | count
-----------------------------------------------+-------
-- Parásitos                                   |     2
-- La La Land                                  |     2
-- Interestelar                                |     1
-- El Señor de los Anillos: El retorno del Rey |     0
-- El Padrino                                  |     3