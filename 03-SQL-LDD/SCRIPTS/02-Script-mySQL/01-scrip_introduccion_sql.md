```sql
-- Lenguaje SQL LDD (create, alter, drop)
-- Lenguaje SQL LDD (create, alter, drop)

#Crear la base de datos empresa G1
CREATE DATABASE empresaG2;


#Utilizar la base de datos
USE empresaG2;

#Crear la tabla categorias
CREATE TABLE Categorias
( 
    categoriaid int PRIMARY KEY,
	nombrecategoria nvarchar(30) not null unique

);

#Empleado Crear Tabla
CREATE TABLE Empleado
(
   EmpleadoId int not null auto_increment,
   Nombre nvarchar(20) not null,
   ApellidoPaterno nvarchar(15) not null,
   Curp char(18) not null,
   Telefono char(15),
   Sexo char(1) not null,
   Activo boolean not null,

   CONSTRAINT pk_empleado
   PRIMARY KEY(EmpleadoId),

   CONSTRAINT unique_curp
   UNIQUE (Curp),

   CONSTRAINT chk_sexo
   CHECK(sexo in ('M','F'))
);

drop table Empleado;

#Insertar en categorias LENGUAJE DE MANIPULACION DE DATOS
INSERT INTO Categorias(categoriaid, nombrecategoria)
 VALUES (1, 'CARNES FRIAS');

INSERT INTO Categorias(categoriaid, nombrecategoria)
 VALUES (2, 'JABON');

SELECT * FROM Categorias;

#INSETAR EN PRODUCTO
INSERT INTO Empleado(Nombre, ApellidoPaterno, Curp, Telefono, Sexo, Activo)
VALUES ('Bodoque', 'Panfilo', 'SDFSFSDFS', '2324232', 'M', 1);


SELECT * FROM Empleado;


INSERT INTO Empleado(Nombre, ApellidoPaterno, Curp, Telefono, Sexo, Activo)
VALUES ('sarai', 'vitoria', 'tretreter', '5435345', 'F', 1);

# Creacion de primaru keys compuestas

CREATE TABLE Tabla1
(
  tabla1id1 int not null,
  tabla1id2 int not null,
  Nombre nvarchar(20) not null,

  CONSTRAINT pk_tabla1
  PRIMARY KEY (Tabla1id1, tabla1id2)

);

drop TABLE Empleado;

CREATE TABLE tabla2(
 Tabla2id int not null auto_increment,
 Nombre varchar(20),
 Tabla1id1 int,
 Tabla1id2 int,
 CONSTRAINT pk_tabla2
 PRIMARY KEY (Tabla2id),
 CONSTRAINT fk_tabla2_tabla1
 FOREIGN KEY (Tabla1id1, Tabla1id2)
 REFERENCES Tabla1(Tabla1id1, Tabla1id2)
);

# Razon de cardinalidad 1:1 (FIDELIADA)
# Razon de cardinalidad 1:1 (FIDELIADA)
CREATE TABLE Employee
(
    Id INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(20) NOT NULL,
    Ap1 VARCHAR(15) NOT NULL,
    Ap2 VARCHAR(15),
    Sexo CHAR(1) NOT NULL,
    Salario NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_employee
        PRIMARY KEY(Id),
    CONSTRAINT chk_Sexo2
        CHECK(Sexo IN ('M', 'F')),
    CONSTRAINT chk_salario
        CHECK (Salario > 0.0)
);

CREATE TABLE Department
(
    Id INT NOT NULL AUTO_INCREMENT,
    NombreProyecto VARCHAR(20) NOT NULL,
    Ubicacion VARCHAR(15) NOT NULL,
    fechaInicio DATE NOT NULL,
    Idemployee INT NOT NULL,

    CONSTRAINT pk_department
        PRIMARY KEY(Id),

    CONSTRAINT unique_nombreproyecto
        UNIQUE(NombreProyecto),

    CONSTRAINT unique_idempleoyee
        UNIQUE(Idemployee),

    CONSTRAINT fk_department_employee
        FOREIGN KEY (Idemployee)
        REFERENCES Employee(Id) -- ¡ERROR CORREGIDO AQUÍ! Se eliminó la coma extra.
);

# Razon de cardinalidad 1:1 (FIDELIADA)
CREATE TABLE Project
(
    Projectid INT NOT NULL AUTO_INCREMENT,
    NombreProject VARCHAR(20) NOT NULL,
    CONSTRAINT pk_projectid
        PRIMARY KEY(Projectid),

    CONSTRAINT unique_nameproject
        UNIQUE (NombreProject)
);

#Razon de cardinaliad m a n
CREATE TABLE Work_on
(
    employeeid INT NOT NULL,
    projectid INT NOT NULL,
    horas INT NOT NULL,

    CONSTRAINT pk_work_on
        PRIMARY KEY(employeeid, projectid),

    CONSTRAINT fk_work_on_employee
        FOREIGN KEY (employeeid)
        REFERENCES Employee(Id),

    CONSTRAINT fk_Work_on_project
        FOREIGN KEY (projectid)
        REFERENCES Project(Projectid) -- ¡ERROR CORREGIDO AQUÍ! Se eliminó la coma extra.
);

drop table Employee;
drop table Department;
drop table Project;
drop table Work_on;

´´´