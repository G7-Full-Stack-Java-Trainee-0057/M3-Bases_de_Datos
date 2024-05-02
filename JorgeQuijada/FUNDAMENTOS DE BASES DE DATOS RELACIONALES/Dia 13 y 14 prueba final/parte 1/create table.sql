-- 1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos

-- Tabla Peliculas

CREATE TABLE peliculas (
    id_peli SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    año INT
);

-- Tabla Tags

CREATE TABLE tags (
    id_tag SERIAL PRIMARY KEY,
    tag VARCHAR(32) NOT NULL
);

-- Tabla Catalogo 

CREATE TABLE catalogo (
    id_catalogo SERIAL PRIMARY KEY,
    id_peliculas INT,
    id_tags INT,
    FOREIGN KEY (id_peliculas) REFERENCES peliculas(id_peli),
    FOREIGN KEY (id_tags) REFERENCES tags(id_tag)
);