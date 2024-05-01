# Modelo Lógico: Entidad Películas

| Atributo   | Tipo          | Restricciones|
|------------|---------------|--------------|
| id (PK)    | VARCHAR(20)   | Primary Key  |
| Nombre     | VARCHAR(50)   | Not Null     |       
| anno       | INT           | Not Null     |

- **id (PK)**: Identificador único de lA película.
- **Nombre**: Nombre de la película.
- **anno**: Año de la película

# Modelo Lógico: Entidad Género

| Atributo    | Tipo          | Restricciones           |
|-------------|---------------|-------------------------|
| ID (PK)     | VARCHAR(20)   | Primary Key             |
| id_pelicula | VARCHAR(20)   | Foreign Key Película(ID)|
| id_tag      | VARCHAR(20)   | Foreign Key Tags(ID)    |

- **Rut (PK)**: Identificador único genéro de las películas.
- **id_pelicula**: Clave foránea que hace referencia al ID de la película.
- **id_tag**: Clave foránea que hace referencia al ID de tags.

# Modelo Lógico: Entidad Tags

| Atributo       | Tipo        | Restricciones|
|----------------|-------------|--------------|
| ID (PK)        | VARCHAR(20) | Primary Key  |
| tag            | VARCHAR(20) | Not Null     |

- **ID (PK)**: Identificador único de la consulta.
- **tag**: Tag de la película.