-- Inserciones en la tabla Preguntas
INSERT INTO Preguntas (id, pregunta, respuesta_correcta) VALUES
(1, '¿Cuál es la capital de Francia?', 'París'),
(2, '¿Cuál es el resultado de 2 + 2?', '4'),
(3, '¿Cuál es el animal más grande del mundo?', 'Ballena Azul');

-- Inserciones en la tabla Usuarios
INSERT INTO Usuarios (ID, nombre, edad) VALUES
(1, 'Juan', 25),
(2, 'María', 30),
(3, 'Pedro', 28),
(4, 'Luisa', 35),
(5, 'Carlos', 22);

-- Inserciones en la tabla Respuestas
INSERT INTO Respuestas (ID, usuario_id, pregunta_id, respuesta) VALUES
(1, 1, 1, 'París'),
(2, 2, 1, 'París'),
(3, 3, 2, '4'),
(4, 4, 1, 'Londres'),
(5, 5, 2, '5'); 

-- Consultas:
-- Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta)
SELECT Usuarios.nombre, COUNT(*) AS respuestas_correctas_totales
FROM Usuarios
INNER JOIN Respuestas ON Usuarios.ID = Respuestas.usuario_id
INNER JOIN Preguntas ON Respuestas.pregunta_id = Preguntas.id
WHERE Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Usuarios.nombre;
-- nombre | respuestas_correctas_totales
----------+------------------------------
-- Juan   |                            1
-- María  |                            1
-- Pedro  |                            1

-- Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.
SELECT Preguntas.pregunta, COUNT(DISTINCT Respuestas.usuario_id) AS usuarios_respuesta_correcta
FROM Preguntas 
LEFT JOIN Respuestas ON Preguntas.id = Respuestas.pregunta_id AND Preguntas.respuesta_correcta = Respuestas.respuesta
GROUP BY Preguntas.pregunta;
--                 pregunta                 | usuarios_respuesta_correcta
--------------------------------------------+-----------------------------
-- ¿Cuál es la capital de Francia?          |                           2
-- ¿Cuál es el resultado de 2 + 2?          |                           1
-- ¿Cuál es el animal más grande del mundo? |                           0

-- Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.
CREATE TABLE Respuestas (
    ID INT PRIMARY KEY,
    usuario_id INT,
    pregunta_id INT,
    respuesta VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id)
);

-- Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.
ALTER TABLE Usuarios
ADD CONSTRAINT edad_mayor_igual_18
CHECK (edad >= 18);

-- Altera la tabla existente de usuarios agregando el campo email con la restricción de único.
ALTER TABLE Usuarios
ADD COLUMN email VARCHAR(50) UNIQUE;
-- Inserciones de correos en la tabla Usuarios
UPDATE Usuarios SET email = 'maria@gmail.com' WHERE ID = 2;
UPDATE Usuarios SET email = 'pedro@gmail.com' WHERE ID = 3;
UPDATE Usuarios SET email = 'luisa@gmail.com' WHERE ID = 4;
UPDATE Usuarios SET email = 'carlos@gmail.com' WHERE ID = 5;
-- Nuevos registros tabla Usuarios (Falta el de Juan porque fue eliminado en una consulta anterior)
-- id | nombre | edad |      email
------+--------+------+------------------
--  2 | María  |   30 | maria@gmail.com
--  3 | Pedro  |   28 | pedro@gmail.com
--  4 | Luisa  |   35 | luisa@gmail.com
--  5 | Carlos |   22 | carlos@gmail.com