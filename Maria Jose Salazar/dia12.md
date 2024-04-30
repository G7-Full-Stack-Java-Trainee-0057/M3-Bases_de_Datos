-- Se crea base de datos;
CREATE DATABASE consulta_medica;

-- comando psql para conectarse a la base de datos.
-- \c consulta_medica

-- se crea tabla medico
CREATE TABLE medico (
  rut varchar(15) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
);

# Modelo Lógico: Entidad Médico

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| Rut (PK)   | VARCHAR(15)   | Primary Key            |
| Nombre     | VARCHAR(50)  | Not Null               |
| Dirección  | VARCHAR(200)  | Not Null               |

-- Se crea tabala especialidad
CREATE TABLE especialidad (
  codigo SERIAL PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL
);

# Modelo Lógico: Entidad Especialidad

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| Codigo (PK)   | Serial(15)   | Primary Key            |
| Descripcion | VARCHAR(50)  | Not Null               |

--se crea tabla paciente
CREATE TABLE paciente (
    rut varchar(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

# Modelo Lógico: Entidad Paciente

| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| Rut (PK)   | VARCHAR(15)   | Primary Key            |
| Nombre     | VARCHAR(50)  | Not Null               |       
| Dirección  | VARCHAR(200)  | Not Null               |

-- Se crea tabla consulta
CREATE TABLE consulta (
    codigo SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL,
    nbox INTEGER NOT NULL,
    rut_paciente VARCHAR(15) NOT NULL,
    rut_medico VARCHAR(15) NOT NULL,
    FOREIGN KEY (rut_paciente) REFERENCES paciente(rut),
    FOREIGN KEY (rut_medico) REFERENCES medico(rut)
);

# Modelo Lógico: Entidad Consulta

| Atributo       | Tipo        | Restricciones                 |
|----------------|-------------|-------------------------------|
| ID (PK)        | INT         | Primary Key                   |
| Fecha_hora     | DATE        | Not Null                      |
| Nro_box        | INT         | Not Null                      |
| Paciente_Rut   | VARCHAR(15) | Foreign Key Paciente(Rut)     |
| Medico_Rut     | VARCHAR(15) | Foreign Key Medico(Rut)       |


-- Se crea tabla licencia
CREATE TABLE licencia (
  codigo SERIAL,
  diagnostico VARCHAR(255) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  FOREIGN KEY (consulta_id) REFERENCES consulta(codigo),
);
# Modelo Lógico: Entidad Licencia

| Atributo       | Tipo        | Restricciones                |
|----------------|-------------|------------------------------|
| Código (PK)    | SERIAL       | Primary Key                 |
| Diagnóstico    | VARCHAR(255)| Not Null                     |
| Fecha_inicio   | DATE        | Not Null                     |
| Fecha_termino  | DATE        | Not Null                     |
| Consulta_ID    | INT         | Foreign Key Consulta(ID)     |
