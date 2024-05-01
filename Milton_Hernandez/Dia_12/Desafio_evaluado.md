- Desafio Asincronico.
- Se desarrolla la estructura logica de la atencion de un directorio de paciente para distintas especialidades de un centro clinico, donde se identificaron las entidades "Medico", "Paciente", "Especialidad", "Licencia" y una entidad intermedia "Consulta".

- Se crean las tablas con sus respectivas restricciones.
- La cardinalidad se demuestra en la imagen adjuntada en dia 12, donde se demuestran las relaciones.
N:1 Medico-Especialidad
1:N Medico-Consulta
1:1 o 1:0 Licencia-Consulta
N:1 Paciente-Licencia

- Entidad medico

| Campo            | Tipo                            | Restricciones            |
|------------------|---------------------------------|--------------------------|
| rut_medico       | INT                             | PRIMARY KEY, NOT NULL   |
| nombre           | VARCHAR(150)                    | NOT NULL                 |
| direccion        | VARCHAR(150)                    | NULL                     |
| id_especialidad  | INT                             | FOREIGN KEY, NOT NULL    |

- Entidad especialidad

| Campo             | Tipo          | Restricciones   |
|-------------------|---------------|-----------------|
| id_especialidad   | INT           | PRIMARY KEY     |
| descripcion       | VARCHAR(150)  | NOT NULL        |

- Entidad paciente 

| Campo            | Tipo                            | Restricciones            |
|------------------|---------------------------------|--------------------------|
| rut_paciente     | INT                             | PRIMARY KEY, NOT NULL   |
| nombre           | VARCHAR(150)                    | NOT NULL                 |
| direccion        | VARCHAR(150)                    | NULL                     |

- Entidad intermedia consulta

| Campo           | Tipo             | Restricciones           |
|-----------------|------------------|-------------------------|
| id_consulta     | INT              | PRIMARY KEY, NOT NULL   |
| rut_medico      | INT              | NOT NULL                |
| rut_paciente    | INT              | NOT NULL                |
| id_licencia     | INT              | NOT NULL                |
| fecha           | DATE             | NOT NULL                |
| hora_atencion   | VARCHAR(30)      | NOT NULL                |
| numero_box      | VARCHAR(30)      | NOT NULL                |

- Entidad licencia

| Campo           | Tipo             | Restricciones           |
|-----------------|------------------|-------------------------|
| id_licencia     | INT              | PRIMARY KEY             |
| diagnostico     | VARCHAR(150)     | NOT NULL                |
| fecha_inicio    | DATE             | NOT NULL                |
| fecha_termino   | DATE             | NOT NULL                |
