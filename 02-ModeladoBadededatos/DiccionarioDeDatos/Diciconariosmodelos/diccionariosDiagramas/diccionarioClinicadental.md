# Diccionario de Datos del Consultorio Odontológico

Este documento describe la estructura de las tablas y sus campos en la base de datos del sistema de gestión de un consultorio odontológico.

## Tabla: PACIENTE
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idpaciente` | VARCHAR | 50 | ✅ | ❌ | ❌ | ✅ | - | - | ID único del paciente |
| `nombre` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Nombre completo del paciente |
| `ap1` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Primer apellido del paciente |
| `ap2` | VARCHAR | 20 | ❌ | ❌ | ✅ | ❌ | - | - | Segundo apellido del paciente (opcional) |
| `correo` | VARCHAR | 20 | ❌ | ❌ | ✅ | ✅ | Formato de email válido | - | Correo electrónico del paciente |
| `telefono` | VARCHAR | 10 | ❌ | ❌ | ❌ | ❌ | Solo números | - | Teléfono de contacto del paciente |
| `direccion` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Dirección principal del paciente |
| `colonia` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Colonia del domicilio del paciente |
| `calle` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Calle del domicilio del paciente |
| `numcalle` | INT | - | ❌ | ❌ | ❌ | ❌ | > 0 | - | Número de calle del domicilio del paciente |

## Tabla: ODONTOLOGO
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idodontolog` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del odontólogo |
| `cedula` | INT | - | ❌ | ❌ | ❌ | ✅ | > 0 | - | Número de cédula profesional del odontólogo |
| `nom` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Nombre del odontólogo |
| `ap1` | VARCHAR | 20 | ❌ | ❌ | ❌ | ❌ | - | - | Primer apellido del odontólogo |
| `ap2` | VARCHAR | 20 | ❌ | ❌ | ✅ | ❌ | - | - | Segundo apellido del odontólogo (opcional) |

## Tabla: CONSULTORIO
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idconsultorio` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del consultorio |
| `ubicacion` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Ubicación física del consultorio |
| `piso` | INT | - | ❌ | ❌ | ❌ | ❌ | > 0 | - | Número de piso donde se encuentra el consultorio |
| `numero` | INT | - | ❌ | ❌ | ❌ | ❌ | > 0 | - | Número de consultorio |

## Tabla: TRATAMIENTO
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idtratamiento` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del tratamiento |
| `status` | BOOLEAN | - | ❌ | ❌ | ❌ | ❌ | - | - | Estado del tratamiento (activo/inactivo) |
| `nombre` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Nombre del tratamiento |
| `estado` | BOOLEAN | - | ❌ | ❌ | ❌ | ❌ | - | - | Indica si el tratamiento está activo o inactivo (redundante con status, se podría consolidar) |
| `monto` | MONEY | - | ❌ | ❌ | ❌ | ❌ | > 0 | - | Costo del tratamiento |
| `duracion` | DATE | - | ❌ | ❌ | ❌ | ❌ | - | - | Duración estimada del tratamiento |

## Tabla: CITA
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idcita` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la cita |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | >= CURRENT_DATE | - | Fecha de la cita |
| `motivo` | VARCHAR | - | ❌ | ❌ | ❌ | ❌ | - | - | Motivo de la cita |
| `estado` | VARCHAR | - | ❌ | ❌ | ❌ | ❌ | - | - | Estado de la cita (ej. programada, completada, cancelada) |
| `nom` | VARCHAR | - | ❌ | ❌ | ❌ | ❌ | - | - | Nombre del paciente (esto parece un error, debería ser FK a PACIENTE) |
| `epi` | VARCHAR | - | ❌ | ❌ | ❌ | ❌ | - | - | Apellido del paciente (esto parece un error, debería ser FK a PACIENTE) |
| `hora` | TIME | - | ❌ | ❌ | ❌ | ❌ | - | - | Hora de la cita |

## Tabla: FACTURA
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idfactura` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la factura |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | <= CURRENT_DATE | - | Fecha de emisión de la factura |
| `monto` | MONEY | - | ❌ | ❌ | ❌ | ❌ | > 0 | - | Monto total de la factura |
| `estado` | BOOLEAN | - | ❌ | ❌ | ❌ | ❌ | - | - | Estado de pago de la factura (pagado/pendiente) |

## Tabla: HISTORIA
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idhistoria` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del historial clínico |
| `idimagenFK` | INT | - | ❌ | ✅ | ❌ | ✅ | > 0 | IMAGEN(idimagen) | ID de la imagen asociada al historial |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | <= CURRENT_DATE | - | Fecha del registro en el historial |
| `diagnostico` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Diagnóstico registrado en el historial |
| `observaciones` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Observaciones adicionales en el historial |

## Tabla: IMAGEN
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idimagen` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la imagen |
| `ruta` | VARCHAR | 50 | ❌ | ❌ | ❌ | ❌ | - | - | Ruta o URL de la imagen |
| `tipo` | VARCHAR | 50 | ❌ | ❌ | ❌ | ❌ | - | - | Tipo de imagen (ej. radiografía, fotografía) |

