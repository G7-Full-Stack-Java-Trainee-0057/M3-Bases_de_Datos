-- 4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos.

-- Tabla Preguntas
CREATE TABLE preguntas (
    id_pregunta INT  PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta_correcta VARCHAR NOT NULL
);

-- SELECT * FROM preguntas;
 id_pregunta | pregunta | respuesta_correcta
-------------+----------+--------------------
(0 filas)

-- Tabla Usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL
);

-- SELECT * FROM Usuarios
 id_usuario | nombre | edad
------------+--------+------
(0 filas)

-- Tabla Respuestas
CREATE TABLE respuestas (
    id_respuestas INT PRIMARY KEY,
    respuesta VARCHAR(255),
    usuario_id INT,
    pregunta_id INT,
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(id_pregunta),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

-- SELECT * FROM respuestas;
 id_respuestas | respuesta | usuario_id | pregunta_id
---------------+-----------+------------+-------------
(0 filas)