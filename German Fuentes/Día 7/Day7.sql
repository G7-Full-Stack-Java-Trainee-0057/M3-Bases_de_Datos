--Crear base de datos mawashi_cars--
CREATE DATABASE mawashi_cars:

--Crear tabla autos--
CREATE TABLE autos(ID INT PRIMARY KEY, marca VARCHAR(25), modelo VARCHAR(25), color VARCHAR(25), precio FLOAT);

--Crear tabla ventas
CREATE TABLE ventas(id SERIAL UNIQUE NOT NULL, fecha VARCHAR(20), id_auto INT, cliente VARCHAR(25), referencia int, cantidad FLOAT, metodo_pago VARCHAR(10), FOREIGN KEY (id_auto) REFERENCES autos(id));

--Ingresar datos a la tabla autos--
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES ('1', 'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES ('2', 'Mazda', 'Mazda 3', '2000', 'Azul','2000000');
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES ('3', 'Chevrolet', 'Spark', '1998', 'Verde Oscuro', '1200000');
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (4, 'Nissan', 'Versa', 2018, 'Gris Plata', 5000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (5, 'Hyundai', 'Accent', 2022, 'Rojo', 10500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (6, 'Kia', 'Rio', 2020, 'Negro', 8000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (7, 'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (8, 'Fiat', 'Mobi', 2017, 'Blanco', 2800000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (9, 'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (10, 'Peugeot', '208', 2021, 'Rojo', 9800000);

 id |   marca    |    modelo     | año  |    color     |  precio  
----+------------+---------------+------+--------------+----------
  1 | Toyota     | Corolla Araya | 1991 | Blanco       |  1200000
  2 | Mazda      | Mazda 3       | 2000 | Azul         |  2000000
  3 | Chevrolet  | Spark         | 1998 | Verde Oscuro |  1200000
  4 | Nissan     | Versa         | 2018 | Gris plata   |  5000000
  5 | Hyundai    | Accent        | 2022 | Rojo         | 10500000
  7 | Volkswagen | Gol           | 2015 | Azul marino  |  3500000
  8 | Fiat       | Mobi          | 2017 | Blanco       |   280000
  6 | Kia        | Rio           | 2020 | Negro        |  8000000
  9 | Suzuki     | Swift         | 2019 | Gris oxford  |  6200000
 10 | Peugeot    | 208           | 2021 | Rojo         |  9800000
(10 rows)

--Ingresar datos a tabla ventas--
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2020-10-15', 1, 'Chuck', 43224, 12000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2020-11-15', 1, 'Donnie', 43334, 12000000, 'Transfer');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2020-12-15', 3, 'Jet', 43444, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-01-05', 1, 'Peter', 43335, 12000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-01-15', 1, 'Abigail', 43554, 12000000, 'Transfer');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-02-01', 3, 'Jhon', 43456, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-02-01', 2, 'Walter', 54321, 2000000, 'Efectivo');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-03-15', 3, 'Sarah', 54322, 1200000, 'Tarjeta');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-04-05', 4, 'Jessica', 54323, 5000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-05-25', 5, 'Luis', 54324, 10500000, 'Transfer');

 id |   fecha    | id_auto | cliente | referencia | cantidad | metodo_pago 
----+------------+---------+---------+------------+----------+-------------
  1 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
  2 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
  3 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
  4 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
  5 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
  6 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
  7 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
  8 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
  9 | 2021-01-15 |       1 | Abigail |      43554 | 12000000 | Transfer
 10 | 2021-02-01 |       3 | Jhon    |      43456 | 12000000 | Cheque
 11 | 2021-02-01 |       2 | Walter  |      54321 |  2000000 | Efectivo
 12 | 2021-03-15 |       3 | Sarah   |      54322 |  1200000 | Tarjeta
 13 | 2021-04-05 |       4 | Jessica |      54323 |  5000000 | Débito
 14 | 2021-05-25 |       5 | Luis    |      54324 | 10500000 | Transfer
(14 rows)

--Obtener reporte con el nombre de los clientes registrados en la tabla ventas, junto con la marca y el modeo del auto asociado a la venta realizada--
SELECT cliente, marca, modelo FROM ventas iNNER JOIN autos ON ventas.id_auto = autos.id;

 cliente |   marca   |    modelo     
---------+-----------+---------------
 Chuck   | Toyota    | Corolla Araya
 Donnie  | Toyota    | Corolla Araya
 Jet     | Chevrolet | Spark
 Peter   | Toyota    | Corolla Araya
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

 --Consulta para obtener todos los autos cuyos ID no se encuentran en la tabla ventas--
 SELECT autos.* FROM autos LEFT JOIN ventas ON autos.id = ventas.id_auto WHERE ventas IS NULL;

 id |   marca    | modelo | año  |    color    | precio  
----+------------+--------+------+-------------+---------
  7 | Volkswagen | Gol    | 2015 | Azul marino | 3500000
  8 | Fiat       | Mobi   | 2017 | Blanco      |  280000
  6 | Kia        | Rio    | 2020 | Negro       | 8000000
  9 | Suzuki     | Swift  | 2019 | Gris oxford | 6200000
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000
(5 rows)

--Saber los registros que no tienen relación entre ambas tablas para realizar el cruce con la información cedida anteriormente y terminar la auditoría--
SELECT * FROM autos FULL OUTER JOIN ventas on ventas.id_auto=autos.idWHERE autos.id is null or ventas.id_auto is null;

 id |   marca    | modelo | año  |    color    | precio  | id |   fecha    | id_auto | cliente | referencia | cantidad | metodo_pago 
----+------------+--------+------+-------------+---------+----+------------+---------+---------+------------+----------+-------------
    |            |        |      |             |         |  1 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
    |            |        |      |             |         |  2 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
    |            |        |      |             |         |  3 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
    |            |        |      |             |         |  4 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
    |            |        |      |             |         |  5 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
    |            |        |      |             |         |  6 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
    |            |        |      |             |         |  7 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
    |            |        |      |             |         |  8 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
    |            |        |      |             |         |  9 | 2021-01-15 |       1 | Abigail |      43554 | 12000000 | Transfer
    |            |        |      |             |         | 10 | 2021-02-01 |       3 | Jhon    |      43456 | 12000000 | Cheque
    |            |        |      |             |         | 11 | 2021-02-01 |       2 | Walter  |      54321 |  2000000 | Efectivo
    |            |        |      |             |         | 12 | 2021-03-15 |       3 | Sarah   |      54322 |  1200000 | Tarjeta
    |            |        |      |             |         | 13 | 2021-04-05 |       4 | Jessica |      54323 |  5000000 | Débito
    |            |        |      |             |         | 14 | 2021-05-25 |       5 | Luis    |      54324 | 10500000 | Transfer
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |            |         |         |            |          | 
  8 | Fiat       | Mobi   | 2017 | Blanco      |  280000 |    |            |         |         |            |          | 
  6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |            |         |         |            |          | 
  9 | Suzuki     | Swift  | 2019 | Gris oxford | 6200000 |    |            |         |         |            |          | 
  7 | Volkswagen | Gol    | 2015 | Azul marino | 3500000 |    |            |         |         |            |          | 
(19 rows)