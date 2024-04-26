-- Modificación de campos NULL a NOT NULL
-- Paso 0: Creamos la base de datos
CREATE DATABASE lg_company;
-- CREATE DATABASE

-- Paso 0: Nos conectamos a la base de datos
\c lg_company
-- Ahora está conectado a la base de datos «lg_company» con el usuario «postgres».

-- Paso 1: Creamos la tabla llamada clientes

CREATE TABLE clientes ( -- Creamos una nueva tabla llamada clientes
id INTEGER UNIQUE NOT NULL, -- indentificador principal de cada cliente, se declara como INTEGER por lo que almacenara solo numeros enteros, NOT NULL esta restricción evita que se almacene valores nulos
name VARCHAR(25) NOT NULL, -- Esta columna almacenara el nombre del cliente, VARCHAR(25) va a permitir un maximo de 25 caracteres
email VARCHAR(50) -- Esta columna almacenara el correo electronico del cliente, VARCHAR(50) va a permitir un maximo de 50 caracteres
);
-- CREATE TABLE

-- Paso 2: Insertamos datos a la tabla clientes

INSERT INTO clientes(id, name) VALUES 
(1,'Nombre 1');
-- INSERT 0 1
INSERT INTO clientes(id, name) VALUES 
(2,'Nombre 2');
-- INSERT 0 1
INSERT INTO clientes(id, name) VALUES 
(3,'Nombre 3');
-- INSERT 0 1
--SELECT * FROM clientes;
 id |   name   | email
----+----------+-------
  1 | Nombre 1 |
  2 | Nombre 2 |
  3 | Nombre 3 |
(3 filas)

-- Paso 3: Alteramos la columna email con un "NOT NULL con ALTER TABLE"

-- ALTER TABLE: comienza la modificación en la estructura de una tabla.
-- ALTER COLUMN: Este clausula indica que estas modificando especificamente un columna dentro de la tabla.
-- SET NOT NULL: No se permitirá que la columna este vacía.

ALTER TABLE clientes ALTER COLUMN email SET NOT NULL; 
-- ERROR: la columna «email» de la relación «clientes» contiene valores null

-- Paso 4: Actualizamos a columna email

-- UPDATE: inicia la actualización en una tabla.
-- SET: Esta clausula introduce los cambios especificos que estas realizando en la tabla.
-- WHERE: esta clausula especifica la condición que determina que filas de la tabla se veran afectadas por la actualizacion.
-- IS NULL: actualmente la columna tiene un valor nulo.

UPDATE clientes SET email = '' WHERE email IS NULL;
-- UPDATE 3

-- Paso 5: Corremos nuevamente el comando de alteración de la columna

ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- ALTER TABLE

-- Aplicando lo aprendido

-- Creamos el campo llamado "fecha".

-- ADD COLUMN: Esta cláusula indica que estás agregando una nueva columna a la tabla.
-- DATE: Aquí se especifica el tipo de dato de la nueva columna, que es DATE en este caso se almacenan datos en formato AÑO-MES-DIA.

ALTER TABLE clientes ADD COLUMN fecha DATE;
-- ALTER TABLE
-- SELECT * FROM clientes;
 id |   name   | email | fecha
----+----------+-------+-------
  1 | Nombre 1 |       |
  2 | Nombre 2 |       |
  3 | Nombre 3 |       |
(3 filas)

-- Modificamos la tabla asignando una restricción.

UPDATE clientes SET fecha = '01-01-1111' WHERE fecha IS NULL;
-- UPDATE 3
-- SELECT * FROM clientes;
 id |   name   | email |   fecha
----+----------+-------+------------
  1 | Nombre 1 |       | 1111-01-01
  2 | Nombre 2 |       | 1111-01-01
  3 | Nombre 3 |       | 1111-01-01
(3 filas)

ALTER TABLE clientes ALTER COLUMN fecha SET NOT NULL;
-- ALTER TABLE

-- Paso 6: Agregamos un nuevo campo a la tabla de clientes pero los registros que ya existen no tienen dicha fecha incorporada.

-- Asignemos una fecha a esos registros con COALESCE.
-- COALESCE: Esta función permite seleccionar campos que sean nulos en una tabla y modificarlos con un valor determinado.
UPDATE clientes SET fecha = COALESCE(fecha, '2024-01-01');
-- UPDATE 3
-- SELECT * FROM clientes;
 id |   name   | email |   fecha
----+----------+-------+------------
  1 | Nombre 1 |       | 1111-01-01
  2 | Nombre 2 |       | 1111-01-01
  3 | Nombre 3 |       | 1111-01-01
(3 filas)

-- Como se realizo la modificacion antes no encontrara nada que modificar, por lo que ya no existen nulos.

UPDATE clientes SET fecha = null  WHERE fecha = '01-01-1111';
-- ERROR:  el valor nulo en la columna «fecha» de la relación «clientes» viola la restricción de no nulo
-- DETALLE:  La fila que falla contiene (1, Nombre 1, , null).

