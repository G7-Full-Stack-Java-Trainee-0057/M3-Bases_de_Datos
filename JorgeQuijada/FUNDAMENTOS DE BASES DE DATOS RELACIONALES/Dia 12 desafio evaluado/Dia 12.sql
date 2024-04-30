--Creando tabla Especialidad

CREATE TABLE especialidad (
codigo INT PRIMARY KEY,
descripción VARCHAR NOT NULL
);

 codigo | descripción
--------+-------------
(0 filas)

--Creando tabla Medico

CREATE TABLE medico (
codigo_especialidad INT NOT NULL,
rut INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
dirección VARCHAR(255) NOT NULL,
FOREIGN KEY (codigo_especialidad) REFERENCES Especialidad(codigo)
);

 codigo_especialidad | rut | nombre | dirección
---------------------+-----+--------+-----------
(0 filas)

--Creando tabla Paciente

CREATE TABLE paciente (
rut INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
dirección VARCHAR(255) NOT NULL
);

 rut | nombre | dirección
-----+--------+-----------
(0 filas)

--Creando tabla Licencia

CREATE TABLE licencia (
codigo INT PRIMARY KEY,
diagnóstico VARCHAR NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_termino DATE NOT NULL
);

 codigo | diagnóstico | fecha_inicio | fecha_termino
--------+-------------+--------------+---------------
(0 filas)

--Creando tabla Consulta

CREATE TABLE consulta (
rut_medico INT NOT NULL,
fecha DATE NOT NULL,
hora_atención TIME NOT NULL,
numero_box INT NOT NULL,
codigo_licencia INT NOT NULL,
rut_paciente INT NOT NULL,
FOREIGN KEY (rut_medico) REFERENCES Medico(rut),
FOREIGN KEY (codigo_licencia) REFERENCES Licencia(codigo),
FOREIGN KEY (rut_paciente) REFERENCES Paciente(rut)
);

 rut_medico | fecha | hora_atención | numero_box | codigo_licencia | rut_paciente
------------+-------+---------------+------------+-----------------+--------------
(0 filas)