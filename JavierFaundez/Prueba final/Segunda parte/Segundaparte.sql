--Creación base de datos
CREATE DATABASE preguntas_respuestas;

--4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos.
--Creación tabla preguntas
CREATE TABLE preguntas(
id_pregunta INT PRIMARY KEY,
pregunta VARCHAR(255),
respuesta_correcta VARCHAR
);

--Creación tabla usuarios
CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY,
nombre VARCHAR(255),
edad INT
);

--Creación tabla intermedia respuesta
CREATE TABLE respuestas(
id_respuesta INT PRIMARY KEY,
id_usuario INT,
id_pregunta INT,
respuesta VARCHAR(255),
FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario),
FOREIGN KEY(id_pregunta) REFERENCES preguntas (id_pregunta)
);


--5. Agrega 5 registros a la tabla preguntas, de los cuales:
--a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios distintos
--b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
--c. 3. Los otros dos registros deben ser respuestas incorrectas.

--Insertamos registros en la tabla preguntas
INSERT INTO preguntas (id_pregunta, pregunta, respuesta_correcta)
VALUES 
(1, '¿Cuál es la capital de Colombia?', 'Bogotá'),
(2, '¿Cuál es la capital de España?', 'Madrid'),
(3, '¿Cuál es la capital de Italia?', 'Roma'),
(4, '¿Cuál es la capital de Francia?', 'Paris'),
(5, '¿Cuál es la capital de Canada?', 'Ottawa');

--Insertamos registros en la tabla usuarios
INSERT INTO usuarios (id_usuario, nombre, edad)
VALUES 
(1, 'Jaime', 37),
(2, 'Carolina', 25),
(3, 'Natalia', 29),
(4, 'Nicole', 27),
(5, 'Mario', 23);

--Insertamos registros en la tabla respuestas
INSERT INTO respuestas(id_respuesta, id_usuario, id_pregunta, respuesta)
VALUES
(1, 1, 1, 'Bogotá'),
(2, 2, 1, 'Bogotá'),
(3, 3, 2, 'Madrid'),
(4, 4, 3, 'Milan'),
(5, 5, 4, 'Venecia');


--6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).

SELECT usuarios.nombre, COUNT(respuestas.id_respuesta) AS respuestas_correctas
FROM usuarios 
LEFT JOIN respuestas ON usuarios.id_usuario = respuestas.id_usuario
INNER JOIN preguntas ON respuestas.id_pregunta = preguntas.id_pregunta AND respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY usuarios.id_usuario, usuarios.nombre;


--7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.

SELECT preguntas.pregunta, COUNT(DISTINCT respuestas.id_usuario) AS usuarios_respuestas_correctas
FROM preguntas
LEFT JOIN respuestas ON preguntas.id_pregunta = respuestas.id_pregunta AND respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY preguntas.id_pregunta, preguntas.pregunta;


--8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.
--Comentarios: Postgres Online no me dejo insertar directamente la tabla,
--por lo que tuve que borrar la tabla original y volver a crearla con la condicion ON DELETE CASCADE
--Posteriormente volvi a insertar datos para hacer las pruebas
DROP TABLE IF EXISTS respuestas;
CREATE TABLE respuestas(
id_respuesta INT PRIMARY KEY,
id_usuario INT,
id_pregunta INT,
respuesta VARCHAR(255),
FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario) ON DELETE CASCADE,
FOREIGN KEY(id_pregunta) REFERENCES preguntas (id_pregunta)
);
INSERT INTO respuestas(id_respuesta, id_usuario, id_pregunta, respuesta)
VALUES
(1, 1, 1, 'Bogotá'),
(2, 2, 1, 'Bogotá'),
(3, 3, 2, 'Madrid'),
(4, 4, 3, 'Milan'),
(5, 5, 4, 'Venecia');
DELETE FROM usuarios  --prueba para comprobar borrado en cascada
WHERE id_usuario = 1;

--9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE usuarios
ADD CONSTRAINT mayores_de_edad
CHECK (edad >= 18);

INSERT INTO usuarios (id_usuario, nombre, edad)  --Prueba para comprobar restricción
VALUES
(6, 'Ariel', 17);

--10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único.

ALTER TABLE usuarios ADD COLUMN email VARCHAR(350) UNIQUE;











