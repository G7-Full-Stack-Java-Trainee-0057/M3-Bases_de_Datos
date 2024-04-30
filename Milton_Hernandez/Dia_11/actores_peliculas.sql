-- Creación de la tabla de actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

-- Creación de la tabla de películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    pelicula VARCHAR(30),
    genero VARCHAR(30) NOT NULL
);

-- Creación de la tabla intermedia para la relación N:N entre actores y películas
CREATE TABLE ActoresPeliculas (
    id_pelicula INT,
    id_actor INT,
    PRIMARY KEY (id_actor, id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);