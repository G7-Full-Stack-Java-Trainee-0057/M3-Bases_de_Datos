Hay 3 entidades: 
    - clientes
    - productos
    - compra

Donde la entidad de compra se genera debido a la relacion que tenia cliente con producto, al ser una relación n:n, se genera
una nueva entidad, la cual tendrá como atributos ambos id (llaves primarias en sus tablas, pero que acá pasan a ser foraneas), 
tanto el del cliente como el de productos, además de que le agregué una cantidad del producto comprado.

# Tablas y Restricciones para el Sistema de Registro de Clientes y Productos

## Tabla de Clientes

| Campo        | Tipo     | Restricciones  |
|--------------|----------|----------------|
| ID_Cliente   | Entero   | Clave primaria |
| Nombre       | Cadena   | No nulo        |
| Apellido     | Cadena   | No nulo        |
| DNI          | Cadena   | Único, no nulo |
| Dirección    | Cadena   | No nulo        |

## Tabla de Productos

| Campo          | Tipo       | Restricciones  |
|----------------|------------|----------------|
| ID_Producto    | Entero     | Clave primaria |
| Nombre         | Cadena     | No nulo        |
| Descripción    | Cadena     | No nulo        |
| Precio         | Decimal    | No nulo, positivo |

## Tabla Intermedia - Compra

| Campo            | Tipo       | Restricciones         |
|------------------|------------|-----------------------|
| ID_Compra        | Entero     | Clave primaria        |
| ID_Cliente       | Entero     | Clave foránea (Clientes.ID_Cliente), no nulo |
| ID_Producto      | Entero     | Clave foránea (Productos.ID_Producto), no nulo |
| Fecha_Compra     | Fecha      | No nulo               |
| Cantidad         | Entero     | No nulo, positivo     |
| Total            | Decimal    | No nulo, positivo     |