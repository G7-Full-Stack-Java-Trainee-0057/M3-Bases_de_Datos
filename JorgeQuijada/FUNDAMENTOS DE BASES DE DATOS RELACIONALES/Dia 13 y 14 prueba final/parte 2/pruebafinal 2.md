# Tabla preguntas

| Atributo           | Tipo          | Restricciones     |
|--------------------|---------------|-------------------|
| id_pregunta        | INT           | PRIMARY KEY       |
| pregunta           | VARCHAR(255)  | NOT NULL          | 
| respuesta_correcta | VARCHAR       | NOT NULL          |

- **id_pregunta :** identificador unico tabla "preguntas".
- **pregunta :** pregunta a realizar a los usuarios.
- **respuesta_correcta :** respuesta correcta a la pregunta realizada.

# Tabla usuarios

| Atributo        | Tipo          | Restricciones     |
|-----------------|---------------|-------------------|
| id_usuario      | INT           | PRIMARY KEY       |
| nombre          | VARCHAR(255)  | NOT NULL          | 
| edad            | INT           | NOT NULL          |

- **id_usuario :** identificador unico tabla "usuarios".
- **nombre :** nombre del usuario.
- **edad :** edad del usuario.

# Tabla Respuestas

| Atributo        | Tipo          | Restricciones     |
|-----------------|---------------|-------------------|
| id_respuestas   | INT           | PRIMARY KEY       |
| respuesta       | VARCHAR(255)  |                   | 
| usuario_id      | INT           | FOREIGN KEY       |
| pregunta_id     | INT           | FOREIGN KEY       |

- **id_respuestas :** identificador unico tabla "respuestas".
- **respuesta :** respuesta entregada por parte del usuario.
- **usuario_id :** llave foranea que hace referencia a la tabla "usuarios".
- **pregunta_id :** llave foranea que hace referencia a la tabla "preguntas".

## Relaciones :
- Una pregunta puede tener una o mas respuestas.
- Un usuario puede generar una o mas respuestas.
- Las respuestas pueden ser tanto correctas como incorrectas.