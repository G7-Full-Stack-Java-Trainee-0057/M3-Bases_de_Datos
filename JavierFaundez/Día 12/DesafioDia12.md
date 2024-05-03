# Descripción del modelamiento prueba final

En este diagrama se pueden observar distintas entidades con sus respectivos atributos y relaciones.

## Entidades y Atributos

### Médico
| Atributo     | Tipo de dato | Restricción       |
|--------------|--------------|-------------------|
| Rut_medico   | INT          | PRIMARY KEY UNIQUE NOT NULL |
| Nombre       | VARCHAR(255) | NOT NULL          |
| Dirección    | VARCHAR(355) |                   |

### Especialidad
| Atributo     | Tipo de dato | Restricción       |
|--------------|--------------|-------------------|
| Código       | INT          | PRIMARY KEY UNIQUE NOT NULL |
| Descripción  | VARCHAR(500) | NOT NULL          |

### Consulta
| Atributo       | Tipo de dato | Restricción       |
|----------------|--------------|-------------------|
| Número_Box     | INT          | PRIMARY KEY UNIQUE NOT NULL |
| Rut_medico     | INT          | FOREIGN KEY UNIQUE NOT NULL |
| Rut_paciente   | INT          | FOREIGN KEY UNIQUE NOT NULL |
| Fecha          | DATE         | NOT NULL          |
| Hora_Atención  | TIME         | NOT NULL          |

### Paciente
| Atributo     | Tipo de dato | Restricción       |
|--------------|--------------|-------------------|
| Rut_paciente | INT          | PRIMARY KEY UNIQUE NOT NULL |
| Nombre       | VARCHAR(255) | NOT NULL          |
| Dirección    | VARCHAR(355) |                   |

## Relaciones

- Médico tiene una relación de muchos a uno (N:1) con respecto a la entidad especialidad, donde muchos médicos pueden tener 1 especialidad cada uno.
- Consulta actúa como entidad intermedia entre médico y paciente para evitar una relación de muchos a muchos (N:N).
- Médico y consulta mantienen una relación donde un médico atiende una o más consultas (1:N), y cada consulta tiene asociado un solo médico.
- Paciente y consulta tienen una relación donde un paciente puede tener una o más consultas (1:N), y cada consulta tiene asociado un solo paciente.
- Licencia se relaciona con consulta en una relación de uno a uno o cero (1 a 0..1), indicando que una consulta puede o no derivar en una licencia.

## Tipos de Registros y Restricciones

### Tipos de registros:
- **INT**: Entero.
- **Primary Key (PK)**: Llave primaria, identificador único.
- **Foreign Key (FK)**: Llave secundaria, nos ayudan a relacionar entidades, se configuran a través de llaves primarias.
- **Varchar**: Cadena de textos limitada por el número de caracteres.
- **Date**: Tipo de dato que almacena fechas.
- **Time**: Tipo de dato que almacena hora del día.

### Restricciones:
- **NOT NULL**: No puede estar vacío.
- **UNIQUE**: El registro debe ser único, no se puede repetir.
