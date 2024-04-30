-- Creo una tabla medico que tiene los siguientes atributos
| MEDICO          | 
|-----------------|
| ID_MEDICO       | PK VARCHAR NOT NULL (EN CASO DE QUE EL ID CONTENGA LETRAS Y NUMEROS)
| NOMBRE          | VARCHAR (NO LE DI TOPE DE CARACTERES EN CASO DE QUE SEA MUY LARGO :D)
| ID_ESPECIALIDAD | FK
| DIRECCION       | VARCHAR

-- Creo una tabla especialidad con lo siguientes atributos
| ESPECIALIDAD    | 
|-----------------|
| ID_ESPECIALIDAD | PK INT NOT NULL
| DESCRIPCION     | VARCHAR

--Creo una tabla que servirá de intermediaria entre medico y paciente, llamada consulta

| CONSULTA     | 
|--------------|
| ID_MEDICO    | FK 
| ID_PACIENTE  | FK
| ID_CONSULTA  | PK INT NOT NULL
| FECHA        | VARCHAR
| BOX          | INT NOT NULL

--Creo una tabla llamada paciente
| PACIENTE     | 
|--------------|
| ID_PACIENTE  | PK VARCHAR NOT NULL
| NOMBRE       | VARCHAR NOT NULL
| DIRECCION    | VARCHAR

--Creo una tabla llamada licencia
| LICENCIA        | 
|-----------------|
| CODIGO          | PK INT NOT NULL
| ID_CONSULTA     | FK
| FECHA INICIO    | VARCHAR
| FECHA TERMINO   | VARCHAR
| DIAGNOSTICO     | VARCHAR


RELACIONES
ENTRE TABLAS:

Medico N:1 Especialidad = un medico puede tener una especialidad, una especialidad puede tener muchos
medicos.

Medico 1:n consulta = Un medico puede tener muchas consultas, una consulta solo puede tener un medico.

Consulta N:1 paciente = Una consulta puede tener un paciente, un paciente puede tener muchas consultas.

Consulta 1:1 licencia = Una consulta solo puede tener una licencia.
