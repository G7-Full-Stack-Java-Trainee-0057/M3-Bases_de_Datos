# Modelo Lógico: Entidad Paciente

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| Rut (PK)   | VARCHAR(20)   | Primary Key            |
| Nombre     | VARCHAR(100)  | Not Null               |       
| Dirección  | VARCHAR(255)  | Not Null               |

- **Rut (PK)**: Identificador único del paciente en formato RUT.
- **Nombre**: Nombre completo del paciente.
- **Dirección**: Dirección de residencia del paciente.

# Modelo Lógico: Entidad Médico

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| Rut (PK)   | VARCHAR(20)   | Primary Key            |
| Nombre     | VARCHAR(100)  | Not Null               |
| Dirección  | VARCHAR(255)  | Not Null               |

- **Rut (PK)**: Identificador único del médico en formato RUT.
- **Nombre**: Nombre completo del médico.
- **Dirección**: Dirección de residencia del médico.

# Modelo Lógico: Entidad Consulta

| Atributo       | Tipo        | Restricciones                 |
|----------------|-------------|-------------------------------|
| ID (PK)        | INT         | Primary Key                   |
| Paciente_Rut   | VARCHAR(20) | Foreign Key Paciente(Rut)     |
| Medico_Rut     | VARCHAR(20) | Foreign Key Medico(Rut)       |
| Fecha_hora     | DATE        | Not Null                      |
| Nro_box        | INT         | Not Null                      |

- **ID (PK)**: Identificador único de la consulta.
- **Paciente_Rut**: Clave foránea que hace referencia al RUT del paciente.
- **Medico_Rut**: Clave foránea que hace referencia al RUT del médico.
- **Fecha_hora**: Fecha y hora en la que se realizó la consulta.
- **Nro_box**: Número del box en que se realizó la consulta.

# Modelo Lógico: Entidad Licencia

| Atributo       | Tipo        | Restricciones                |
|----------------|-------------|------------------------------|
| Código (PK)    | INT         | Primary Key                  |
| Consulta_ID    | INT         | Foreign Key Consulta(ID)     |
| Fecha_inicio   | DATE        | Not Null                     |
| Fecha_termino  | DATE        | Not Null                     |
| Diagnóstico    | VARCHAR(100)| Not Null                     |

- **Código (PK)**: Identificador único de la licencia.
- **Consulta_ID**: Clave foránea que hace referencia al ID de la consulta asociada.
- **Fecha_inicio**: Fecha de inicio de la licencia.
- **Fecha_termino**: Fecha de finalización de la licencia.
- **Diagnóstico**: Razón por la cual se emitió la licencia.