## Tabla: APLICACIONTRATAMIENTO
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idaplicacion` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la aplicación de tratamiento |
| `observaciones` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Observaciones sobre la aplicación del tratamiento |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | <= CURRENT_DATE | - | Fecha de la aplicación del tratamiento |
| `idpaciente` | INT | - | ❌ | ✅ | ❌ | ❌ | > 0 | PACIENTE(idpaciente) | ID del paciente al que se aplica el tratamiento |
| `idodontologFK` | INT | - | ❌ | ✅ | ❌ | ❌ | > 0 | ODONTOLOGO(idodontolog) | ID del odontólogo que aplica el tratamiento |

## Tabla: PAGO
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idpago` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del pago |
| `idfacturaFK` | INT | - | ❌ | ✅ | ❌ | ✅ | > 0 | FACTURA(idfactura) | ID de la factura asociada al pago |

## Tabla: SESION
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idsesion` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la sesión |
| `idcitaFK` | INT | - | ❌ | ✅ | ❌ | ✅ | > 0 | CITA(idcita) | ID de la cita asociada a la sesión |
| `idaplicacionFK` | INT | - | ❌ | ✅ | ❌ | ✅ | > 0 | APLICACIONTRATAMIENTO(idaplicacion) | ID de la aplicación de tratamiento asociada a la sesión |

## Tabla: SESIONTRATAMIENT
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idsesion` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la sesión de tratamiento |
| `idtratamiento` | INT | - | ❌ | ✅ | ❌ | ❌ | > 0 | TRATAMIENTO(idtratamiento) | ID del tratamiento asociado a la sesión |
| `duracion` | VARCHAR | - | ❌ | ❌ | ❌ | ❌ | - | - | Duración de la sesión de tratamiento |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | <= CURRENT_DATE | - | Fecha de la sesión de tratamiento |

## Tabla: MATERIAL
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idmate` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único del material |
| `nombre` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Nombre del material |
| `marca` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Marca del material |
| `descripcion` | VARCHAR | 100 | ❌ | ❌ | ✅ | ❌ | - | - | Descripción del material (opcional) |
| `unidadmedida` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Unidad de medida del material (ej. gramos, mililitros) |
| `cantidad` | INT | - | ❌ | ❌ | ❌ | ❌ | >= 0 | - | Cantidad de material en inventario |

## Tabla: ESPECIALIDAD
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idespecialidad` | INT | - | ✅ | ❌ | ❌ | ✅ | > 0 | - | ID único de la especialidad |
| `nombre` | VARCHAR | 100 | ❌ | ❌ | ❌ | ✅ | - | - | Nombre de la especialidad |

## Tabla: USA (Relación entre ODONTOLOGO y CONSULTORIO)
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idconsultorio` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | CONSULTORIO(idconsultorio) | ID del consultorio |
| `idodontolog` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | ODONTOLOGO(idodontolog) | ID del odontólogo |
| `horario` | VARCHAR | 100 | ❌ | ❌ | ❌ | ❌ | - | - | Horario en el que el odontólogo usa el consultorio |
| `fecha` | DATE | - | ❌ | ❌ | ❌ | ❌ | <= CURRENT_DATE | - | Fecha de asignación del horario |

## Tabla: TIENE (Relación entre ODONTOLOGO y ESPECIALIDAD)
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idespecialidad` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | ESPECIALIDAD(idespecialidad) | ID de la especialidad |
| `idodontolog` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | ODONTOLOGO(idodontolog) | ID del odontólogo |

## Tabla: NECESITA (Relación entre TRATAMIENTO y MATERIAL)
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idtratamiento` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | TRATAMIENTO(idtratamiento) | ID del tratamiento |
| `idmaterial` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | MATERIAL(idmate) | ID del material |

## Tabla: ESTA (Relación entre PACIENTE y HISTORIA)
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idhistoriaFK` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | HISTORIA(idhistoria) | ID del historial clínico |
| `idaplicacionFK` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | APLICACIONTRATAMIENTO(idaplicacion) | ID de la aplicación de tratamiento |

## Tabla: UTILIZA (Relación entre MATERIAL y SESION)
| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---|---|---|---|---|---|---|---|---|---|
| `idmateFK` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | MATERIAL(idmate) | ID del material utilizado |
| `idsesionFK` | INT | - | ✅ | ✅ | ❌ | ❌ | > 0 | SESION(idsesion) | ID de la sesión donde se utiliza el material |