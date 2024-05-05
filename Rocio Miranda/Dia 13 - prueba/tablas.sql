-- Creo la base de datos Cine
--psql -U postgres 
-- \c cine

--Creo dos tablas para ingresar datos
 CREATE TABLE peliculas(
    id_peliculas INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    año INT
 );

  id_peliculas | nombre | año
--------------+--------+-----
(0 rows)

 CREATE TABLE tags(
    id_tag INT PRIMARY KEY NOT NULL,
    tag VARCHAR (100)
 );

 id_tag | tag
--------+-----
(0 rows)


CREATE TABLE categoria (
    id_peliculas INT,
    id_tag INT,
    id_categoria SERIAL PRIMARY KEY NOT NULL,
    FOREIGN KEY (id_peliculas) REFERENCES peliculas(id_peliculas),
    FOREIGN KEY (id_tag) REFERENCES tags(id_tag)
);

 id_peliculas | id_tag | id_categoria
--------------+--------+--------------
(0 rows)


 --Inserto datos en la primera tabla
 INSERT INTO peliculas (id_peliculas, nombre, año) VALUES (1, 'mi vecino totoro', 1988),
 (2, 'akira', 1988), (3, 'neon genesis evangelion', 1997), (4, 'susume', 2022), (5, 'a silent voice', 2016);

 id_peliculas |         nombre          | año
--------------+-------------------------+------
            1 | mi vecino totoro        | 1988
            2 | akira                   | 1988
            3 | neon genesis evangelion | 1997
            4 | susume                  | 2022
            5 | a silent voice          | 2016
(5 rows)

 --Inserto datos en la segunda tabla
  INSERT INTO tags(id_tag, tag) VALUES (1, 'familiar'), (2, 'emotiva'), (3, 'ghibli'), (4, 'ciberpunk'), (5, 'ciencia ficcion');

   id_tag |       tag
--------+-----------------
      1 | familiar
      2 | emotiva
      3 | ghibli
      4 | ciberpunk
      5 | ciencia ficcion
(5 rows)

  -- Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados.
  INSERT INTO categoria(id_peliculas, id_tag, id_categoria) VALUES (1, 1, 1), (1, 2, 2), (1, 3, 3), (2, 4, 4), (2, 5, 5);

 id_peliculas | id_tag | id_categoria
--------------+--------+--------------
            1 |      1 |            1
            1 |      2 |            2
            1 |      3 |            3
            2 |      4 |            4
            2 |      5 |            5
(5 rows)

 --Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.

SELECT nombre AS nombre_pelicula, COALESCE(COUNT(categoria.id_tag), 0) AS cantidad_tags
FROM peliculas
LEFT JOIN categoria ON peliculas.id_peliculas = categoria.id_peliculas
GROUP BY nombre;

     nombre_pelicula     | cantidad_tags
-------------------------+---------------
 a silent voice          |             0
 neon genesis evangelion |             0
 mi vecino totoro        |             3
 susume                  |             0
 akira                   |             2
(5 rows)



--SEGUNDA PARTE

 --Creo otra base de datos para la segunda parte.
 -- --psql -U postgres 
-- \c encuesta

-- Creo 3 tablas 
CREATE TABLE preguntas(
    id_preguntas INT PRIMARY KEY NOT NULL,
    pregunta VARCHAR(255),
    respuesta_correcta VARCHAR
);

 id_preguntas | pregunta | respuesta_correcta
--------------+----------+--------------------
(0 rows)

CREATE TABLE usuarios(
    id_usuarios INT PRIMARY KEY NOT NULL,
    nombre VARCHAR (255),
    edad INT 
);

 id_usuarios | nombre | edad
-------------+--------+------
(0 rows)


CREATE TABLE respuestas(
    id_respuestas INT,
    respuesta VARCHAR (255),
    id_usuarios INT,
    id_preguntas INT,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_preguntas) REFERENCES preguntas(id_preguntas)
);

 id_respuestas | respuesta | id_usuarios | id_preguntas
---------------+-----------+-------------+--------------
(0 rows)


--Agrega 5 registros a la tabla preguntas, de los cuales:
a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios
distintos
b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
c. 3. Los otros dos registros deben ser respuestas incorrectas.

INSERT INTO preguntas(id_preguntas, pregunta, respuesta_correcta) VALUES(1, '¿Cual es la capital de Australia?', 'Canberra'), (2, '¿Quien escribio El principito?', 'Antoine de Saint-Exupery'), (3, '¿Quien pinto la famosa obra La noche estrellada?', 'Vincent van Gogh'),
(4, '¿Cual es el rio mas largo del mundo?', 'El rio Amazonas'), (5, '¿Cual es el planeta más grande del sistema solar?','Jupiter');

 id_preguntas |                     pregunta                      |    respuesta_correcta
--------------+---------------------------------------------------+--------------------------
            1 | ¿Cual es la capital de Australia?                 | Canberra
            2 | ¿Quien escribio El principito?                    | Antoine de Saint-Exupery
            3 | ¿Quien pinto la famosa obra La noche estrellada?  | Vincent van Gogh
            4 | ¿Cual es el rio mas largo del mundo?              | El rio Amazonas
            5 | ¿Cual es el planeta más grande del sistema solar? | Jupiter
