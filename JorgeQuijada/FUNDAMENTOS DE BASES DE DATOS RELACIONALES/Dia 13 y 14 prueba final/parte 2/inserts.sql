-- 5.  Agrega 5 registros a la tabla preguntas
INSERT INTO preguntas (id_pregunta, pregunta, respuesta_correcta) VALUES
(1, '¿Cuál es la unidad básica de la vida?', 'Célula'),
(2, '¿Cuál es la fuerza que atrae a dos objetos con masa?', 'Gravedad'),
(3, '¿Cuál es el continente más grande del mundo?', 'Asia'),
(4, '¿Cuál es la montaña más alta del mundo?', 'Monte Everest'),
(5, '¿Quién pintó la obra "La Mona Lisa"?', 'Leonardo da Vinci');

 id_pregunta |                       pregunta                       | respuesta_correcta
-------------+------------------------------------------------------+--------------------
           1 | ¿Cuál es la unidad básica de la vida?                | Célula
           2 | ¿Cuál es la fuerza que atrae a dos objetos con masa? | Gravedad
           3 | ¿Cuál es el continente más grande del mundo?         | Asia
           4 | ¿Cuál es la montaña más alta del mundo?              | Monte Everest
           5 | ¿Quién pintó la obra "La Mona Lisa"?                 | Leonardo da Vinci
(5 filas)

-- Agregando usuarios
INSERT INTO usuarios (id_usuario, nombre, edad) VALUES
(1, 'Alejandro Garcia', 48),
(2, 'Valentina Diaz', 22),
(3, 'Daniela Castro', 38),
(4, 'Cristobal Espinoza', 40),
(5, 'Tomas Bennett', 30);

 id_usuario |       nombre       | edad
------------+--------------------+------
          1 | Alejandro Garcia   |   48
          2 | Valentina Diaz     |   22
          3 | Daniela Castro     |   38
          4 | Cristobal Espinoza |   40
          5 | Tomas Bennett      |   30
(5 filas)

-- 1. La primera pregunta debe ser contestada correctamente por dos usuarios distintos
-- 2. Lapregunta 2 debe ser contestada correctamente por un usuario.
-- 3. Los otros dos registros deben ser respuestas incorrectas.

INSERT INTO respuestas (id_respuestas, respuesta, usuario_id, pregunta_id) VALUES
(1, 'Célula', 1, 1), -- Alejandro Garcia responde correctamente la pregunta 1
(2, 'Célula', 2, 1), -- Valentina Diaz responde correctamente la pregunta 1
(3, 'Gravedad', 4, 2), -- Cristobal Espinoza responde correctamente la pregunta 2
(6, 'Jingshan', 5, 4), -- Tomas Bennett responde incorrectamente la pregunta 4
(5, 'Beethoven', 3, 5); -- Daniel Castro responde incorrectamente la pregunta 5

 id_respuestas | respuesta | usuario_id | pregunta_id
---------------+-----------+------------+-------------
             1 | Célula    |          1 |           1
             2 | Célula    |          2 |           1
             3 | Gravedad  |          4 |           2
             6 | Jingshan  |          5 |           4
             5 | Beethoven |          3 |           5
(5 filas)

-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).

SELECT u.nombre, COUNT(p.respuesta_correcta) AS respuestas_correctas
FROM usuarios AS u
INNER JOIN respuestas AS r ON u.id_usuario = r.usuario_id
INNER JOIN preguntas AS p ON r.pregunta_id = p.id_pregunta
WHERE r.respuesta = p.respuesta_correcta
GROUP BY u.nombre;

       nombre       | respuestas_correctas
--------------------+----------------------
 Alejandro Garcia   |                    1
 Cristobal Espinoza |                    1
 Valentina Diaz     |                    1
(3 filas)

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.

SELECT p.pregunta, COUNT(r.usuario_id) AS usuarios_correctos
FROM preguntas AS p
LEFT JOIN respuestas AS r ON p.id_pregunta = r.pregunta_id AND p.respuesta_correcta = r.respuesta
GROUP BY p.pregunta
ORDER BY usuarios_correctos DESC;

                       pregunta                       | usuarios_correctos
------------------------------------------------------+--------------------
 ¿Cuál es la unidad básica de la vida?                |                  2
 ¿Cuál es la fuerza que atrae a dos objetos con masa? |                  1
 ¿Quién pintó la obra "La Mona Lisa"?                 |                  0
 ¿Cuál es la montaña más alta del mundo?              |                  0
 ¿Cuál es el continente más grande del mundo?         |                  0
(5 filas)

-- 8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.

CREATE TABLE respuestas (
    id_respuestas INT PRIMARY KEY,
    respuesta VARCHAR(255),
    usuario_id INT,
    pregunta_id INT,
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(id_pregunta),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

DELETE FROM usuarios
WHERE id_usuario = 1;

SELECT * FROM usuarios;
 id_usuario |       nombre       | edad 
------------+--------------------+-------
          2 | Valentina Diaz     |   22 
          3 | Daniela Castro     |   38 
          4 | Cristobal Espinoza |   40 
          5 | Tomas Bennett      |   30 
(4 filas)

SELECT * FROM respuestas;
 id_respuestas | respuesta | usuario_id | pregunta_id
---------------+-----------+------------+-------------
             2 | Célula    |          2 |           1
             3 | Gravedad  |          4 |           2
             6 | Jingshan  |          5 |           4
             5 | Beethoven |          3 |           5
(4 filas)

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE usuarios
ADD CHECK (edad >= 18);

INSERT INTO usuarios (id_usuario, nombre, edad) VALUES
(6, 'Alexis Campos', 12);
-- ERROR:  el nuevo registro para la relación «usuarios» viola la restricción «check» «usuarios_edad_check»
-- DETALLE:  La fila que falla contiene (6, Alexis Campos, 12).

-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único.

ALTER TABLE usuarios
ADD COLUMN email VARCHAR(75) UNIQUE;

 id_usuario |       nombre       | edad | email
------------+--------------------+------+-------
          2 | Valentina Diaz     |   22 |
          3 | Daniela Castro     |   38 |
          4 | Cristobal Espinoza |   40 |
          5 | Tomas Bennett      |   30 |
(4 filas)

-- Inserto datos en la columna email
UPDATE Usuarios SET email = 'valentinadiaz@gmail.com' WHERE id_usuario = 2;
UPDATE Usuarios SET email = 'danielacastro@gmail.com' WHERE id_usuario = 3;
UPDATE Usuarios SET email = 'cristobalespinoza@gmail.com' WHERE id_usuario = 4;
UPDATE Usuarios SET email = 'tomasbennett@gmail.com' WHERE id_usuario = 5;

 id_usuario |       nombre       | edad |            email
------------+--------------------+------+-----------------------------
          2 | Valentina Diaz     |   22 | valentinadiaz@gmail.com
          3 | Daniela Castro     |   38 | danielacastro@gmail.com
          4 | Cristobal Espinoza |   40 | cristobalespinoza@gmail.com
          5 | Tomas Bennett      |   30 | tomasbennett@gmail.com
(4 filas)