# Descripción del modelamiento prueba final

En este diagrama se pueden observar 3 entidades con sus respectivos atributos y relaciones.

## 1. Películas

- **Atributos:**
  | Atributo      | Tipo de dato | Restricción        |
  |---------------|--------------|--------------------|
  | id_peliculas  | INT          | PRIMARY KEY UNIQUE NOT NULL |
  | Nombre        | VARCHAR(255) | NOT NULL           |
  | Año           | INT          |                    |

## 2. Películas_Tags (Entidad de unión para relación muchos a muchos)

- **Atributos:**
  | Atributo       | Tipo de dato | Restricción         |
  |----------------|--------------|---------------------|
  | id_peliculasTags | INT       | PRIMARY KEY UNIQUE NOT NULL |
  | id_peliculas   | INT          | FOREIGN KEY UNIQUE NOT NULL |
  | id_tags        | INT          | FOREIGN KEY UNIQUE NOT NULL |

## 3. Tags

- **Atributos:**
  | Atributo | Tipo de dato | Restricción         |
  |----------|--------------|---------------------|
  | id_tags  | INT          | PRIMARY KEY UNIQUE NOT NULL |
  | tags     | VARCHAR(32)  |                     |

## Relaciones:

- La entidad **Películas_Tags** sirve como un puente para la relación muchos a muchos entre `Películas` y `Tags`.
- **Películas a Películas_Tags**:
  - Relación de 1:N, donde una entidad de `Películas` puede relacionarse con muchos registros en `Películas_Tags`.
- **Películas_Tags a Tags**:
  - Relación de N:1, donde muchos registros en `Películas_Tags` pueden estar relacionados con un único `Tag`.

## Tipos de registros y restricciones:

- **INT**: Número entero.
- **Primary Key (PK)**: Llave primaria, identificador único.
- **Foreign Key (FK)**: Llave secundaria, ayuda a relacionar entidades, configurada a través de llaves primarias.
- **Varchar**: Cadena de textos que se limita a través del número de caracteres señalado en los paréntesis según su caso de uso.

### Restricciones:

- **NOT NULL**: El campo no puede estar vacío.
- **UNIQUE**: El registro debe ser único; no se puede repetir.
