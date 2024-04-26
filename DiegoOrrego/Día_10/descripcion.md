# Modelo Entidad-Relación: Actores y Películas

## Actores
- actor_id (PRIMARY KEY, NOT NULL)
- nombre (NOT NULL)

## Películas
- pelicula_id (PRIMARY KEY, NOT NULL)
- nombre (NOT NULL)
- género (NOT NULL)

## Participación (entidad de relación)
- actor_id (FOREIGN KEY que referencia actor, NOT NULL)
- pelicula_id (FOREIGN KEY que referencia película, NOT NULL)
