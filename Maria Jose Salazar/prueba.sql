psql -U postgres
Crear una base de datos llamada películas.
CREATE DATABASE Peliculas;

--nos conectamos a la base de dato 
\c Peliculas

Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    pelicula VARCHAR(255),
    estreno INT, 
    director VARCHAR(200)
);


CREATE TABLE reparto (
    id_pelicula INT,
    actor VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas (id)
);

--importar datos de archivos CSV a la tabla
\copy peliculas (nombre, precio, stock) FROM ‘/peliculas.csv’ DELIMITER ‘,’ CSV HEADER;

--Obtener el ID de la película “Titanic”.
SELECT ID FROM peliculas WHERE pelicula = “Titanic”
-- id 2

--Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE id_pelicula = (SELECT ID FROM peliculas WHERE pelicula = “Titanic”)

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

--Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT (*) peliculas WHERE actor = "Harrison Ford"
--8


--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * from peliculas WHERE estreno BETWEEN 1990 AND 1999 ORDER BY pelicula
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

--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT *, LENGHT (pelicula) AS longuitud_titulo FROM peliculas
/*                        pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
Forest Gump                                           |              11
Titanic                                               |               7
El Padrino                                            |              10
Gladiator                                             |               9
El Se├▒or de los anillos: El retorno del rey          |              44 */

--Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT pelicula, MAX(LENGHT(pelicula)) AS longuitud_titulo FROM peliculas
--53
SELECT pelicula, MAX(LENGHT(pelicula)) AS longuitud_titulo FROM peliculas ORDER BY longuitud_titulo DESC LIMIT 1;
-- Sweeney Todd: El barbero diab├│lico de la calle Fleet 53