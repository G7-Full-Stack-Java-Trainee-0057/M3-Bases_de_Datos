####**DESAFIO** 
* La entidad Medico tiene los atributos rut_medico, nombre, dirección y id_especialidad . En este caso la PK sería rut_medico. La entidad Especialidad tiene los atributos codigo y descripción. La PK sería codigo. La FK de Medico, id_especialidad, hace referencia a la PK de Especialidad a través de codigo. La cardinalidad entre Medicos y Especialidad es n:1.

| Campo          | Tipo de Dato  | Restricciones           |
|----------------|---------------|-------------------------|
| rut_medico     | INT           | PK                      |
| nombre         | VARCHAR(100)  | NOT NULL                |
| direccion      | VARCHAR(100)  | NOT NULL                |
|id_especialidad | VARCHAR(50)   | NOT NULL                |

* La entidad Consulta tiene los atributos codigo_consulta, rut_medico, rut_paciente, codigo_licencia, fecha, hora_atencion y numero_box. 
En este caso la FK rut_medico en Consula hace referencia a la PK rut_medico de la entidad Medico. 
La FK rut_paciente de Consulta hace referencia a la FK de Paciente a través de rut_paciente. 
La FK codigo_licencia hace referencia a la PK codigo de la entidad Licencia. 
La cardinalidad entre Medicos y Consulta es 1:n.

|    Campo         | Tipo de Dato  | Restricciones           |
|------------------|---------------|-------------------------|
| codigo_consulta  | INT           | PK, Serial              |
| rut_medico       | INT           | FK                      |
| rut_paciente     | INT           | FK                      |
| codigo_licencia  | INT           | FK                      |
| fecha            | DATE          | NOT NULL                |
| hora_atencion    | INT           |                         |
| numero_box       | INT           |                         |


*  La entidad Paciente tiene los atributos rut_paciente, nombre y direccion. En este caso la PK sería rut_paciente. La cardinalidad entre Consulta y Paciente  es n:1.

Campo              | Tipo de Dato  | Restricciones           |
|------------------|---------------|-------------------------|
| rut_paciente     | INT           | PK                      |
| nombre           | VARCHAR(100)  | NOT NULL                |
| direccion        | VARCHAR(100)  |                         |


* La entidad Licencia tiene los atributos codigo, diagnostico, fecha_inicio y fecha_termino. En este caso la PK sería codigo.  La FK de Consulta, rut_medico, hace referencia a la FK de Licencia a través de codigo. La cardinalidad entre Consulta y Licencia es 0.. 1, ya que la consulta puede generar una licencia o puede que no genere una licencia.

Campo              | Tipo de Dato  | Restricciones           |
|------------------|---------------|-------------------------|
| codigo           | INT           | PK                      |
| diagnostico      | VARCHAR(100)  | NOT NULL                |
| fecha_inicio     | DATE          |                         |
| fecha_termino    | DATE          |                         |