-- Datos nulos en tabla de productos.

-- SERIAL: Esto indica que la columna id será un entero auto-incrementable. Esto significa que cada nueva fila insertada en la tabla tendrá un valor de ID único generado automáticamente por el sistema de base de datos.
-- PRIMARY KEY: No puede haber dos filas con el mismo valor de id.
-- NUMERIC(10,2): Esto especifica que la columna precio puede almacenar datos numéricos con una precisión total de 10 dígitos y una escala de 2 decimales.
-- TEXT: Esto especifica que la columna sku puede almacenar datos textuales de longitud variable.

CREATE TABLE productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
precio NUMERIC(10,2) NOT NULL,
sku TEXT
);
-- CREATE TABLE

INSERT INTO productos (nombre, precio, sku)
VALUES
  ('Televisor 50 pulgadas', 1500.00, NULL),
  ('Celular de alta gama', 1000.00, NULL),
  ('Laptop de última generación', 2000.00, NULL),
  ('Nevera con congelador', 500.00, NULL),
  ('Lavadora automática', 300.00, NULL),
  ('Cocina a gas', 400.00, NULL),
  ('Horno microondas', 250.00, NULL),
  ('Juego de ollas', 100.00, NULL),
  ('Set de cubiertos', 50.00, NULL),
  ('Cafetera eléctrica', 75.00, NULL),
  ('Tostadora', 50.00, NULL),
  ('Plancha de vapor', 100.00, NULL),
  ('Secadora de ropa', 200.00, NULL),
  ('Aspiradora', 150.00, NULL),
  ('Robot aspirador', 300.00, NULL),
  ('Silla de oficina', 200.00, NULL),
  ('Mesa de escritorio', 150.00, NULL),
  ('Escritorio para computadora', 250.00, NULL),
  ('Sillón para sala', 300.00, NULL),
  ('Sofá cama', 400.00, NULL),
  ('Mesa de centro', 200.00, NULL),
  ('Silla para comedor', 150.00, NULL),
  ('Mesa para comedor', 250.00, NULL),
  ('Cama matrimonial', 400.00, NULL),
  ('Cabecera para cama', 250.00, NULL),
  ('Mesa de noche', 150.00, NULL),
  ('Armario ropero', 300.00, NULL),
  ('Espejo para baño', 200.00, NULL),
  ('Inodoro', 150.00, NULL),
  ('Lavabo', 250.00, NULL),
  ('Grifería para baño', 100.00, NULL),
  ('Ducha', 75.00, NULL),
  ('Bañera', 50.00, NULL),
  ('Cocina de inducción', 400.00, NULL),
  ('Campana extractora', 300.00, NULL),
  ('Microondas', 250.00, NULL),
  ('Lavavajillas', 1000.00, NULL),
  ('Lavadora secadora', 2000.00, NULL);
-- INSERT 0 38

SELECT * FROM productos;

 id |            nombre             | precio  | sku
----+-------------------------------+---------+-----
  1 | Televisor 50 pulgadas         | 1500.00 |
  2 | Celular de alta gama          | 1000.00 |
  3 | Laptop de última generación   | 2000.00 |
  4 | Nevera con congelador         |  500.00 |
  5 | Lavadora autom├ítica          |  300.00 |
  6 | Cocina a gas                  |  400.00 |
  7 | Horno microondas              |  250.00 |
  8 | Juego de ollas                |  100.00 |
  9 | Set de cubiertos              |   50.00 |
 10 | Cafetera el├®ctrica           |   75.00 |
 11 | Tostadora                     |   50.00 |
 12 | Plancha de vapor              |  100.00 |
 13 | Secadora de ropa              |  200.00 |
 14 | Aspiradora                    |  150.00 |
 15 | Robot aspirador               |  300.00 |
 16 | Silla de oficina              |  200.00 |
 17 | Mesa de escritorio            |  150.00 |
 18 | Escritorio para computadora   |  250.00 |
 19 | Sill├│n para sala             |  300.00 |
 20 | Sof├í cama                    |  400.00 |
 21 | Mesa de centro                |  200.00 |
 22 | Silla para comedor            |  150.00 |
 23 | Mesa para comedor             |  250.00 |
 24 | Cama matrimonial              |  400.00 |
 25 | Cabecera para cama            |  250.00 |
 26 | Mesa de noche                 |  150.00 |
 27 | Armario ropero                |  300.00 |
 28 | Espejo para baño              |  200.00 |
 29 | Inodoro                       |  150.00 |
 30 | Lavabo                        |  250.00 |
 31 | Grifería para baño            |  100.00 |
 32 | Ducha                         |   75.00 |
 33 | Bañera                        |   50.00 |
 34 | Cocina de inducci├│n          |  400.00 |
 35 | Campana extractora            |  300.00 |
 36 | Microondas                    |  250.00 |
 37 | Lavavajillas                  | 1000.00 |
 38 | Lavadora secadora             | 2000.00 |
 (38 filas)

--Borrar tablas referenciadas