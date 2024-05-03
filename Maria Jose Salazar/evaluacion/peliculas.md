crear tabla peliculas
CREATE TABLE peliculas (
    id INT(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    anno INT NOT NULL,
);

# Modelo Lógico: Entidad peliculas

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| id (PK)    | INT(15)       | Primary Key            |
| nombre     | VARCHAR(50)   | Not Null               |
| anno       | INT           | Not Null               |

CREATE TABLE tags (
    id INT(15) PRIMARY KEY,
    tags VARCHAR(20) NOT NULL,
);

# Modelo Lógico: Entidad Tags

| Atributo       | Tipo        | Restricciones|
|----------------|-------------|--------------|
| id(PK)        | INT(15)     | Primary Key  |
| tag            | VARCHAR(20) | Not Null     |

CREATE TABLE Genero (
    ID INT(20) PRIMARY KEY,
    id_pelicula VARCHAR(20),
    id_tag VARCHAR(20),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id),
    FOREIGN KEY (id_tag) REFERENCES Tags(ID)
);

# Modelo Lógico: Entidad Género

| Atributo    | Tipo        | Restricciones           |
|-------------|-------------|------------------------ |
| ID (PK)     | INT(20) | Primary Key             |
| id_pelicula | VARCHAR(20) | Foreign Key Película(ID)|
| id_tag      | VARCHAR(20) | Foreign Key Tags(ID)    |

-- Inserción en la Tabla películas
INSERT INTO Peliculas (id, nombre, anno) VALUES 
    ('1','Forest Gump',1994),
    ('2','Titanic',1997),
    ('3','El Padrino',1972),
    ('4','Gladiator',2000),
    ('5','El Señor de los anillos: El retorno del rey',2003);

-- Inserción en la Tabla tags
INSERT INTO Tags (id, tag) VALUES 
    ('1', 'Drama'),
    ('2', 'Ciencia ficción'),
    ('3', 'Romance'),
    ('4', 'Fantasía'),
    ('5', 'Thriller');

-- Inserción en la Tabla Genero
INSERT INTO Genero (id, id_pelicula, id_tag) VALUES
    ('1', '1', '1'),
    ('2', '1', '3'),
    ('3', '1', '5'),
    ('4', '3', '2'),
    ('5', '2', '1'),
    ('6', '2', '3'),
    ('8', '5', '1'),
    ('9', '5', '5');

-- Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.
SELECT peliculas.nombre, COUNT(genero.id_tag) AS cantidad_tags 
FROM peliculas 
LEFT JOIN genero ON peliculas.id = genero.id_pelicula 
LEFT JOIN tags ON genero.id_tag = tags.id GROUP BY peliculas.nombre;
--                   nombre                    | count
-----------------------------------------------+-------
-- El Señor de los anillos: El retorno del rey |     2
-- Titanic                                     |     2
-- El Padrino                                  |     1
-- Gladiator                                   |     0
-- Forest Gump                                 |     3