(5 rows)

--inserto datos en la tabla usuario igualmente
INSERT INTO usuarios (id_usuarios, nombre, edad) VALUES(1, 'Jose', 23), (2, 'Rosa', 16), (3, 'Maria', 19), (4, 'Ferni', 27), (5, 'Juan', 21);

. id_usuarios | nombre | edad
-------------+--------+------
           1 | Jose   |   23
           2 | Rosa   |   16
           3 | Maria  |   19
           4 | Ferni  |   27
           5 | Juan   |   21
--Inserto datos a la tabla respuestas
INSERT INTO respuestas(id_respuestas, respuesta, id_usuarios, id_preguntas) VALUES (1, 'Canberra', 1, 1), (2, 'Canberra', 2, 1), (3, 'Antoine de Saint-Exupéry', 3, 2), (4,'Rio Cachapoal', 4, 4 ), (5, 'El perro Chocolo', 5, 3);

 id_respuestas |        respuesta         | id_usuarios | id_preguntas
---------------+--------------------------+-------------+--------------
             1 | Canberra                 |           1 |            1
             2 | Canberra                 |           2 |            1
             3 | Antoine de Saint-Exupéry |           3 |            2
             4 | Rio Cachapoal            |           4 |            4
             5 | El perro Chocolo         |           5 |            3


--Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta)
SELECT nombre, COUNT(respuestas.id_respuestas) AS respuestas_correctas_totales
FROM usuarios
LEFT JOIN respuestas ON usuarios.id_usuarios = respuestas.id_usuarios
LEFT JOIN preguntas ON respuestas.id_preguntas = preguntas.id_preguntas
WHERE respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY usuarios.id_usuarios, usuarios.nombre;

UPDATE respuestas -- alteré una respuesta ya que la habia puesto con tilde y no lo tomó la consola :D
SET respuesta = 'Antoine de Saint-Exupery'
WHERE id_usuarios = 3;


 nombre | respuestas_correctas_totales
--------+------------------------------
 Jose   |                            1
 Rosa   |                            1
 Maria  |                            1
(3 rows)


--Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta

SELECT 
    preguntas.id_preguntas,
    preguntas.pregunta,
    preguntas.respuesta_correcta,
    COALESCE(respuestas_conteo, 0) AS usuarios_con_respuesta_correcta
FROM preguntas
LEFT JOIN LATERAL (
    SELECT COUNT(id_usuarios) AS respuestas_conteo
    FROM  respuestas
    WHERE respuestas.id_preguntas = preguntas.id_preguntas
    AND respuesta = preguntas.respuesta_correcta
) AS respuestas_conteo_tabla ON true;

id_preguntas |                     pregunta                      |    respuesta_correcta    | usuarios_con_respuesta_correcta  
--------------+---------------------------------------------------+--------------------------+---------------------------------  
            1 | ¿Cual es la capital de Australia?                 | Canberra                 |                               2   
            2 | ¿Quien escribio El principito?                    | Antoine de Saint-Exupery |                               1   
            3 | ¿Quien pinto la famosa obra La noche estrellada?  | Vincent van Gogh         |                               0   
            4 | ¿Cual es el rio mas largo del mundo?              | El rio Amazonas          |                               0
            5 | ¿Cual es el planeta más grande del sistema solar? | Jupiter                  |                               0   
(5 rows)


--Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación
ALTER TABLE respuestas
DROP CONSTRAINT respuestas_id_usuarios_fkey, -- 
ADD CONSTRAINT respuestas_id_usuarios_fkey FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios) ON DELETE CASCADE;

--Probamos la nueva restricción agregada.
DELETE FROM usuarios WHERE id_usuarios = 1;

 id_usuarios | nombre | edad
-------------+--------+------
           2 | Rosa   |   16
           3 | Maria  |   19
           4 | Ferni  |   27
           5 | Juan   |   21
(4 rows)

--Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE usuarios
ADD CONSTRAINT check_edad_minima CHECK (edad >= 18); --El comando CHECK lo utilizamos para crear una restricción que  asegura que los datos ingresados en una columna cumplan con ciertos criterios o condiciones definidos por el usuario.

encuesta=# ALTER TABLE usuarios
encuesta-# ADD CONSTRAINT check_edad_minima CHECK (edad >= 18);
ERROR:  la restricción check «check_edad_minima» de la relación «usuarios» es violada por alguna fila

-- Altera la tabla existente de usuarios agregando el campo email con la restricción de único.
ALTER TABLE usuarios
ADD COLUMN email VARCHAR(255) UNIQUE;
 id_usuarios | nombre | edad | email
-------------+--------+------+-------
           2 | Rosa   |   16 |
           3 | Maria  |   19 |
           4 | Ferni  |   27 |
           5 | Juan   |   21 |
(4 rows)

--arigato gosaimaaaaass.