# Tipos de datos en SQLSERVER










| Tipo de Dato   | Almacenamiento | Rango o Precisión                          | Uso Típico                          |
|----------------|----------------|--------------------------------------------|-------------------------------------|
| **Enteros**    |                |                                            |                                     |
| `TINYINT`      | 1 byte         | 0 a 255                                    | Edades, porcentajes                |
| `SMALLINT`     | 2 bytes        | -32,768 a 32,767                           | Cantidades medias                   |
| `INT`          | 4 bytes        | -2,147,483,648 a 2,147,483,647            | IDs, contadores                     |
| `BIGINT`       | 8 bytes        | ±9.22e18                                   | Sistemas legacy                     |
| **Decimales**  |                |                                            |                                     |
| `DECIMAL(p,s)` | 5-17 bytes     | Precisión exacta (p=1-38, s=0-p)           | Dinero, cálculos precisos           |
| `NUMERIC`      | = DECIMAL      | = DECIMAL                                  | = DECIMAL                           |
| `MONEY`        | 8 bytes        | ±922,337,203,685,477.5808                  | Transacciones financieras           |
| `SMALLMONEY`   | 4 bytes        | ±214,748.3647                              | Precios pequeños                    |
| **Aproximados**|                |                                            |                                     |
| `FLOAT(n)`     | 4 u 8 bytes    | ±1.79E+308 (n=53)                          | Científicos                         |
| `REAL`         | 4 bytes        | ±3.40E+38                                  | Datos científicos rápidos           |
| `BIT`          | 1 bit/row      | 0, 1, NULL                                 | Flags booleanos                     |

| Tipo de Dato        | Almacenamiento | Rango o Precisión                   | Uso Típico                     |
|---------------------|----------------|-------------------------------------|--------------------------------|
| `DATE`             | 3 bytes        | 0001-01-01 a 9999-12-31            | Fechas puras                   |
| `TIME(n)`          | 3-5 bytes      | 00:00:00.0000000 a 23:59:59.9999999| Horarios                       |
| `DATETIME`         | 8 bytes        | 1753-01-01 a 9999-12-31 (3.33ms)   | Registros históricos           |
| `DATETIME2(n)`     | 6-8 bytes      | 0001-01-01 a 9999-12-31 (100ns)    | Auditorías                     |
| `SMALLDATETIME`    | 4 bytes        | 1900-01-01 a 2079-06-06 (1 min)    | Alarmas simples                |
| `DATETIMEOFFSET`   | 10 bytes       | Igual DATETIME2 + zona horaria      | Sistemas globales              |

| Tipo de Dato      | Almacenamiento         | Máximo/Mínimo               | Uso Típico                     |
|-------------------|------------------------|-----------------------------|--------------------------------|
| **No Unicode**    |                        |                             |                                |
| `CHAR(n)`        | n bytes (fijo)         | 1-8,000 chars               | Códigos fijos                 |
| `VARCHAR(n)`     | longitud + bytes       | 1-8,000 chars               | Nombres, descripciones        |
| `VARCHAR(MAX)`   | longitud + 2 bytes     | hasta 2GB                   | Documentos largos             |
| **Unicode**      |                        |                             |                                |
| `NCHAR(n)`       | 2n bytes (fijo)        | 1-4,000 chars               | Textos internacionales        |
| `NVARCHAR(n)`    | longitud x2 + bytes    | 1-4,000 chars               | Nombres globales              |
| `NVARCHAR(MAX)`  | longitud x2 + 2 bytes  | hasta 2GB                   | Contenido multilingüe         |
| **Binarios**     |                        |                             |                                |
| `BINARY(n)`      | n bytes (fijo)         | 1-8,000 bytes               | Hashes                        |
| `VARBINARY(n)`   | longitud + bytes       | 1-8,000 bytes               | Archivos pequeños             |
| `VARBINARY(MAX)` | longitud + 2 bytes     | hasta 2GB                   | Imágenes, PDFs                |

| Tipo de Dato         | Almacenamiento | Descripción                          | Uso Típico                     |
|----------------------|----------------|--------------------------------------|--------------------------------|
| `UNIQUEIDENTIFIER`  | 16 bytes       | GUID                                 | Claves únicas globales         |
| `XML`               | hasta 2GB      | Datos XML validados                  | Configuraciones                |
| `JSON`              | hasta 2GB      | Documentos JSON                      | APIs modernas                  |
| `GEOMETRY`          | variable       | Datos espaciales 2D                  | Mapas                          |
| `GEOGRAPHY`         | variable       | Datos geográficos                    | Sistemas GPS                   |
| `HIERARCHYID`       | variable       | Representa jerarquías                | Organigramas                   |
| `SQL_VARIANT`       | hasta 8,016 B  | Almacena cualquier tipo (evitar)     | Casos muy específicos          |

🔹 **Para dinero**: `DECIMAL(19,4)` o `MONEY`  
🔹 **Para globalización**: `NVARCHAR` (Unicode)  
🔹 **Para fechas modernas**: `DATETIME2` (>SQL 2008)  
🔹 **Para archivos**: `VARBINARY(MAX)`  
🔹 **Para máxima compatibilidad**: Evitar `TEXT`/`NTEXT`/`IMAGE` (obsoletos)