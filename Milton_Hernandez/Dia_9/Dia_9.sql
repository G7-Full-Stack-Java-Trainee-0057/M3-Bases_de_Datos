--Crear una base de datos llamada películas.
CREATE DATABASE peliculas;
--Conecto con la base de datos
\c 
--Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY, 
    pelicula VARCHAR(250),
    año_de_estreno INT,
    director VARCHAR(250)
);
CREATE TABLE reparto (
id_pelicula INT,
actor VARCHAR(250),
FOREIGN KEY (id_pelicula) REFERENCES peliculas(id));
--Importar archivos csv a registros
\copy peliculas FROM 'peliculas.csv' DELIMITER ',' CSV HEADER;
\copy reparto FROM 'reparto.csv' DELIMITER ',' CSV HEADER;
--Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';
--Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE id_pelicula = (SELECT id FROM peliculas WHERE pelicula = 'Titanic');
--Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*) FROM reparto WHERE actor = 'Harrison Ford';
--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE año_de_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula;
--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT pelicula, LENGTH (pelicula) AS longitud_titulo FROM peliculas;  
--Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT pelicula, MAX (LENGTH (pelicula)) AS longitud_titulo FROM peliculas;
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC LIMIT 1;

postgres=# CREATE DATABASE peliculas;
CREATE DATABASE
postgres=# \c
You are now connected to database "postgres" as user "postgres".
postgres=# CREATE TABLE peliculas (
postgres(#     id SERIAL PRIMARY KEY,
postgres(#     pelicula VARCHAR(250),
postgres(#     año_de_estreno INT,
postgres(#     director VARCHAR(250),
postgres(# );
ERROR:  error de sintaxis en o cerca de «)»
LINE 6: );
        ^
postgres=# CREATE TABLE peliculas (
postgres(#     id SERIAL PRIMARY KEY,
postgres(#     pelicula VARCHAR(250),
postgres(#     año_de_estreno INT,
postgres(#     director VARCHAR(250)
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE reparto (
postgres(# id_pelicula INT,
postgres(# actor VARCHAR(250),
postgres(# FOREIGN KEY (id_peliculas) REFERENCES peliculas(id));
ERROR:  no existe la columna «id_peliculas» referida en la llave foránea
postgres=# CREATE TABLE reparto (
postgres(# id_pelicula INT,
postgres(# actor VARCHAR(250),
postgres(# FOREIGN KEY (id_pelicula) REFERENCES peliculas(id));
CREATE TABLE
postgres=# \c
You are now connected to database "postgres" as user "postgres".
postgres=# \copy peliculas FROM 'peliculas.csv' DELIMITER ',' CSV HEADER;
COPY 100
postgres=# \copy reparto FROM 'reparto.csv' DELIMITER ',' CSV HEADER;
COPY 1051
postgres=# SELECT id FROM peliculas WHERE pelicula = 'Titanic';
 id
----
  2
(1 row)


postgres=# SELECT * FROM reparto WHERE id_pelicula = (SELECT id FROM peliculas WHERE pelicula = 'Titanic');
 id_pelicula |       actor
-------------+-------------------
           2 | Leonardo DiCaprio
           2 | Kate Winslet
           2 | Billy Zane
           2 | Kathy Bates
           2 | Frances Fisher
           2 | Bernard Hill
           2 | Jonathan Hyde
           2 | Danny Nucci
           2 | David Warner
           2 | Bill Paxton
           2 | Gloria Stuart
           2 | Victor Garber
           2 | Suzy Amis
(13 rows)


postgres=# SELECT COUNT (*) FROM peliculas WHERE actor = 'Harrison Ford'
postgres-# SELECT COUNT (*) FROM peliculas WHERE actor = 'Harrison Ford';
ERROR:  error de sintaxis en o cerca de «SELECT»
LINE 2: SELECT COUNT (*) FROM peliculas WHERE actor = 'Harrison Ford...
        ^
postgres=#
postgres=# SELECT COUNT(*) FROM reparto WHERE actor = 'Harrison Ford';
 count
-------
     8
(1 row)


postgres=# SELECT * FROM peliculas WHERE año_de_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula;
 id |                  pelicula                  | año_de_estreno |       director
----+--------------------------------------------+----------------+-----------------------
 76 | American Beauty                            |           1999 | Sam Mendes
 20 | American History X                         |           1998 | Tony Kaye
  9 | Braveheart                                 |           1995 | Mel Gibson
  7 | Cadena perpetua                            |           1994 | Frank Darabont
 12 | Eduardo Manostijeras                       |           1990 | Tim Burton
 27 | El club de la pelea                        |           1999 | David Fincher
 68 | El Padrino. Parte III                      |           1990 | Francis Ford Coppola
 75 | El profesional                             |           1994 | Luc Besson
 22 | El sexto sentido                           |           1999 | M. Night Shyamalan
 45 | El show de Truman                          |           1998 | Peter Weir
 25 | El silencio de los corderos                |           1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |           1994 | Neil Jordan
  1 | Forest Gump                                |           1994 | Robert Zemeckis
 42 | Hombres de negro                           |           1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |           1993 | Steven Spielberg
 31 | La milla verde                             |           1999 | Frank Darabont
 30 | Matrix                                     |           1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |           1997 | James L. Brooks
 29 | Parque Jur├ísico                           |           1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |           1993 | Henry Selick
 23 | Pulp Fiction                               |           1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     |           1998 | Steven Spielberg
 39 | Seven                                      |           1995 | David Fincher
 86 | Star Wars. Episodio I: La amenaza fantasma |           1999 | George Lucas
 40 | Terminator 2: el juicio final              |           1991 | James Cameron
  2 | Titanic                                    |           1997 | James Cameron
 11 | Toy Story                                  |           1995 | John Lasseter
 46 | Toy Story 2                                |           1999 | John Lasseter
 79 | Trainspotting                              |           1996 | Danny Boyle
 98 | Uno de los nuestros                        |           1990 | Martin Scorsese
(30 rows)


postgres=# SELECT pelicula, LENGTH (pelicula) AS longitud_titulo FROM peliculas;
                       pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
 Forest Gump                                           |              11
 Titanic                                               |               7
 El Padrino                                            |              10
 Gladiator                                             |               9
 El Se├▒or de los anillos: El retorno del rey          |              44
 El caballero oscuro                                   |              19
 Cadena perpetua                                       |              15
 Piratas del Caribe: La maldici├│n de la Perla Negra   |              51
 Braveheart                                            |              10
 La lista de Schindler                                 |              21
 Toy Story                                             |               9
 Eduardo Manostijeras                                  |              20
 El Se├▒or de los anillos: La comunidad del anillo     |              49
 Salvar al soldado Ryan                                |              22
 Regreso al futuro                                     |              17
 Monstruos S.A.                                        |              14
 Buscando a Nemo                                       |              15
 El Se├▒or de los anillos: Las dos torres              |              40
 Harry Potter y el Prisionero de Azkaban               |              39
 American History X                                    |              18
 300                                                   |               3
 El sexto sentido                                      |              16
 Pulp Fiction                                          |              12
 V de Vendetta                                         |              13
 El silencio de los corderos                           |              27
 Rocky                                                 |               5
 El club de la pelea                                   |              19
 E.T                                                   |               3
 Parque Jur├ísico                                      |              16
 Matrix                                                |               6
 La milla verde                                        |              14
 Ratatouille                                           |              11
 Grease                                                |               6
 El Padrino. Parte II                                  |              20
 Wall-E                                                |               6
 Iron Man                                              |               8
 El exorcista                                          |              12
 Piratas del Caribe: El cofre del hombre muerto        |              46
 Seven                                                 |               5
 Terminator 2: el juicio final                         |              29
 El resplandor                                         |              13
 Hombres de negro                                      |              16
 Spider-Man                                            |              10
 Regreso al futuro II                                  |              20
 El show de Truman                                     |              17
 Toy Story 2                                           |              11
 Pesadilla antes de navidad                            |              26
 Star Wars. Episodio IV: Una nueva esperanza           |              43
 Saw                                                   |               3
 Terminator                                            |              10
 Kill Bill Vol. 1                                      |              16
 Lo que el viento se llev├│                            |              26
 El Laberinto del Fauno                                |              22
 Los incre├¡bles                                       |              15
 El viaje de Chihiro                                   |              19
 El precio del poder                                   |              19
 King Kong                                             |               9
 Ben-Hur                                               |               7
 Indiana Jones y la ├║ltima cruzada                    |              34
 Infiltrados                                           |              11
 Entrevista con el vampiro                             |              25
 Batman Begins                                         |              13
 En busca del arca perdida                             |              25
 Star Wars. Episodio III: La venganza de los Sith      |              48
 Alien                                                 |               5
 El bueno el feo y el malo                             |              25
 Star Wars. Episodio V: El imperio contraataca         |              45
 El Padrino. Parte III                                 |              21
 Star Wars. Episodio VI: El retorno del Jedi           |              43
 Escuela de Rock                                       |              15
 El planeta de los simios                              |              24
 Rambo                                                 |               5
 Full Metal Jacket                                     |              17
 Tibur├│n                                              |               8
 El profesional                                        |              14
 American Beauty                                       |              15
 Casablanca                                            |              10
 Am├®lie                                               |               7
 Trainspotting                                         |              13
 axi driver                                            |              10
 Alguien vol├│ sobre el nido del cuco                  |              36
 Kill Bill Vol. 2                                      |              16
 Spider-Man 2                                          |              12
 X-Men 2                                               |               7
 Transformers                                          |              12
 Star Wars. Episodio I: La amenaza fantasma            |              42
 Blade Runner                                          |              12
 Apocalypse Now                                        |              14
 Mejor... imposible                                    |              18
 La vida de Brian                                      |              16
 El libro de la selva                                  |              20
 Los cazafantasmas                                     |              17
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
 Ocean's Eleven                                        |              14
 Blancanieves y los siete enanitos                     |              33
 Predator                                              |               8
 Indiana Jones y el templo maldito                     |              33
 Uno de los nuestros                                   |              19
 Mouling Rouge                                         |              13
 Psicosis                                              |               8
(100 rows)


postgres=#
postgres=#
postgres=#
postgres=# SELECT pelicula, MAX (LENGTH (pelicula)) AS longitud_titulo FROM peliculas;
ERROR:  la columna «peliculas.pelicula» debe aparecer en la cláusula GROUP BY o ser usada en una función de agregación
LINE 1: SELECT pelicula, MAX (LENGTH (pelicula)) AS longitud_titulo ...
               ^
postgres=# SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC LIMIT 1;
                       pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
(1 row)


postgres=# \q

