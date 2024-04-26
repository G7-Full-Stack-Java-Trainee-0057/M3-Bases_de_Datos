--1. Crear una base de datos llamada películas.
CREATE DATABASE peliculas;
--nos conectamos a la base de datos
\c peliculas;

2. Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas(
    id SERIAL PRIMARY KEY,
    pelicula VARCHAR(255),
    año INT,
    director VARCHAR(255));
/* CREATE TABLE */

CREATE TABLE reparto(
    id_pelicula INT,
    actor VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id));
/*CREATE TABLE*/

/* Importar datos archivos csv a la tabla */
\copy peliculas from ‘peliculas.csv’ delimiter ‘,’ csv header;
/* COPY 100 */
/* SELECT COUNT(*) FROM peliculas;
count
-------
100
(1 row) */

\copy reparto FROM ‘reparto.csv’ DELIMITER ‘,’ CSV HEADER;
/* COPY 1051
peliculas=# SELECT COUNT(*) FROM reparto;
count
-------
1051
(1 row) */

/* 3. Obtener el ID de la película “Titanic”. */
SELECT ID FROM peliculas WHERE pelicula = 'Titanic';
/* peliculas=# SELECT ID FROM peliculas WHERE pelicula = 'Titanic';
id
----
2
(1 row) */

/* 4. Listar a todos los actores que aparecen en la película "Titanic". */
SELECT * FROM reparto WHERE id_pelicula = (SELECT ID FROM peliculas WHERE pelicula = 'Titanic');
/* id_pelicula |       actor
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
(13 rows) */

/* 5. Consultar en cuántas películas del top 100 participa Harrison Ford. */
SELECT COUNT(*) FROM reparto WHERE actor = 'Harrison Ford';
/*  count
-------
8
(1 row) */

/* 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. */
SELECT * FROM peliculas WHERE año BETWEEN 1990 AND 1999 ORDER BY pelicula;
/*  id |                  pelicula                  | año  |       director
----+--------------------------------------------+------+-----------------------
 76 | American Beauty                            | 1999 | Sam Mendes
 20 | American History X                         | 1998 | Tony Kaye
  9 | Braveheart                                 | 1995 | Mel Gibson
  7 | Cadena perpetua                            | 1994 | Frank Darabont
 12 | Eduardo Manostijeras                       | 1990 | Tim Burton
 27 | El club de la pelea                        | 1999 | David Fincher
 68 | El Padrino. Parte III                      | 1990 | Francis Ford Coppola
 75 | El profesional                             | 1994 | Luc Besson
 22 | El sexto sentido                           | 1999 | M. Night Shyamalan
 45 | El show de Truman                          | 1998 | Peter Weir
 25 | El silencio de los corderos                | 1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  | 1994 | Neil Jordan
  1 | Forest Gump                                | 1994 | Robert Zemeckis
 42 | Hombres de negro                           | 1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      | 1993 | Steven Spielberg
 31 | La milla verde                             | 1999 | Frank Darabont
 30 | Matrix                                     | 1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         | 1997 | James L. Brooks
 29 | Parque Jur├ísico                           | 1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 | 1993 | Henry Selick
 23 | Pulp Fiction                               | 1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     | 1998 | Steven Spielberg
 39 | Seven                                      | 1995 | David Fincher
 86 | Star Wars. Episodio I: La amenaza fantasma | 1999 | George Lucas
 40 | Terminator 2: el juicio final              | 1991 | James Cameron
  2 | Titanic                                    | 1997 | James Cameron
 11 | Toy Story                                  | 1995 | John Lasseter
 46 | Toy Story 2                                | 1999 | John Lasseter
 79 | Trainspotting                              | 1996 | Danny Boyle
 98 | Uno de los nuestros                        | 1990 | Martin Scorsese
(30 rows) */

/* 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
nombrado para la consulta como “longitud_titulo”. */
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas; 
/*                        pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
Forest Gump                                           |              11
Titanic                                               |               7
El Padrino                                            |              10
Gladiator                                             |               9
El Se├▒or de los anillos: El retorno del rey          |              44 */

 /* 8. Consultar cual es la longitud más grande entre todos los títulos de las películas. */
SELECT MAX(LENGTH(pelicula)) AS longitud_titulo FROM peliculas; 
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC LIMIT 1;
/*                        pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
(1 row) */
