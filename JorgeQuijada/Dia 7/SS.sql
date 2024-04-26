--proyect SS
-- Creamos la base de datos con el nombre mawashi_cars.
CREATE DATABASE mawashi_cars;
--Nos conectamos a la base de datos.
\c mawashi_cars;

--Creamos la tabla autos.
CREATE TABLE autos(id int primary key, marca VARCHAR(25), modelo
VARCHAR(25), año VARCHAR(25), color VARCHAR(25), precio float);
--Creamos la tabla de ventas.

CREATE TABLE ventas(id serial unique not null, fecha VARCHAR(20),
id_auto int, cliente VARCHAR(25), referencia int, cantidad float,
metodo_pago VARCHAR(10), foreign key (id_auto) references autos(id));

--Insertamos registros en la tabla autos.
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(1,'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(2,'Mazda', 'Mazda 3', '2000', 'Azul',2000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(3,'Chevrolet', 'Spark', '1998', 'Verde Oscuro', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(4,'Nissan', 'Versa', 2018, 'Gris Plata', 5000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(5,'Hyundai', 'Accent', 2022, 'Rojo', 10500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(6,'Kia', 'Rio', 2020, 'Negro', 8000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(7,'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(8,'Fiat', 'Mobi', 2017, 'Blanco', 2800000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(9,'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(10,'Peugeot', '208', 2021, 'Rojo', 9800000);

--Insertamos algunas ventas.
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2020-10-15', 1, 'Chuck', 43224, 12000000,'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2020-11-15', 1, 'Donnie', 43334, 12000000,'Transfer');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2020-12-15', 3, 'Jet', 43444, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2021-01-05', 1, 'Peter', 43335, 12000000,'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2021-01-15', 1, 'Abigail', 43554, 12000000,'Transfer');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2021-02-01', 3, 'Jhon', 43456, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES 
('2021-02-01', 2, 'Walter', 54321, 2000000, 'Efectivo');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES 
('2021-03-15', 3, 'Sarah', 54322, 1200000, 'Tarjeta');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES 
('2021-04-05', 4, 'Jessica', 54323, 5000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES 
('2021-05-25', 5, 'Luis', 54324, 10500000, 'Transfer');

--Obtenemos un reporte con el nombre de los clientes registrados en la tabla venta, 
--junto con la marca y el modelo del auto asociado a la venta realizada.
SELECT cliente, marca, modelo --Recupero las columnas especificadas desde una tabla
FROM ventas --Desde la tabla ventas
INNER JOIN autos ON ventas.id_auto=autos.id; --Combinamos filas de 2 tablas en base a valores coincidentes de una columna
 cliente |   marca   |    modelo
---------+-----------+---------------
 Chuck   | Toyota    | Corolla Araya
 Donnie  | Toyota    | Corolla Araya
 Jet     | Chevrolet | Spark
 Peter   | Toyota    | Corolla Araya
 Abigail | Toyota    | Corolla Araya
 Jhon    | Chevrolet | Spark
 Walter  | Mazda     | Mazda 3
 Sarah   | Chevrolet | Spark
 Jessica | Nissan    | Versa
 Luis    | Hyundai   | Accent
(10 filas)

--Realizo la consulta necesaria para obtener todos los autos cuyos id no se encuentran en la tabla Ventas.
SELECT autos.* --Seleccionamos todas las columnas de la tabla autos
FROM autos --Desde la tabla autos
LEFT JOIN ventas ON autos.id=ventas.id_auto --Conbinamos los datos de ambas tablas e incluimos todas las filas de la tabla izquierda sin importar que no hayan coincidencias en la tabla derecha
GROUP BY autos.id --Agrupamos todas las filas con el mismo valor en la columna id de la tabla autos
HAVING COUNT(ventas.id_auto) = 0; --Filtro los grupos, contando la cantidad de filas donde la columna id_auto en la tabla ventas tiene un valor 0 
 id |   marca    | modelo | año  |    color    | precio
----+------------+--------+------+-------------+---------
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000
  6 | Kia        | Rio    | 2020 | Negro       | 8000000
  7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000
  8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000
  9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000
(5 filas)

--Realizo consulta para saber los registros que no tienen relación entre ambas tablas
SELECT * --Selecciona todo 
FROM autos --Desde la tabla autos
FULL OUTER JOIN ventas on ventas.id_auto=autos.id --Conbinamos datos de dos tablas basandonos en una columna
WHERE autos.id is null or ventas.id_auto is null; --Filtramos filas donde al menos una pueda ser nula
 id |   marca    | modelo | año  |    color    | precio  | id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
----+------------+--------+------+-------------+---------+----+-------+---------+---------+------------+----------+-------------
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |       |         |         |            |          |
  8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000 |    |       |         |         |            |          |
  6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |       |         |         |            |          |
  9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000 |    |       |         |         |            |          |
  7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000 |    |       |         |         |            |          |
(5 filas)