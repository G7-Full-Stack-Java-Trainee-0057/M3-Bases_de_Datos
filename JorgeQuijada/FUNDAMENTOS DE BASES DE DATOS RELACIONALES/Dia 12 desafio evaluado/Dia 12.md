# Tabla Especialidad
| Atributo        | Tipo     | Restricciones          |
|-----------------|----------|------------------------|
| codigo (PK)     | INT      | Primary Key            |
| descripción     | VARCHAR  | Not Null               |    

- **codigo [PK]** : identificador unico de especialidad.
- **descripción** : descripción de la especialidad.

# Tabla Medico
| Atributo                   | Tipo          | Restricciones    |
|----------------------------|---------------|------------------|
| codigo_especialidad [FK]   | INT           | Foreign Key      |
| rut (PK)                   | INT           | Primary Key      |
| nombre                     | VARCHAR(100)  | Not Null         |       
| dirección                  | VARCHAR(255)  | Not Null         |

- **codigo_especialidad [FK]** : LLave foranea que hace referencia a la especialidad.
- **rut [PK]** : identificador unico de medico.
- **nombre** : nombre completo del medico.
- **dirección** : residencia del medico.

# Tabla Paciente
| Atributo   | Tipo          | Restricciones          |
|------------|---------------|------------------------|
| rut (PK)   | INT           | Primary Key            |
| nombre     | VARCHAR(100)  | Not Null               |       
| dirección  | VARCHAR(255)  | Not Null               |   

- **rut [PK]** : identificador unico de medico.
- **nombre** : nombre completo del paciente.
- **dirección** : residencia del paciente.

# Tabla Licencia
| Atributo       | Tipo      | Restricciones          |
|----------------|-----------|------------------------|
| codigo (PK)    | INT       | Primary Key            |
| diagnóstico    | VARCHAR   | Not Null               |       
| fecha_inicio   | DATE      | Not Null               |
| fecha_termino  | DATE      | Not Null               |

- **código [PK]** : identificador unico de licencia.
- **diagnóstico** : Motivo por el cual se origina la licencia.
- **fecha_inicio** : inicio de la licencia.
- **fecha_termino** : termino de la licencia.

# Tabla Consulta
| Atributo              | Tipo   | Restricciones       |
|-----------------------|--------|---------------------|
| rut_medico [FK]       | INT    | Foreign Key         |
| fecha                 | DATE   | Not Null            |       
| hora_atención         | TIME   | Not Null            |
| numero_box            | INT    | Not Null            |
| codigo_licencia [FK]  | INT    | Foreign Key         |
| rut_paciente [FK]     | INT    | Foreign Key         |

- **rut_medico** : llave foranea que hace referencia a medico.
- **fecha** : fecha en la que se realizo la consulta.
- **hora_atención** : hora en que se hizo la consulta.
- **numero_box** : box en el que se realizo la consulta.
- **codigo_licencia** : llave foranea que hace referencia a licencia.
- **rut_paciente** : llave foranea que hace referencia a paciente.

relaciones:
-
- Un medico puede tener una especialidad, y una especialidad la pueden tener muchos medicos.
- Un medico puede recibir una o mas consultas.
- Un paciente puede realizar una o mas consultas.
- Una consulta solo puede tener una licencia y a su vez una licencia puede generarse a traves de una consulta.

