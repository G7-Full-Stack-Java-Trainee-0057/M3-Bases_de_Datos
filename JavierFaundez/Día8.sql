--Ejercicios día 8 

--Ejercicio: Modificacion de campos null a not null

--Creamos tabla
CREATE TABLE clientes (
id INTEGER UNIQUE NOT NULL,
name VARCHAR(25) NOT NULL, 
email VARCHAR(50)
);

--Ingresamos registros
INSERT INTO clientes(id, name) 
VALUES (1, 'Nombre 1');
INSERT INTO clientes(id, name) 
VALUES (2, 'Nombre 2');
INSERT INTO clientes(id, name) 
VALUES (3, 'Nombre 3');

--Necesitamos modificar el campo email a not null con alter table, pero no lo podemos hacer directaamente con ALTER TABLE ya que nuestro campo email ya tiene nulls
--pero no lo podemos hacer directaamente con ALTER TABLE ya que nuestro campo email ya tiene nulls
--Por eso antes de hacemos lo siguiente:

--Debemos actualizar la tabla con el comando UPDATE, seguidamente
--indicar la columna a modificar y por último con WHERE definir la condición cuando el campo sea nulo.
UPDATE clientes SET email = '' 
WHERE email IS NULL;

--Ahora si Corremos nuevamente el comando de alteración de la columna 
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

--En la tabla clientes del ejercicio anterior, crearemos un campo fecha.
--Para esto, modifica la tabla y asigna la restricción


