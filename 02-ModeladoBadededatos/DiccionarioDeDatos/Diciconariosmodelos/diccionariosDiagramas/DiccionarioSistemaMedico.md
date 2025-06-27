# 📘 Diccionario de Datos – Sistema Medico

## Tabla: Paciente

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `idpaciente`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del paciente             |
| `nombre`      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer nombre del paciente                   |
| `ap1`         | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer apellido del paciente                 |
| `ap2`         | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | Solo letras y espacios (opcional)        | -            | Segundo apellido del paciente (opcional)     |
| `especialidad`| NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | -                                        | -            | Especialidad médica requerida                |

## Tabla: Médico
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripción                                  |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|--------------|----------------------------------------------|
| `idmedico`    | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -            | Identificador único del médico               |
| `nombre`      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Primer nombre del médico                     |
| `apellido`    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Solo letras y espacios                   | -            | Apellido del médico                          |
| `especialidad`| NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                        | -            | Especialidad médica                          |
| `numcolegiado`| NVARCHAR     | 10     | ❌  | ❌  | ❌   | ✅     | -                                        | -            | Número de colegiado profesional              |

## Tabla: Cita
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `idcita`      | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único de cita                 |
| `fecha_hora`  | DATETIME     | -      | ❌  | ❌  | ❌   | ❌     | Fecha futura                             | -                 | Fecha y hora programada                     |
| `idpaciente`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Paciente(idpaciente)| Paciente atendido                         |
| `idmedico`    | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Médico(idmedico)  | Médico asignado                            |
| `estado`      | CHAR         | 1      | ❌  | ❌  | ❌   | ❌     | 'P' (Programada), 'C' (Completada)       | -                 | Estado de la cita                          |

## Tabla: Diagnóstico
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `iddiagnostico`| INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único                         |
| `idcita`       | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Cita(idcita)      | Cita relacionada                            |
| `descripcion`  | TEXT         | -      | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Descripción del diagnóstico                 |
| `tratamiento`  | TEXT         | -      | ❌  | ❌  | ✅   | ❌     | -                                        | -                 | Tratamiento recomendado                     |

## Tabla: Receta
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `idreceta`    | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único de receta               |
| `iddiagnostico`| INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Diagnóstico(iddiagnostico)| Diagnóstico relacionado          |
| `medicamento` | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Nombre del medicamento                      |
| `dosis`       | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Dosificación recomendada                    |
| `duracion`    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                        | -                 | Duración del tratamiento                     |

## Tabla: Historia_Clinica
| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a      | Descripción                                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------|----------------------------------------------|
| `idhistoria`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                      | -                 | Identificador único                         |
| `idpaciente`   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                      | Paciente(idpaciente)| Paciente relacionado                       |
| `fecha_creacion`| DATE         | -      | ❌  | ❌  | ❌   | ❌     | Fecha pasada o presente                  | -                 | Fecha de creación del registro              |
| `alergias`     | TEXT         | -      | ❌  | ❌  | ✅   | ❌     | -                                        | -                 | Alergias conocidas del paciente             |
| `antecedentes` | TEXT         | -      | ❌  | ❌  | ✅   | ❌     | -                                        | -                 | Antecedentes médicos relevantes             |