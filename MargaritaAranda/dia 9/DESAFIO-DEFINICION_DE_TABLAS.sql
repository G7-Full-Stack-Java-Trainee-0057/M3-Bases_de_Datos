--indgresar a postgres--
psql -U postgres

--1. Crear una base de datos llamada películas.

CREATE DATABASE "peliculas";
CREATE DATABASE

--entrar a la base de datos "peliculas"

\c peliculas;
You are now connected to database "peliculas" as user "postgres".

--2. Crear tablas peliculas y reparto.
create table reparto (id_pelicula INT, actor VARCHAR(30));
INSERT INTO reparto (id_pelicula, actor) VALUES 
--ingreso datos --

--3. Obtener el ID de la película “Titanic”.

SELECT id FROM peliculas WHERE pelicula = 'Titanic';
 id
----
  2
(1 fila)

--4. Listar a todos los actores que aparecen en la película "Titanic".

SELECT actor FROM reparto WHERE id_pelicula = '2';
       actor
-------------------
 Leonardo DiCaprio
 Kate Winslet
 Billy Zane
 Kathy Bates
 Frances Fisher
 Bernard Hill
 Jonathan Hyde
 Danny Nucci
 David Warner
 Bill Paxton
 Gloria Stuart
 Victor Garber
 Suzy Amis
(13 filas)

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(Peliculas) AS cantidad_participada FROM peliculas JOIN reparto ON peliculas.id = reparto.id_pelicula
WHERE reparto.actor = 'Harrison Ford';
 cantidad_participada
----------------------
                    8
(1 fila) 

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
--manera ascendente.

SELECT pelicula, ano_estreno FROM peliculas WHERE ano_estreno => 1990 AND ano_estreno <= 1999 ORDER BY pelicula ASC;

                  pelicula                  | ano_estreno
--------------------------------------------+-------------
 American Beauty                            |        1999
 American History X                         |        1998
 Braveheart                                 |        1995
 Cadena perpetua                            |        1994
 Eduardo Manostijeras                       |        1990
 El club de la pelea                        |        1999
 El Padrino. Parte III                      |        1990
 El profesional                             |        1994
 El sexto sentido                           |        1999
 El show de Truman                          |        1998
 El silencio de los corderos                |        1991
 Entrevista con el vampiro                  |        1994
 Forest Gump                                |        1994
 Hombres de negro                           |        1997
 La lista de Schindler                      |        1993
 La milla verde                             |        1999
 Matrix                                     |        1999
 Mejor... imposible                         |        1997
 Parque Jurásico                            |        1993
 Pesadilla antes de navidad                 |        1993
 Pulp Fiction                               |        1994
 Salvar al soldado Ryan                     |        1998
 Seven                                      |        1995
 Star Wars. Episodio I: La amenaza fantasma |        1999
 Terminator 2: el juicio final              |        1991
 Titanic                                    |        1997
 Toy Story                                  |        1995
 Toy Story 2                                |        1999
 Trainspotting                              |        1996
 Uno de los nuestros                        |        1990
(30 filas)

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
--nombrado para la consulta como “longitud_titulo”.

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;


                       pelicula                       | longitud_titulo
------------------------------------------------------+-----------------
 Forest Gump                                          |              11
 Titanic                                              |               7
 El Padrino                                           |              10
 Gladiator                                            |               9
 El Señor de los anillos: El retorno del rey          |              43
 El caballero oscuro                                  |              19
 Cadena perpetua                                      |              15
 Piratas del Caribe: La maldición de la Perla Negra   |              50
 Braveheart                                           |              10
 La lista de Schindler                                |              21
 Toy Story                                            |               9
 Eduardo Manostijeras                                 |              20
 El Señor de los anillos: La comunidad del anillo     |              48
 Salvar al soldado Ryan                               |              22
 Regreso al futuro                                    |              17
 Monstruos S.A.                                       |              14
 Buscando a Nemo                                      |              15
 El Señor de los anillos: Las dos torres              |              39
 Harry Potter y el Prisionero de Azkaban              |              39
 American History X                                   |              18
 300                                                  |               3
 El sexto sentido                                     |              16
 Pulp Fiction                                         |              12
 V de Vendetta                                        |              13
 El silencio de los corderos                          |              27
 Rocky                                                |               5
 El club de la pelea                                  |              19

 ... ETC (100 filas)


 --8. Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX(LENGTH(pelicula)) AS longitud_mas_grande FROM peliculas LIMIT 1;
 longitud_mas_grande
---------------------
                  52
(1 fila)