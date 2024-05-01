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
