-- 2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados

-- Inserta 5 películas y 5 tags.

INSERT INTO peliculas (nombre, año) VALUES
    ('El especialista', 2024),
    ('Civil War', 2024),
    ('El Señor de los Anillos: El retorno del Rey', 2003),
    ('Top Gun: Maverick', 2022),
    ('El Caballero de la Noche', 2008);

 id_peli |                   nombre                    | año
---------+---------------------------------------------+------
       1 | El especialista                             | 2024
       2 | Civil War                                   | 2024
       3 | El Señor de los Anillos: El retorno del Rey | 2003
       4 | Top Gun: Maverick                           | 2022
       5 | El Caballero de la Noche                    | 2008
(5 filas)

INSERT INTO tags (tag) VALUES
    ('Accion'),
    ('Aventura'),
    ('Fantasia'),
    ('Superheroes'),
    ('Drama');

 id_tag |     tag
--------+-------------
      1 | Accion
      2 | Aventura
      3 | Fantasia
      4 | Superheroes
      5 | Drama
(5 filas)

-- la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados.

INSERT INTO catalogo (id_peliculas, id_tags) VALUES
    (1, 1), -- El especialista (Acción)
    (1, 2), -- El especialista (Aventura)
    (1, 4), -- El especialista (Superhéroes)
    (2, 1), -- Civil War (Acción)
    (2, 4); -- Civil War (Superhéroes)

 id_peliculas | id_tags
--------------+---------
            1 |       1
            1 |       2
            1 |       4
            2 |       1
            2 |       4
(5 filas)

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.

SELECT p.nombre, COALESCE(COUNT(t.tag), 0) AS num_tags
FROM peliculas AS p
LEFT JOIN catalogo AS c ON p.id_peli = c.id_peliculas
LEFT JOIN tags AS t ON c.id_tags = t.id_tag
GROUP BY p.nombre
ORDER BY p.nombre;

                   nombre                    | num_tags
---------------------------------------------+----------
 Civil War                                   |        2
 El Caballero de la Noche                    |        0
 El especialista                             |        3
 El Señor de los Anillos: El retorno del Rey |        0
 Top Gun: Maverick                           |        0
(5 filas)