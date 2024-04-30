describe el modelo entidad-relación donde participan las entidades:

1.Cliente (DNI, Nombre, Apellido, Dirección)
2.Compra (Cliente_id, Producto_id)
3.Producto (Codigo)

Clienta hace alusión al comprador
Compra es la accion que realiza el cliente al obtener un producto
Producto es el o los productos que se venden y que posteriormente el cliente realizara la compra de este

Relación:
-Un cliente realiza la compra de 1 o mas producto
-Los productos comprados pueden ser de 1 o mas
-Tanto Producto como Cliente llegan a la conclusión de compra
-La compra de un producto puede ser realizada por 1 o mas clientes
