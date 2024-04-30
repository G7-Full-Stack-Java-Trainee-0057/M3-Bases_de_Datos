-- Autor: Vinceto
-- 1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos. (1punto)
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    anno DATE
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL
);

CREATE TABLE detalle_peliculas (
    id SERIAL PRIMARY KEY,
    pelicula_id INT REFERENCES Peliculas(id) NOT NULL,
    tag_id INT REFERENCES Tags(id) NOT NULL
);
-- 2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados. (1punto)
INSERT INTO peliculas (nombre, anno) VALUES
('Pulp Fiction', 1994),
('The Lord of the Rings: The Fellowship of the Ring', 2001),
('Inception', 2010),
('The Shawshank Redemption', 1994),
('Forrest Gump', 1994);

INSERT INTO tags (nombre) VALUES
('Violento'),
('Humor Negro'),
('Intriga'),
('Fantasía Épica'),
('Aventura');

INSERT INTO detalle_peliculas (pelicula_id, tag_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5);

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0. (1punto)
SELECT P.titulo, COALESCE(COUNT(PT.tag_id), 0) AS cantidad_tags
FROM peliculas P
LEFT JOIN detalle_peliculas PT ON P.id = PT.pelicula_id
GROUP BY P.id, P.titulo;


-- 4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de
-- datos.
-- (1 punto)
CREATE TABLE preguntas (
    id SERIAL PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL
    respuesta_correcta VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT
);

CREATE TABLE respuestas (
    id SERIAL PRIMARY KEY,
    respuesta VARCHAR(255) NOT NULL,
    pregunta_id INT REFERENCES preguntas(id),
    usuario_id INT REFERENCES usuario(id)
);
-- 5. Agrega 5 registros a la tabla preguntas, de los cuales: (1 punto)
-- a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios
-- distintos
-- b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
-- c. 3. Los otros dos registros deben ser respuestas incorrectas.
-- Hint: Contestada correctamente significa que la respuesta indicada en la tabla
-- respuestas es exactamente igual al texto indicado en la tabla de preguntas.
-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la
-- pregunta).
-- (1 punto)
-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la
-- respuesta correcta.
-- (1 punto)
-- 8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el
-- primer usuario para probar la implementación.
-- (1 punto)
-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de
-- datos.
-- (1 punto)
-- _ 3
-- www.desafiolatam.com
-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de
-- único.
-- (1 punto)

CREATE TABLE Preguntas (
    id SERIAL PRIMARY KEY,
    texto VARCHAR(255) NOT NULL
);

CREATE TABLE Respuestas (
    id SERIAL PRIMARY KEY,
    pregunta_id INT REFERENCES Preguntas(id),
    texto VARCHAR(255) NOT NULL,
    es_correcta BOOLEAN NOT NULL
);

CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT CHECK (edad >= 18),
    email VARCHAR(255) UNIQUE NOT NULL
);
