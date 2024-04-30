--M3 D7 EJERCICIO GUIADO "mawashi_cars"--
--entrar a postgres ----
psql -U postgres

--CREATE DATA BASE "mawashi_cars"--

create database mawashi_cars;

--conectarse a la base de dato mawashi_cars--

\c mawashi_cars;

--crear la tabla de autos--
create table autos(id int primary key, marca varchar(25), modelo
varchar(25), año varchar(25), color varchar(25), precio float);

●-- Paso 4: Creamos la tabla de ventas.--

create table ventas(id serial unique not null, fecha varchar(20),
id_auto int, cliente varchar(25), referencia int, cantidad float,
metodo_pago varchar(10), foreign key (id_auto) references autos(id));

SELECT * FROM autos;
 id | marca | modelo | año | color | precio
----+-------+--------+-----+-------+--------
(0 rows)

SELECT * FROM ventas;
 id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
----+-------+---------+---------+------------+----------+-------------
(0 rows)

--● Paso 5: Insertamos 3 registros en la tabla autos.--

insert into autos (id, marca, modelo, año, color, precio) values (1,
'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000);
insert into autos (id, marca, modelo, año, color, precio) values (2,
'Mazda', 'Mazda 3', '2000', 'Azul',2000000);
insert into autos (id, marca, modelo, año, color, precio) values (3,
'Chevrolet', 'Spark', '1998', 'Verde Oscuro', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (4,
'Nissan', 'Versa', 2018, 'Gris Plata', 5000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (5,
'Hyundai', 'Accent', 2022, 'Rojo', 10500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (6,
'Kia', 'Rio', 2020, 'Negro', 8000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (7,
'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (8,
'Fiat', 'Mobi', 2017, 'Blanco', 2800000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (9,
'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (10,
'Peugeot', '208', 2021, 'Rojo', 9800000);

SELECT * from autos;

 id |   marca    |    modelo     | año  |    color     |  precio
----+------------+---------------+------+--------------+----------
  1 | Toyota     | Corolla Araya | 1991 | Blanco       |  1200000
  2 | Mazda      | Mazda 3       | 2000 | Azul         |  2000000
  3 | Chevrolet  | Spark         | 1998 | Verde Oscuro |  1200000
  4 | Nissan     | Versa         | 2018 | Gris Plata   |  5000000
  5 | Hyundai    | Accent        | 2022 | Rojo         | 10500000
  6 | Kia        | Rio           | 2020 | Negro        |  8000000
  7 | Volkswagen | Gol           | 2015 | Azul Marino  |  3500000
  8 | Fiat       | Mobi          | 2017 | Blanco       |  2800000
  9 | Suzuki     | Swift         | 2019 | Gris Oxford  |  6200000
 10 | Peugeot    | 208           | 2021 | Rojo         |  9800000
(10 rows)

--● Paso 6: Insertamos algunas ventas.--
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-10-15', 1, 'Chuck', 43224, 12000000,
'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-11-15', 1, 'Donnie', 43334, 12000000,
'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2020-12-15', 3, 'Jet', 43444, 12000000, 'Cheque');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-01-05', 1, 'Peter', 43335, 12000000,
'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-01-15', 1, 'Abigail', 43554, 12000000,
'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago) values('2021-02-01', 3, 'Jhon', 43456, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago)
VALUES ('2021-02-01', 2, 'Walter', 54321, 2000000, 'Efectivo');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago)
VALUES ('2021-03-15', 3, 'Sarah', 54322, 1200000, 'Tarjeta');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago)
VALUES ('2021-04-05', 4, 'Jessica', 54323, 5000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad,
metodo_pago)
VALUES ('2021-05-25', 5, 'Luis', 54324, 10500000, 'Transfer');

SELECT * FROM ventas;
 id |   fecha    | id_auto | cliente | referencia | cantidad | metodo_pago
----+------------+---------+---------+------------+----------+-------------
  1 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
  2 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
  3 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
  4 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
  5 | 2021-01-15 |       1 | Abigail |      43554 | 12000000 | Transfer
  6 | 2021-02-01 |       3 | Jhon    |      43456 | 12000000 | Cheque
  7 | 2021-02-01 |       2 | Walter  |      54321 |  2000000 | Efectivo
  8 | 2021-03-15 |       3 | Sarah   |      54322 |  1200000 | Tarjeta
  9 | 2021-04-05 |       4 | Jessica |      54323 |  5000000 | Débito
 10 | 2021-05-25 |       5 | Luis    |      54324 | 10500000 | Transfer
(10 rows)

--● Paso 7: Obtenemos un reporte con el nombre de los clientes registrados en la tabla
--venta, junto con la marca y el modelo del auto asociado a la venta realizada.--

SELECT cliente, marca, modelo FROM ventas INNER JOIN autos ON
ventas.id_auto=autos.id;

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
(10 rows)

--Ejercicio propuesto 1
--La empresa Mawashi Cars ha notado que aproximadamente un 30% de sus autos no se han
--vendido y está considerando la posibilidad de negociar un convenio con una compañía
--aliada con estos vehículos, pero necesitará una tabla que muestre los autos que no han sido
--vendidos.
--Realizar la consulta necesaria para obtener todos los autos cuyos id no se encuentran en la
--tabla Ventas.--

-- SELECT * FROM ventas;
 id |   fecha    | id_auto | cliente | referencia | cantidad | metodo_pago
----+------------+---------+---------+------------+----------+-------------
  1 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
  2 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
  3 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
  4 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
  5 | 2021-01-15 |       1 | Abigail |      43554 | 12000000 | Transfer
  6 | 2021-02-01 |       3 | Jhon    |      43456 | 12000000 | Cheque
  7 | 2021-02-01 |       2 | Walter  |      54321 |  2000000 | Efectivo
  8 | 2021-03-15 |       3 | Sarah   |      54322 |  1200000 | Tarjeta
  9 | 2021-04-05 |       4 | Jessica |      54323 |  5000000 | Débito
 10 | 2021-05-25 |       5 | Luis    |      54324 | 10500000 | Transfer
(10 rows)


SELECT * from autos;

 id |   marca    |    modelo     | año  |    color     |  precio
----+------------+---------------+------+--------------+----------
  1 | Toyota     | Corolla Araya | 1991 | Blanco       |  1200000
  2 | Mazda      | Mazda 3       | 2000 | Azul         |  2000000
  3 | Chevrolet  | Spark         | 1998 | Verde Oscuro |  1200000
  4 | Nissan     | Versa         | 2018 | Gris Plata   |  5000000
  7 | Volkswagen | Gol           | 2015 | Azul Marino  |  3500000
  8 | Fiat       | Mobi          | 2017 | Blanco       |  2800000
  9 | Suzuki     | Swift         | 2019 | Gris Oxford  |  6200000
 10 | Peugeot    | 208           | 2021 | Rojo         |  9800000
(10 rows)

SELECT * FROM autos LEFT JOIN ventas ON autos.id = ventas.id_auto WHERE ventas.id_auto IS NULL;

 id |   marca    | modelo | año  |    color    | precio  | id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
----+------------+--------+------+-------------+---------+----+-------+---------+---------+------------+----------+-------------
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |       |         |         |            |          |
  8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000 |    |       |         |         |            |          |
  6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |       |         |         |            |          |
  9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000 |    |       |         |         |            |          |
  7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000 |    |       |         |         |            |          |
(5 rows)

--Ejercicio propuesto 2
--El dueño de la empresa Mawashi Cars se dio cuenta que para facilitar el proceso de
--auditoría, sería beneficioso saber los registros que no tienen relación entre ambas tablas
--para hacer el cruce con la información cedida anteriormente y terminar la auditoría.
--Realizar la sentencia SQL necesaria para satisfacer este requerimiento.--

SELECT * FROM autos FULL OUTER JOIN ventas on ventas.id_auto=autos.id
WHERE autos.id is null or ventas.id_auto is null;

 id |   marca    | modelo | año  |    color    | precio  | id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago     
----+------------+--------+------+-------------+---------+----+-------+---------+---------+------------+----------+-------------    
 10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |       |         |         |            |          |
  8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000 |    |       |         |         |            |          |
  6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |       |         |         |            |          |
  9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000 |    |       |         |         |            |          |
  7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000 |    |       |         |         |            |          |
(5 rows)

