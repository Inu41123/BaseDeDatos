-- Creacion de base de datps bd instruccion

CREATE DATABASE bdinstruccion;
GO

-- Utilizar la base de datos

USE bdinstruccion;
GO

-- creacion de tablas


--INSTRUCCION
CREATE TABLE instruccion
(
   ssn int not null IDENTITY(1,1),
   lname nvarchar(20) not null,
   Fname nvarchar(15) not null,

   CONSTRAINT pk_ssn
   PRIMARY KEY(ssn),
);
GO

-- CLASS
CREATE TABLE class
(
   coursenum int not null IDENTITY(1,1),
   yearc int not null,
   term varchar(20) not null,
   section varchar(20) not null,

   CONSTRAINT pk_class
   PRIMARY KEY(coursenum, yearc, term, section),
);
GO



-- TEACHES
CREATE TABLE teaches
(
  ssnfk int,
  coursenumfk int,
  yearfk int,
  termfk varchar(20), 
  sectionfk varchar(20),
  
  CONSTRAINT pk_department
  PRIMARY KEY(ssnfk, coursenumfk, yearfk, termfk, sectionfk),

  CONSTRAINT fk_teaches_instruccion
  FOREIGN KEY (ssnfk)
  REFERENCES instruccion(ssn),

  CONSTRAINT fk_teaches_class
  FOREIGN KEY (coursenumfk, yearfk, termfk, sectionfk)
  REFERENCES class(coursenum, yearc, term, section),
);
GO
