Contexto del caso.
Una empresa vende productos a varios clientes, luego de una breve conversación con el representante de la empresa, se concluye que se necesita conocer los datos
personales de los clientes (nombre, apellido, dni y dirección) y llevar el registro de los productos, no obstante fue lo único que se rescató de la reunión por el tiempo acotado que se tuvo para el levantamiento de requerimientos. De cualquier manera ya tenemos algunos datos para proceder con la ejecución de los pasos para el diagrama del modelo conceptual.

En primera instancia se identica las entidades que son:
"Cliente"
"Producto"
En segunda intancia se identifican los atributos de la entidad "Cliente".
"Id_cliente"
"DNI"
"Nombre"
"Apellido"
"Direccion"
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    dni INT UNIQUE,
    nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(200) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE
dia10=# SELECT * FROM cliente;
 id_cliente | dni | nombre | apellido | direccion
------------+-----+--------+----------+-----------
(0 rows)

En tercera instancia se identifican los atributos de la entidad "Producto".
"Id_producto"
"Codigo"
CREATE TABLE producto (
    id_producto INT UNIQUE,
    codigo INT UNIQUE NOT NULL
);

REATE TABLE
dia10=# SELECT * FROM producto;
 id_producto | codigo
-------------+--------
(0 rows)

Un modelo N a N no se puede implementar directamente en una base de datos relacional, pero haciendo una pequeña modificación se pueden implementar fácilmente.
La solución consiste en crear una tabla intermedia.

En cuarta instancia se crea la entidad intermedia "Compra", se relaciona la entidad "Cliente" con la entidad "Producto".
En quinta instancia se identifcan los atributos de la entidad intermedia "Compra".
"Id_cliente"
"Id_producto"
CREATE TABLE compra (
    id_cliente INT UNIQUE NOT NULL,
    id_producto INT UNIQUE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente), 
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE
dia10=# SELECT * FROM compra;
 id_cliente | id_producto
------------+-------------
(0 rows)
