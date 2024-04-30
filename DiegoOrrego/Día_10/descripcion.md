# Modelo Entidad-Relación: Actores y Películas

## Actores
- actor_id (PRIMARY KEY, NOT NULL)
- nombre (NOT NULL)

## Películas
- pelicula_id (PRIMARY KEY, NOT NULL)
- nombre (NOT NULL)
- género (NOT NULL)

## Participación (entidad de relación)
- actor_id (FOREIGN KEY que referencia actor, NOT NULL)
- pelicula_id (FOREIGN KEY que referencia película, NOT NULL)

# Modelo Lógico: Actores y Películas

## Tabla: Actores
| Columna    | Tipo      | Restricciones     |
|------------|-----------|-------------------|
| actor_id   | INT       | PRIMARY KEY       |
| nombre     | VARCHAR   | NOT NULL          |

## Tabla: Películas
| Columna      | Tipo      | Restricciones     |
|--------------|-----------|-------------------|
| pelicula_id  | INT       | PRIMARY KEY       |
| nombre       | VARCHAR   | NOT NULL          |
| género       | VARCHAR   | NOT NULL          |

## Tabla: Participación
| Columna      | Tipo      | Restricciones     |
|--------------|-----------|-------------------|
| actor_id     | INT       | FOREIGN KEY       |
| pelicula_id  | INT       | FOREIGN KEY       |

## Creación de la tabla de actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

## Creación de la tabla de películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    pelicula VARCHAR(30),
    genero VARCHAR(30) NOT NULL
);

## Creación de la tabla intermedia para la relación N:N entre actores y películas
CREATE TABLE ActoresPeliculas (
    id_pelicula INT,
    id_actor INT,
    PRIMARY KEY (id_actor, id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);