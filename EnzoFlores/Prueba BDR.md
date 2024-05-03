<!-- 1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos.-->. 

CREATE DATABASE prueba_bdr

\c prueba_bdr

CREATE TABLE Peliculas(  
  peliculas_id INT,
  nombre VARCHAR(100),
  anno INT,
  PRIMARY KEY (peliculas_id)
);

CREATE TABLE Tags(
  tags_id INT,
  tag VARCHAR(30),
  PRIMARY KEY (tags_id)
);

CREATE TABLE Peliculas_Tags(
  peliculas_id INT,
  tags_id INT,
  PRIMARY KEY (peliculas_id, tags_id),
  FOREIGN KEY (peliculas_id) REFERENCES Peliculas(peliculas_id),
  FOREIGN KEY (tags_id) REFERENCES Tags(tags_id)
);

<!-- 2.a) Inserta 5 películas y 5 tags (1 punto) -->

INSERT INTO Peliculas(peliculas_id, nombre, anno)
VALUES ( 1, 'titanic', 1997);
INSERT INTO Peliculas(peliculas_id, nombre, anno)
VALUES ( 2, 'children_of_men',2006);
INSERT INTO Peliculas(peliculas_id, nombre, anno)
VALUES ( 3, 'jaws', 1975);
INSERT INTO Peliculas(peliculas_id, nombre, anno)
VALUES ( 4, 'frozen', 2013);
INSERT INTO Peliculas(peliculas_id, nombre, anno)
VALUES ( 5, 'candy', 2006);

INSERT INTO Tags(tags_id, tag)
VALUES ( 1, 'aventura');
INSERT INTO Tags(tags_id, tag)
VALUES ( 2, 'drama');
INSERT INTO Tags(tags_id, tag)
VALUES ( 3, 'accion');
INSERT INTO Tags(tags_id, tag)
VALUES ( 4, 'infantil');
INSERT INTO Tags(tags_id, tag)
VALUES ( 5, 'ficcion');

<!-- 2.b) La primera película tiene que tener 3 tags asociados, -->
INSERT INTO Peliculas_Tags (peliculas_id, tags_id)
VALUES (1,1), (1,2), (1,5);

<!-- la segunda película debe tener dos tags asociados.  -->
INSERT INTO Peliculas_Tags (peliculas_id, tags_id)
VALUES (2,1), (2,5);

<!-- Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.  -->

SELECT peliculas.nombre, COUNT(Peliculas_Tags.tags_id) AS cantidad_de_tags 
FROM Peliculas 
LEFT JOIN Peliculas_Tags ON Peliculas.peliculas_id = Peliculas_Tags.peliculas_id 
LEFT JOIN tags ON Peliculas_Tags.tags_id = Tags.tags_id GROUP BY Peliculas.nombre;

   nombre        | cantidad_de_tags
-----------------+----------------
 children_of_men |              2
 jaws            |              0
 candy           |              0
 frozen          |              0
 titanic         |              3
(5 rows)

<!-- 4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos. (1 punto) -->

CREATE DATABASE prueba_bdr_part2

\c prueba_bdr_part2

CREATE TABLE Preguntas(
  id INT,
  pregunta VARCHAR(255),
  respuesta_correcta VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE Usuarios(
  id INT,
  nombre VARCHAR(255),
  edad INT,
  PRIMARY KEY (id)
);

CREATE TABLE Respuestas(
  id INT,
  respuesta VARCHAR(255),
  usuario_id INT,
  pregunta_id INT,
  PRIMARY KEY (id),  
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
  FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id)
);

<!-- 5. Agrega 5 registros a la tabla preguntas, de los cuales: (1 punto)
a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios distintos
b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
c. 3. Los otros dos registros deben ser respuestas incorrectas. -->

INSERT INTO Preguntas (id, pregunta, respuesta_correcta)
VALUES 
(1,'EnQuePaisEstamos','chile'),
(2,'QueDiaEsHoy','viernes'),
(3,'CualEsTuNombre','juan'),
(4,'QueEstacionEs','invierno'),
(5,'EnQueMesEstamos','mayo');

INSERT INTO Usuarios (id,nombre, edad)
VALUES 
(101,'andres', 29),
(102,'juan', 25),
(103,'pedro', 49),
(104,'diego', 39),
(105,'hugo', 44);


INSERT INTO Respuestas (id, respuesta, usuario_id, pregunta_id)
VALUES 
(201,'chile', 101, 1),
(202,'chile', 102, 1),
(203,'viernes', 103, 2),
(204,'viernes', 104, 4),
(205,'viernes', 105, 5);


<!-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta). (1 punto) -->

SELECT Usuarios.nombre, COUNT(*) AS total_respuestas_correctas
FROM Usuarios
INNER JOIN Respuestas ON Usuarios.ID = Respuestas.usuario_id
INNER JOIN Preguntas ON Respuestas.pregunta_id = Preguntas.id
WHERE Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Usuarios.nombre;

 nombre | total_respuestas_correctas
--------+----------------------------
 andres |                          1
 juan   |                          1
 pedro  |                          1
(3 rows)
<!-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.(1 punto) -->

SELECT Preguntas.pregunta, COUNT(DISTINCT Respuestas.usuario_id) AS respuesta_correcta_usuarios
FROM Preguntas 
LEFT JOIN Respuestas ON Preguntas.id = Respuestas.pregunta_id AND Preguntas.respuesta_correcta = Respuestas.respuesta
GROUP BY Preguntas.pregunta;

 pregunta     | respuesta_correcta_usuarios
------------------+-----------------------------
 CualEsTuNombre   |                           0
 EnQueMesEstamos  |                           0
 EnQuePaisEstamos |                           2
 QueDiaEsHoy      |                           1
 QueEstacionEs    |                           0
(5 rows)


<!-- 8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación. (1 punto) -->

ALTER TABLE Respuestas
ADD CONSTRAINT fk_usuario_respuesta
FOREIGN KEY (usuario_id)
REFERENCES Usuarios(id)
ON DELETE CASCADE;

DELETE FROM Usuarios
WHERE id = 105;

<!-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos. (1 punto) -->

ALTER TABLE Usuarios
ADD CONSTRAINT edad_menores_18
CHECK (edad >= 18);

<!-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único. (1 punto) -->

ALTER TABLE Usuarios
ADD COLUMN email VARCHAR(50) UNIQUE;