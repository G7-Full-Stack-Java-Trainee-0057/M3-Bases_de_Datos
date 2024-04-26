En esta tabla tenemos tres entidades principales.
Cliente: Asumimos como cliente aquel que realiza una o muchas compras, por lo que se considera una entidad fuerte. Cliente posee atributos que lo caracterizan y diferencian de otros clientes:
    - DNI (VARCHAR) PRIMARY KEY UNIQUE NOT NULL: una identificación unica y considerada clave para identificar 
    -NOMBRE VARCHAR NOT NULL: otro metodo para identificar al cliente que no puede ser nulo ya que es importante para base de datos en la pagina web
    -APELLIDO VARCHAR: Puede ser nulo y es otro atributo que nos permite identificar a cliente
    -DIRECCION: Es sumamente importante para temas de envío.

  ## Tabla CLIENTE

| Atributos   | Tipo       | Restricciones                   |
|-------------|------------|---------------------------------|
| DNI         | VARCHAR(50)| UNIQUE, PRIMARY KEY, NOT NULL   |
| NOMBRE      | VARCHAR(50)| NOT NULL                        |
| APELLIDO    | VARCHAR(50)|                                 |
| DIRECCION   | VARCHAR(100)|                                |


COMPRA: la compra es el intermediario entre el cliente y el producto, sin cliente no hay compra y sin compra no hay producto cual vender, por lo que se considera una entidad fuerte. La compra tiene dos atributos importantes:
 -Id_cliente INT PRIMARY KEY UNIQUE NOT NULL: Este atributo nos permite identificar al cliente como individuo ya registrado en la tabla de CLIENTE, al cual luego asociar el producto comprado
 -producto_id INT PRIMARY KEY UNIQUE NOT NULL: Atributo asociado a un valor unico del producto que engloba las caractiristicas más importartes e identificadoras del productor que se vende.

## Tabla COMPRA

| Atributos    | Tipo   | Restricciones               |
|--------------|--------|-----------------------------|
| ID_CLIENTE   | INT    | PRIMARY KEY, UNIQUE, NOT NULL |
| ID_PRODUCTO  | INT    | PRIMARY KEY, UNIQUE, NOT NULL |


 PRODUCTO: El producto lo identificamos como lo que se vende basicamente, pueden haber muchos productos y cada uno poseer un atributo distinto por lo cual es necesario identificarlo y categorizarlo:
  
-CODIGO VARCHAR PRIMARY KEY NOT NULL: puede contener letras y numeros, es el atributo que identifica al producto
-PRECIO INT: Lo identificamos al valor asociado del producto
-CATEGORIA VARCHAR: Caracterisiticas agrupadas de un producto que nos permite identificarlo y clasificarlo
-STOCK INT: Numero de existencias de un producto

## Tabla PRODUCTO

| Atributos   | Tipo     | Restricciones               |
|-------------|----------|-----------------------------|
| CODIGO      | VARCHAR  | PRIMARY KEY, NOT NULL       |
| PRECIO      | INT      |                             |
| CATEGORIA   | VARCHAR  |                             |
| STOCK       | INT      |                             |


La relacion entre cada tabla es 
CLIENTE 1:N COMPRAS = Un cliente puede realizar muchas compras
COMPRAS 1:N PRODUCTOS = Una compra puede integra muchos productos
CLIENTE N:N PRODUCTOS = Muchos clientes pueden realizar muchas compras.