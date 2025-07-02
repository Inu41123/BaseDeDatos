-- Lenguaje SQL LDD (create, alter, drop)

--Crear la base de datos empresa G1
CREATE DATABASE empresaG2;
GO

-- Utilizar la base de datos
USE empresaG2;

-- Crear la tabla categorias
CREATE TABLE Categorias
( 
    categoriaid int PRIMARY KEY,
	nombrecategoria nvarchar(30) not null unique

);
GO

--Empleado Crear Tabla
CREATE TABLE Empleado
(
   EmpleadoId int not null IDENTITY(1,1),
   Nombre nvarchar(20) not null,
   ApellidoPaterno nvarchar(15) not null,
   Curp char(18) not null,
   Telefono char(15),
   Sexo char(1) not null,
   Activo bit not null,

   CONSTRAINT pk_empleado
   PRIMARY KEY(EmpleadoId),

   CONSTRAINT unique_curp
   UNIQUE (Curp),

   CONSTRAINT chk_sexo
   CHECK(sexo in ('M','F'))
);
GO

--Insertar en categorias LENGUAJE DE MANIPULACION DE DATOS
INSERT INTO Categorias(categoriaid, nombrecategoria)
 VALUES (1, 'CARNES FRIAS');

INSERT INTO Categorias(categoriaid, nombrecategoria)
 VALUES (2, 'JABON');

SELECT * FROM Categorias;

--INSETAR EN PRODUCTO
INSERT INTO Empleado(Nombre, ApellidoPaterno, Curp, Telefono, Sexo, Activo)
VALUES ('Bodoque', 'Panfilo', 'SDFSFSDFS', '2324232', 'M', 1)
GO

SELECT * FROM Empleado;
GO

INSERT INTO Empleado(Nombre, ApellidoPaterno, Curp, Telefono, Sexo, Activo)
VALUES ('sarai', 'vitoria', 'tretreter', '5435345', 'F', 1)
GO

