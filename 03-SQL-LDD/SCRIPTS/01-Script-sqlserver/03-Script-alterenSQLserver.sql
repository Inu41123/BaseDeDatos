--CREAR BASE DE DATOS
CREATE DATABASE empresacucha;
GO

-- UTILIZAR LA BASE DE DATOS
USE empresacucha;
GO

--CREAR TABLA EMPLEADOS
CREATE TABLE empleados(
idempleado INT not null IDENTITY(1,1),
Nombre NVARCHAR(100) not null,
Puesto NVARCHAR(20),
FechaIngreso DATE,
Salario decimal(10,2),
CONSTRAINT pk_empleado
PRIMARY KEY (IdEmpleado),
);
GO

-- Crear la tabla departamentos
CREATE TABLE departamentos(
idDepto INT not null primary key,
NombreDepto VARCHAR(50)
);
GO

-- aGREGAR UNA Columna a la tabla de empleados
ALTER TABLE empleados
ADD CorreoElectronico NVARCHAR(50) null;
GO

-- MODIFICAR UN TIPO DE DAOT DE LA TABLA SALARIO DE LA TABLA EMPELADOS
ALTER TABLE empleados
ALTER COLUMN Salario money not null;
GO

/*
 RENOMBRAR UNA COLUMNA
 RENOMBRERA COLUMAN CORREO ELECTRONICO DE LA TABLA EMPLEADOS
 USAMOS UN STORE PROCIDIO
*/

EXECUTE sp_rename 
                'empleados.CorreoElectronico', 
				'Email', 
				'COLUMN';
GO

-- AGREGAR COLUMNA A EMPLEADOS PARA CLAVE FORANEA O FEREING KEY
ALTER TABLE empleados
ADD IdDepto int;
GO

/*
APLICAR LA RESTRICCION DE FOREING KEY
AGREGAR UN CONSTRAINT DE FOREING KEY
*/
ALTER TABLE empleados
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY (IdDepto)
REFERENCES departamentos(idDepto);
GO

-- AGREGAR UN CONSTRAINT al salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK(salario >= 100 and salario <= 10000);
GO

-- ADD ONE CONTRAINT UNIQUE AT THE NAME FOR DEPARTMENT
ALTER TABLE departamentos
ADD CONSTRAINT unique_nombredepto
UNIQUE (NombreDepto);
GO

-- Eliminar el contraint de foreign key
ALTER TABLE empleados
DROP CONSTRAINT fk_empleado_depto;
GO

-- ELIMINAR EL CONSTRINT UNICO
ALTER TABLE departamentos
DROP CONSTRAINT unique_nombredepto;
GO

-- Eliminar la primarykey de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleado;
GO

-- Eliminar la primary key de departamentos
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__F1B8249BCEEFB5FB;
GO


-- Eliminar las columnas
ALTER TABLE empleados
DROP COLUMN Email;
GO

-- Eliminar tabla
DROP TABLE departamentos;
GO

DROP TABLE empleados;
GO



SELECT * FROM departamentos;
GO

SELECT * FROM empleados;
GO