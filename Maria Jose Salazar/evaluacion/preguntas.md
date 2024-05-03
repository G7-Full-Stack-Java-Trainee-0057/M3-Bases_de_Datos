-- Tabla Preguntas
CREATE TABLE Preguntas (
    id INT PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta_correcta VARCHAR NOT NULL
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL
);

-- Tabla Respuestas
CREATE TABLE Respuestas (
    ID INT PRIMARY KEY,
    usuario_id INT, 
    pregunta_id INT,
    respuesta VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(ID), 
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id)
);

-- Inserciones en la tabla Preguntas
INSERT INTO Preguntas (id, pregunta, respuesta_correcta) VALUES
(1, '¿Cómo se llaman los animales que tienen un esqueleto articulado?', 'Vertebrados'),
(2, '¿Cual es el antónimo de rico?', 'Pobre'),
(3, '¿Cuál es el resultado de 9x9?', '81'.);

-- Inserciones en la tabla Usuarios
INSERT INTO Usuarios (ID, nombre, edad) VALUES
(1, 'Cristian', 26),
(2, 'Margarita', 30),
(3, 'Diego', 27),
(4, 'Andres', 28),
(5, 'Nelson', 31);

-- Inserciones en la tabla Respuestas
INSERT INTO Respuestas (ID, usuario_id, pregunta_id, respuesta) VALUES
(1, 1, 1, 'Vertebrados'),
(2, 2, 1, 'Vertebrados'),
(3, 3, 2, 'Pobre'),
(4, 4, 1, 'mamiferos'),
(5, 5, 2, 'adinerado'); 

-- Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta)
SELECT Usuarios.nombre, COUNT(*) AS respuestas_correctas_totales
FROM Usuarios
INNER JOIN Respuestas ON Usuarios.ID = Respuestas.usuario_id
INNER JOIN Preguntas ON Respuestas.pregunta_id = Preguntas.id
WHERE Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Usuarios.nombre;
-- nombre | respuestas_correctas_totales
----------+------------------------------
-- Cristian   |                            1
-- Margarita  |                            1
-- Diego      |                            1

-- Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.
SELECT Preguntas.pregunta, COUNT(DISTINCT Respuestas.usuario_id) AS usuarios_respuesta_correcta
FROM Preguntas 
LEFT JOIN Respuestas ON Preguntas.id = Respuestas.pregunta_id AND Preguntas.respuesta_correcta = Respuestas.respuesta
GROUP BY Preguntas.pregunta;
--                 pregunta                                              | usuarios_respuesta_correcta
-------------------------------------------------------------------------+-----------------------------
-- ¿Cómo se llaman los animales que tienen un esqueleto articulado?      |                           2
-- ¿Cual es el antónimo de rico?                                         |                           1
-- ¿Cuál es el resultado de 9x9?                                         |                           0

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
UPDATE Usuarios SET email = 'cristian@gmail.com' WHERE ID = 2;
UPDATE Usuarios SET email = 'margarita@gmail.com' WHERE ID = 3;
UPDATE Usuarios SET email = 'diego@gmail.com' WHERE ID = 4;
UPDATE Usuarios SET email = 'andres@gmail.com' WHERE ID = 5;

-- Nuevos registros tabla Usuarios (Falta el de Juan porque fue eliminado en una consulta anterior)
-- id | nombre           | edad |      email
------+-----------+------+------------------
--  2 | Margarita        |   30 | margarita@gmail.com
--  3 | Diego            |   27 | diego@gmail.com
--  4 | Andres           |   28 | andres@gmail.com
--  5 | Nelson           |   31 | nelson@gmail.com

