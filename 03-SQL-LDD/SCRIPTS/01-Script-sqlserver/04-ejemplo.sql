-- CREAR BD
CREATE DATABASE bdmorgan;
GO

USE bdmorgan;
GO

CREATE TABLE empleado(
idempleado int not null identity(1,1),
nombre varchar(50) not null,
ap1 varchar(50) not null,
ap2 varchar(50),
edad int not null,
estatus char(1) not null default 'A',
iddepto int not null
);
GO

-- Crear tabla departamentos
CREATE TABLE departamentos(
iddepart int not null identity(1,1),
nombredepto varchar(20) not null,
idempleado int not null,
constraint pk_depto
Primary key (iddepart)
);
GO

--aletes
ALTER TABLE empleado
ADD jef int null;
GO

-- RESTRICIOENS
ALTER TABLE empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY (idempleado);
GO

ALTER TABLE empleado
ADD CONSTRAINT chk_edad
check(edad between 18 and 60);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_empljefe
FOREIGN KEY (jef)
REFERENCES empleado(idempleado);
GO