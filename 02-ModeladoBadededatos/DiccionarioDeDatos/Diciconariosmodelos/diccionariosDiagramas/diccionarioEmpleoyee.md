# 📘 Diccionario de Datos – Empleados
## Tabla: Employee
| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a          | Descripción                                  |
|-------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|----------------------------------------------|
| `snn`             | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                      | Número de Seguro Social (identificador único)|
| `firstname`       | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras                              | -                      | Primer nombre del empleado                   |
| `lastname`        | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras                              | -                      | Apellido del empleado                        |
| `address`         | INT          | -      | ❌  | ❌  | ❌   | ❌     | > 0                                      | -                      | ID de dirección (relacionado con tabla Dirección)|
| `birthdate`       | DATE         | -      | ❌  | ❌  | ❌   | ❌     | Edad >= 18                               | -                      | Fecha de nacimiento                          |
| `salary`          | MONEY        | -      | ❌  | ❌  | ❌   | ❌     | > 0                                      | -                      | Salario del empleado                         |
| `sex`             | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | 'M' o 'F'                                | -                      | Género                                       |
| `numberdeptoFK`   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Department(numberdept) | Departamento asignado                        |
| `supervisorFK`    | INT          | -      | ❌  | ✅  | ✅   | ❌     | > 0                                      | Employee(snn)          | Supervisor del empleado                      |

## Tabla: Department
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `numberdept`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único del departamento         |
| `namedept`     | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Nombre del departamento                      |
| `ssnFK`        | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Employee(snn)     | Gerente del departamento                     |
| `startdate`    | DATE         | -      | ❌  | ❌  | ❌   | ❌     | <= GETDATE()                             | -                 | Fecha de inicio de gerencia                  |

## Tabla: Department_Location
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a          | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|----------------------------------------------|
| `numberdeptFK` | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Department(numberdept) | Departamento relacionado                     |
| `location`     | NVARCHAR     | 30     | ✅  | ❌  | ❌   | ❌     | -                                        | -                      | Ubicación física del departamento            |

## Tabla: Work_On
| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a          | Descripción                                  |
|-------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|----------------------------------------------|
| `ssnFK`           | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Employee(snn)          | Empleado asignado al proyecto                |
| `numberprojectFK` | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Project(NumberProject) | Proyecto asignado                            |
| `hours`           | INT          | -      | ❌  | ❌  | ❌   | ❌     | BETWEEN 1 AND 60                         | -                      | Horas trabajadas por semana                  |

## Tabla: Dependent
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a     | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------|----------------------------------------------|
| `ssnFK`        | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                                      | Employee(snn)    | Empleado responsable                         |
| `name`         | NVARCHAR     | 50     | ✅  | ❌  | ❌   | ❌     | -                                        | -                | Nombre del dependiente                       |
| `relationship` | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | En ('Hijo', 'Cónyuge', 'Padre', 'Otro') | -                | Relación con el empleado                     |
| `sex`          | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | 'M' o 'F'                                | -                | Género                                       |
| `birthdate`    | DATE         | -      | ❌  | ❌  | ❌   | ❌     | <= DATEADD(YEAR, -1, GETDATE())          | -                | Fecha de nacimiento                          |

## Tabla: Project
| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a          | Descripción                                  |
|-------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|----------------------------------------------|
| `NumberProject`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                      | Identificador único del proyecto             |
| `name`            | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | -                                        | -                      | Nombre del proyecto                          |
| `location`        | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | -                                        | -                      | Ubicación del proyecto                       |
| `numberdeptFK`    | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Department(numberdept) | Departamento responsable del proyecto        |