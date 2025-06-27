# 📘 Diccionario de Datos – Prestamo de libros

## Tabla: Lector
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|-------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `numlector` | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del lector               |
| `nummateria`| INT          | -      | ❌  | ❌  | ❌   | ❌     | > 0                                      | -            | Materia/área de interés del lector           |
| `nombrep`   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Nombre del lector                            |
| `ap1`       | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer apellido del lector                   |
| `ap2`       | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | Solo letras y espacios (opcional)        | -            | Segundo apellido del lector (opcional)       |

## Tabla: Libro
| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `numlibro`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único del libro                |
| `isbn`       | INT          | -      | ❌  | ❌  | ❌   | ✅     | Único, 13 dígitos                        | -                 | Código ISBN del libro                        |
| `titulo`     | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Título completo del libro                    |
| `numlectorFK`| INT          | -      | ❌  | ✅  | ✅   | ❌     | > 0                                      | Lector(numlector) | Lector que tiene prestado el libro           |

## Tabla: Presta
| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `Numlibro`       | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Libro(numlibro)   | Libro prestado                               |
| `numlector`      | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Lector(numlector) | Lector que recibe el préstamo                |
| `fechadeprestamo`| DATE         | -      | ❌  | ❌  | ❌   | ❌     | <= GETDATE()                             | -                 | Fecha en que se realizó el préstamo          |