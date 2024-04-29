## Descripción del modelamiento entregado Día 11

En este diagrama se pueden observar 3 entidades con sus respectivos atributos y relaciones.

### Actores
- Atributos:

| Atributo    | Tipo de dato | Restricción       |
|-------------|--------------|-------------------|
| ID_Actores  | INT          | PRIMARY KEY, UNIQUE, NOT NULL |
| Nombre      | VARCHAR(30)  | NOT NULL          |
| Apellido    | VARCHAR(50)  | NOT NULL          |

### Actores_Pelicula
- Atributos:

| Atributo     | Tipo de dato | Restricción          |
|--------------|--------------|----------------------|
| ID_Actores   | INT          | FOREIGN KEY, UNIQUE, NOT NULL |
| ID_Peliculas | INT          | FOREIGN KEY, UNIQUE, NOT NULL |

### Películas
- Atributos:

| Atributo     | Tipo de dato | Restricción       |
|--------------|--------------|-------------------|
| ID_Peliculas | INT          | PRIMARY KEY, UNIQUE, NOT NULL |
| Película     | VARCHAR(30)  | NOT NULL          |
| Genero       | VARCHAR(30)  | NOT NULL          |

### Relaciones:
- La entidad intermedia **Actores_Peliculas** relaciona las entidades Actores y películas a través del ID.
- Entre Actores y Actores_Peliculas hay una relación de 1:N, lo que indica que un único actor puede relacionarse con muchos registros en la entidad intermedia Actores_Peliculas.
- La relación entre Actores_Peliculas y películas es N:1, lo que refleja que muchos registros en la entidad intermedia Actores_Peliculas pueden estar relacionados con una única película.

### Tipos de registros
- **INT**: Entero
- **Primary Key (PK)**: Llave primaria, identificador único.
- **Foreign Key (FK)**: Llave secundaria, nos ayudan a relacionar entidades, se configuran a través de llaves primarias.
- **Varchar**: Cadena de textos que se limitan a través del número de caracteres señalado en los paréntesis según su caso de uso.

### Restricciones
- **NOT NULL**: No puede estar vacío
- **UNIQUE**: El registro debe ser único, no se puede repetir.
