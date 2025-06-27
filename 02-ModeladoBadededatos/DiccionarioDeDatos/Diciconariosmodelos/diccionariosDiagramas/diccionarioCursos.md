# 📘 Diccionario de Datos – Sistema Citas

## Tabla: ALUMNO

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|-------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `numalumno` | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del alumno               |
| `nombre`    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Nombre del alumno                            |
| `ap1`       | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer apellido del alumno                   |
| `ap2`       | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | Solo letras y espacios (opcional)        | -            | Segundo apellido del alumno (opcional)       |

## Tabla: CURSO
| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `numcurso`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del curso                |
| `nombrecurso`| NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                        | -            | Nombre del curso                             |

## Tabla: PARTICIPAN
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `numalumnoFK`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | ALUMNO(numalumno) | Alumno que participa en el curso             |
| `numcursoFK`   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | CURSO(numcurso)   | Curso en el que participa el alumno          |
| `horas`        | TIME         | -      | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Hora de inicio del curso (HH:MM:SS)          |
| `fechacurso`   | DATE         | -      | ❌  | ❌  | ❌   | ❌     | Fecha actual o futura                    | -                 | Fecha de realización del curso               |

## Tabla: UBICACION
| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|-------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `ubicacionid`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único de ubicación             |
| `numcursoFK`      | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | CURSO(numcurso)   | Curso asociado a la ubicación                |
| `ubicacioncurso`  | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Lugar físico donde se imparte el curso       |