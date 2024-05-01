-- Tabla Películas
CREATE TABLE Peliculas (
    id VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    anno INT NOT NULL
);

-- Tabla Tags
CREATE TABLE Tags (
    ID VARCHAR(20) PRIMARY KEY,
    tag VARCHAR(20) NOT NULL
);

-- Tabla Género
CREATE TABLE Genero (
    ID VARCHAR(20) PRIMARY KEY,
    id_pelicula VARCHAR(20),
    id_tag VARCHAR(20),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id),
    FOREIGN KEY (id_tag) REFERENCES Tags(id)
);