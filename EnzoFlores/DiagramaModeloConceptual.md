####**CONTEXTO** 
Una empresa vende productos a varios clientes, luego de una breve conversación 
con el representante de la empresa, se concluye que se necesita conocer los datos
personales de los clientes (nombre, apellido, dni y dirección) y llevar el registro de
los productos, no obstante fue lo único que se rescató de la reunión por el tiempo
acotado que se tuvo para el levantamiento de requerimientos. De cualquier manera
ya tenemos algunos datos para proceder con la ejecución de los pasos para el
diagrama del modelo conceptual.
* Inicialmente se definen las entidades "Cliente" y "Producto", representados por un rectangulo en el diagrama.
* Luego, se definen los atributos de cliente, en este caso serán "DNI", "Nombre", "Apellido", "Dirección".Los atributos están representados por ovalos en el diagrama.
* A continuación, se define un atributo "código" dentro de la entidad Producto.
* Para poder implentar un modelo N a N (muchos a muchos) se crea una tabla intermedia llamada "Compra".
Esta entidad tiene los atributos "Cliente_ID" y "Producto_ID".
