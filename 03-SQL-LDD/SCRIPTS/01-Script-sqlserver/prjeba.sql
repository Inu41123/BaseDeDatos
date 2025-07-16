-- primero se hacen las tablas 
CREATE DATABASE prueba1;
GO

USE prueba1;
GO

CREATE TABLE empleado(
    idempleado INT NOT NULL IDENTITY(1,1),
    nombre NVARCHAR(20) NOT NULL,
    ap1 NVARCHAR(50) NOT NULL, -- Aumentado a 50
    ap2 NVARCHAR(50),          -- Aumentado a 50
    salary DECIMAL(10,2) NOT NULL,
    jef INT,                   -- Modificado a NULL para permitir el jefe principal
    deptofk INT NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (idempleado),
    CONSTRAINT chk_salario CHECK (salary BETWEEN 500 AND 70000), -- Corrección aquí
    CONSTRAINT fk_empleado_emp FOREIGN KEY (jef) REFERENCES empleado(idempleado)
);
GO

CREATE TABLE departamento(
  iddepto int not null identity(1,1),
  nombredepto nvarchar(20) not null,
  jefe int not null,
  CONSTRAINT uq_nombre
  UNIQUE (nombredepto),
  CONSTRAINT pk_depto
  PRIMARY KEY(iddepto),
  CONSTRAINT fk_depto_empleado
  FOREIGN KEY (jefe) 
  REFERENCES empleado (idempleado)
);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY(deptofk)
REFERENCES departamento(iddepto)
GO


--para las de 1 en 1, hacemos la que no tenga fk, por ende es la 1, y la foreign key es unique, esa es la clave
CREATE TABLE empleado2(
 idemp int not null identity(1,1),
 nombre varchar(20) not null,
 CONSTRAINT pk_emp
 PRIMARY KEY (idemp)
);
GO

CREATE TABLE departamento2(
idepto int not null identity(1,1),
nombredepto varchar(12) not null,
idem int not null,
constraint pk_depa
PRIMARY KEY(idepto),
CONSTRAINT uq_idemp
UNIQUE(idem),
constraint fk_depto_empl
FOREIGN KEY(idem)
REFERENCES empleado2(idemp)
);