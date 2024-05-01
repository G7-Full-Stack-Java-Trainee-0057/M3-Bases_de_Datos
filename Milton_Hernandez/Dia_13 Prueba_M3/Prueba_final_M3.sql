--Prueba - Fundamentos de bases de datos relacionales
--Requerimiento.
--1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, 
--foráneas y tipos de datos.

Estructura logica en imagen "Modelo PruebaM3". Se crea la tabla intermedia "PeliculasTags", para poder trabajar modelo logico N:N,
los campos identificados son: id_PeliculasTags, id_peliculas e id_tags. Sincronizando la logica de las entidades Peliculas y Tags. 

--Se crea la base de datos y nos conectamos.

CREATE DATABASE prueba_M3;
\c prueba_M3

postgres=# CREATE DATABASE prueba_M3;
CREATE DATABASE
postgres=# \c prueba_m3;
You are now connected to database "prueba_m3" as user "postgres".

CREATE TABLE Peliculas (
    id_peliculas INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    anno INT NOT NULL
);

prueba_m3=# CREATE TABLE Peliculas (
prueba_m3(#     id_peliculas INT PRIMARY KEY,
prueba_m3(#     nombre VARCHAR(255) NOT NULL,
prueba_m3(#     anno INT NOT NULL
prueba_m3(# );
CREATE TABLE
prueba_m3=# SELECT * FROM Peliculas;

 id_peliculas | nombre | anno
--------------+--------+------
(0 rows)

CREATE TABLE Tags (
    id_tags INT PRIMARY KEY,
    tags VARCHAR(32) NOT NULL
);

prueba_m3=# CREATE TABLE Tags (
prueba_m3(#     id_tags INT PRIMARY KEY,
prueba_m3(#     tags VARCHAR(32) NOT NULL
prueba_m3(# );
CREATE TABLE
prueba_m3=# SELECT * FROM Tags;   

 id_tags | tags
---------+------
(0 rows)

CREATE TABLE PeliculasTags (
    id_PeliculasTags INT PRIMARY KEY,
    id_peliculas INT,
    id_tags INT,
    FOREIGN KEY (id_peliculas) REFERENCES Peliculas(id_peliculas),
    FOREIGN KEY (id_tags) REFERENCES Tags(id_tags)
);

prueba_m3=# CREATE TABLE PeliculasTags (
prueba_m3(#     id_PeliculasTags INT PRIMARY KEY,
prueba_m3(#     id_peliculas INT,
prueba_m3(#     id_tags INT,
prueba_m3(#     FOREIGN KEY (id_peliculas) REFERENCES Peliculas(id_peliculas),
prueba_m3(#     FOREIGN KEY (id_tags) REFERENCES Tags(id_tags)
prueba_m3(# );
CREATE TABLE
prueba_m3=# SELECT * FROM PeliculasTags;  

 id_peliculastags | id_peliculas | id_tags
------------------+--------------+---------
(0 rows)

--2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la
--segunda película debe tener dos tags asociados.

INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (1, 'Titanic', '2002');
INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (2, 'Chacotero sentimental', '2007');
INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (3, 'Rapido y furioso', '2012');
INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (4, 'El perfume', '2000');
INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (5, 'Efecto mariposa', '1998');

prueba_m3=# INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (1, 'Titanic', '2002');
INSERT 0 1
prueba_m3=# INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (2, 'Chacotero sentimental', '2007');
INSERT 0 1
prueba_m3=# INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (3, 'Rapido y furioso', '2012');
INSERT 0 1
prueba_m3=# INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (4, 'El perfume', '2000');
INSERT 0 1
prueba_m3=# INSERT INTO Peliculas (id_peliculas, nombre, anno) VALUES (5, 'Efecto mariposa', '1998');
INSERT 0 1
prueba_m3=# SELECT * FROM Peliculas;   

 id_peliculas |        nombre         | anno
--------------+-----------------------+------
            1 | Titanic               | 2002
            2 | Chacotero sentimental | 2007
            3 | Rapido y furioso      | 2012
            4 | El perfume            | 2000
            5 | Efecto mariposa       | 1998

INSERT INTO Tags (id_tags, tags) VALUES (1, 'Genero');
INSERT INTO Tags (id_tags, tags) VALUES (2, 'Trama');
INSERT INTO Tags (id_tags, tags) VALUES (3, 'Ambientacion');
INSERT INTO Tags (id_tags, tags) VALUES (4, 'Director');
INSERT INTO Tags (id_tags, tags) VALUES (5, 'Estilo');

prueba_m3=# INSERT INTO Tags (id_tags, tags) VALUES (1, 'Genero');
INSERT 0 1
prueba_m3=# INSERT INTO Tags (id_tags, tags) VALUES (2, 'Trama');
INSERT 0 1
prueba_m3=# INSERT INTO Tags (id_tags, tags) VALUES (3, 'Ambientacion');
INSERT 0 1
prueba_m3=# INSERT INTO Tags (id_tags, tags) VALUES (4, 'Director');
INSERT 0 1
prueba_m3=# INSERT INTO Tags (id_tags, tags) VALUES (5, 'Estilo');
INSERT 0 1
prueba_m3=# SELECT * FROM Tags;       

 id_tags |     tags
---------+--------------
       1 | Genero
       2 | Trama
       3 | Ambientacion
       4 | Director
       5 | Estilo
(5 rows)

INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (1, 1,1);
INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (2, 1,2);
INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (3, 1,3);
INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (4, 2,4);
INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (5, 2,5);

prueba_m3=# INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (1, 1,1);
INSERT 0 1
prueba_m3=# INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (2, 1,2);
INSERT 0 1
prueba_m3=# INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (3, 1,3);
INSERT 0 1
prueba_m3=# INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (4, 2,4);
INSERT 0 1
prueba_m3=# INSERT INTO PeliculasTags (id_PeliculasTags, id_peliculas, id_tags) VALUES (5, 2,5);
INSERT 0 1
prueba_m3=# SELECT * FROM PeliculasTags; 

 id_peliculastags | id_peliculas | id_tags
------------------+--------------+---------
                1 |            1 |       1
                2 |            1 |       2
                3 |            1 |       3
                4 |            2 |       4
                5 |            2 |       5
(5 rows)


--3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.

SELECT Peliculas.nombre, COALESCE(COUNT(PeliculasTags.id_tags), 0) AS cantidad_tags FROM Peliculas
LEFT JOIN PeliculasTags ON Peliculas.id_peliculas = PeliculasTags.id_peliculas GROUP BY Peliculas.nombre;

prueba_m3=# SELECT Peliculas.nombre, COALESCE(COUNT(PeliculasTags.id_tags), 0) AS cantidad_tags FROM Peliculas
prueba_m3-# LEFT JOIN PeliculasTags ON Peliculas.id_peliculas = PeliculasTags.id_peliculas GROUP BY Peliculas.nombre;
        nombre         | cantidad_tags
-----------------------+---------------
 Chacotero sentimental |             2
 Titanic               |             3
 El perfume            |             0
 Rapido y furioso      |             0
 Efecto mariposa       |             0
(5 rows)


--"Segunda parte de la prueba".

--4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos

CREATE TABLE Preguntas (
    id_preguntas SERIAL PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta_correcta VARCHAR(255) NOT NULL
);

prueba_m3=# CREATE TABLE Preguntas (
prueba_m3(#     id_preguntas SERIAL PRIMARY KEY,
prueba_m3(#     pregunta VARCHAR(255) NOT NULL,
prueba_m3(#     respuesta_correcta VARCHAR(255) NOT NULL
prueba_m3(# );
CREATE TABLE

CREATE TABLE Respuestas (
    id_respuestas SERIAL PRIMARY KEY,
    id_preguntas INT,
    id_usuarios INT,
    respuesta VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_preguntas) REFERENCES Preguntas(id_preguntas),
    FOREIGN KEY (id_usuarios) REFERENCES Usuarios(id_usuarios)
);

prueba_m3=# CREATE TABLE Respuestas (
prueba_m3(#     id_respuestas SERIAL PRIMARY KEY,
prueba_m3(#     id_preguntas INT,
prueba_m3(#     id_usuarios INT,
prueba_m3(#     respuesta VARCHAR(255) NOT NULL,
prueba_m3(#     FOREIGN KEY (id_preguntas) REFERENCES Preguntas(id_preguntas),
prueba_m3(#     FOREIGN KEY (id_usuarios) REFERENCES Usuarios(id_usuarios)
prueba_m3(# );
CREATE TABLE

CREATE TABLE Usuarios (
    id_usuarios SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL
);

prueba_m3=# CREATE TABLE Usuarios (
prueba_m3(#     id_usuarios SERIAL PRIMARY KEY,
prueba_m3(#     nombre VARCHAR(255) NOT NULL,
prueba_m3(#     edad INT NOT NULL
prueba_m3(# );
CREATE TABLE

--5.	Agrega 5 registros a la tabla preguntas, de los cuales: (1 punto)
--a.	La primera pregunta debe ser contestada correctamente por dos usuarios distintos
--b.	La pregunta 2 debe ser contestada correctamente por un usuario.
--c.	Los otros dos registros deben ser respuestas incorrectas.
--Hint: Contestada correctamente signiﬁca que la respuesta indicada en la tabla respuestas es exactamente 
--igual al texto indicado en la tabla de preguntas.

INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (1, 'Primera pregunta', 'si');
INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (2, 'Primera pregunta', 'si');
INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (3, 'Segunda pregunta', 'si');
INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (4, 'Tercera pregunta', 'incorrecta');
INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (5, 'Cuarta pregunta', 'incorrecta');

prueba_m3=# INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (1, 'Primera pregunta', 'si');
INSERT 0 1
prueba_m3=# INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (2, 'Primera pregunta', 'si');
INSERT 0 1
prueba_m3=# INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (3, 'Segunda pregunta', 'si');
INSERT 0 1
prueba_m3=# INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (4, 'Tercera pregunta', 'incorrecta');
INSERT 0 1
prueba_m3=# INSERT INTO Preguntas (id_preguntas, pregunta, respuesta_correcta) VALUES (5, 'Cuarta pregunta', 'incorrecta');
INSERT 0 1
prueba_m3=# SELECT * FROM Preguntas;

 id_preguntas |     pregunta     | respuesta_correcta
--------------+------------------+--------------------
            1 | Primera pregunta | si
            2 | Primera pregunta | si
            3 | Segunda pregunta | si
            4 | Tercera pregunta | incorrecta
            5 | Cuarta pregunta  | incorrecta
(5 rows)

--6.	Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).

SELECT * FROM Preguntas Where respuesta_correcta = 'si';

prueba_m3=# SELECT * FROM Preguntas Where respuesta_correcta = 'si';

 id_preguntas |     pregunta     | respuesta_correcta
--------------+------------------+--------------------
            1 | Primera pregunta | si
            2 | Primera pregunta | si
            3 | Segunda pregunta | si
(3 rows)

--7.	Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.

SELECT * FROM Preguntas WHERE respuesta_correcta = 'si';

prueba_m3=# SELECT * FROM Preguntas WHERE respuesta_correcta = 'si';

 id_preguntas |     pregunta     | respuesta_correcta
--------------+------------------+--------------------
            1 | Primera pregunta | si
            2 | Primera pregunta | si
            3 | Segunda pregunta | si
(3 rows)

--8.	Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.

DELETE FROM Preguntas WHERE id_preguntas = 1;

prueba_m3=# SELECT * FROM Preguntas;

 id_preguntas |     pregunta     | respuesta_correcta
--------------+------------------+--------------------
            2 | Primera pregunta | si
            3 | Segunda pregunta | si
            4 | Tercera pregunta | incorrecta
            5 | Cuarta pregunta  | incorrecta
(4 rows)

--9.	Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE Usuarios ADD CONSTRAINT check_edad_minima CHECK (edad >= 18);

SELECT
    tc.table_schema,
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    ccu.column_name,
    ccu.table_schema AS foreign_table_schema,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.constraint_column_usage AS ccu
        ON tc.constraint_name = ccu.constraint_name
WHERE
    tc.table_catalog = 'prueba_m3'; 

     usuarios                 | id_usuarios
 public       | usuarios                 | check_edad_minima                              | CHECK           | edad             | public


--10.	ALTER TABLE Usuarios ADD email UNIQUE NOT NULL;

ALTER TABLE Usuarios ADD COLUMN email VARCHAR(255) NOT NULL UNIQUE;

prueba_m3=# ALTER TABLE Usuarios ADD COLUMN email VARCHAR(255) NOT NULL UNIQUE;
ALTER TABLE
prueba_m3=# SELECT * FROM Usuarios; 

 id_usuarios | nombre | edad | email
-------------+--------+------+-------
(0 rows)

