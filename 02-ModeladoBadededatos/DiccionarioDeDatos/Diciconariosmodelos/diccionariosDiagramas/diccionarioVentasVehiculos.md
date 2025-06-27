# 📘 Diccionario de Datos – Renta Vehiculo

## Diccionario de Datos - Tabla: Sucursal

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numsucursal`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                        | -                                | Identificador de la sucursal               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅     | Solo letras A-Z, longitud >= 20             | -                                | Nombre completo de la sucursal             |
| `ubicacion`          | NVARCHAR          | 20     | ❌  | ❌  | ❌   | ✅     | Solo letras A-Z, longitud >= 20          | -                                | Ubicacion de la sucursal                        |


## Tabla Vehiculo

# 📘 Diccionario de Datos – Tabla: Vehicle

| Campo              | Tipo de Dato   | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK             | Referencia a           | Descripción                                 |
|--------------------|----------------|--------|-----|-----|------|--------|-----------------------------------|------------------------|---------------------------------------------|
| `Numdevehiculo`    | INT            | -      | ✅  | ❌  | ❌   | ✅     | > 0                               | -                      | Identificador único del vehículo            |
| `Placa`            | NVARCHAR       | 7      | ❌  | ❌  | ❌   | ✅     | Longitud exacta 7 caracteres      | -                      | Número de matrícula/licencia del vehículo   |
| `Marca`            | NVARCHAR       | 20     | ❌  | ❌  | ❌   | ❌     | -                                 | -                      | Fabricante del vehículo (ej. Toyota, Ford)  |
| `Modelo`           | NVARCHAR       | 20     | ❌  | ❌  | ❌   | ❌     | -                                 | -                      | Modelo específico (ej. Corolla, Mustang)    |
| `Anio`             | INT            | -      | ❌  | ❌  | ❌   | ❌     | > 1900                            | -                      | Año de fabricación del vehículo             |
| `NumclienteFK`     | INT            | -      | ❌  | ✅  | ❌   | ❌     | > 0                               | Cliente(Numcliente)    | Cliente dueño del vehículo                  |
| `NumsucursalFK`    | INT            | -      | ❌  | ✅  | ❌   | ❌     | > 0                               | Sucursal(Numsucursal)  | Sucursal asignada al vehículo               |



# 📘 Diccionario de Datos – Tabla: Cliente

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `Numcliente`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del cliente              |
| `Nombre`      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer nombre del cliente                    |
| `Apellido1`   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer apellido del cliente                  |
| `Apellido2`   | NVARCHAR     | 20     | ❌  | ❌  | ✅    | ❌     | Solo letras y espacios (opcional)        | -            | Segundo apellido del cliente (opcional)      |
| `Curb`        | CHAR         | 18     | ❌  | ❌  | ❌   | ✅     | Formato RFC o CURP válido                | -            | Clave única de identificación (RFC/CURP)     |
| `Telefono`    | NCHAR        | 12     | ❌  | ❌  | ❌   | ❌     | Solo dígitos, incluir código de área     | -            | Teléfono de contacto (formato fijo)          |
| `Calle`       | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                                        | -            | Nombre de la calle de la dirección           |
| `Numero`      | INT          | -      | ❌  | ❌  | ❌   | ❌     | > 0                                      | -            | Número exterior de la dirección              |
| `Ciudad`      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Ciudad de residencia del cliente             |

