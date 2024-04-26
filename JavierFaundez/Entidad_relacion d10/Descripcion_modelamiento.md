## Descripción del modelamiento entregado

En este diagrama se pueden observar 3 entidades con sus respectivos atributos y relaciones.

###	La primera entidad es Cliente, el cual tiene como atributos:

### Cliente
| Atributo    | Tipo de dato | Restricción      |
|-------------|---------------|------------------|
| Cliente_ID  | INT           | PRIMARY KEY, UNIQUE, NOT NULL |
| DNI         | VARCHAR(15)   | UNIQUE, NOT NULL |
| Nombre      | VARCHAR(50)   | NOT NULL         |
| Apellido    | VARCHAR(50)   | NOT NULL         |
| Dirección   | VARCHAR(100)  | SIN RESTRICCION  |

###	La segunda entidad es Compra, esta entidad nace a raíz de que tenemos tipos de relaciones de muchos a muchos, por lo cual esta tabla será nuestro puente entre las entidades cliente y producto.

### Compra
| Atributo     | Tipo de dato | Restricción                  |
|--------------|---------------|------------------------------|
| Cliente_ID   | INT           | FOREIGN KEY, UNIQUE, NOT NULL|
| Producto_ID  | INT           | FOREIGN KEY, UNIQUE, NOT NULL|
| Cantidad     | FLOAT         | NOT NULL                     |


### La tercera entidad corresponde a Producto, la cual tiene como atributos:
### Producto
| Atributo     | Tipo de dato | Restricción                   |
|--------------|---------------|-------------------------------|
| Producto_ID  | INT           | PRIMARY KEY, UNIQUE, NOT NULL|
| Nombre       | VARCHAR(150)  | NOT NULL                      |
| Descripción  | VARCHAR(300)  | NO TIENE RESTRICCION          |
| Precio       | FLOAT         | NOT NULL                      |


### Relaciones
- La entidad intermedia "Compra" relaciona las entidades Cliente y Producto a través del ID.
- Entre Cliente y Compra hay una relación de 1:N, lo que significa que un cliente puede tener muchas compras.
- La relación entre Compra y Producto es N:1, lo que indica que un producto puede estar relacionado con muchas compras.
