Hay 3 entidades: 
    - clientes
    - productos
    - compra

Donde la entidad de compra se genera debido a la relacion que tenia cliente con producto, al ser una relación n:n, se genera
una nueva entidad, la cual tendrá como atributos ambos id (llaves primarias en sus tablas, pero que acá pasan a ser foraneas), 
tanto el del cliente como el de productos, además de que le agregué una cantidad del producto comprado.

