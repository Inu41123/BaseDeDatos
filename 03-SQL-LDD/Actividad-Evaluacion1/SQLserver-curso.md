``` sql
-- Crear la base de datos
CREATE DATABASE SistemaCitas;
GO

USE SistemaCitas;
GO

-- Tabla ALUMNO
CREATE TABLE ALUMNO (
    numalumno INT IDENTITY(1,1) NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    ap1 NVARCHAR(20) NOT NULL,
    ap2 NVARCHAR(20),
    CONSTRAINT CHK_ALUMNO_numalumno_Positivo CHECK (numalumno > 0),
    CONSTRAINT PK_ALUMNO PRIMARY KEY (numalumno) 
);
GO

-- Tabla CURSO
CREATE TABLE CURSO (
    numcurso INT IDENTITY(1,1) NOT NULL, 
    nombrecurso NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_CURSO_numcurso_Positivo CHECK (numcurso > 0),
    CONSTRAINT PK_CURSO PRIMARY KEY (numcurso) 
);
GO

-- Tabla PARTICIPAN
CREATE TABLE PARTICIPAN (
    numalumnoFK INT NOT NULL,
    numcursoFK INT NOT NULL,
    horas TIME NOT NULL,
    fechacurso DATE NOT NULL,
    CONSTRAINT PK_PARTICIPAN PRIMARY KEY (numalumnoFK, numcursoFK), 
    CONSTRAINT FK_PARTICIPAN_ALUMNO FOREIGN KEY (numalumnoFK) REFERENCES ALUMNO(numalumno),
    CONSTRAINT FK_PARTICIPAN_CURSO FOREIGN KEY (numcursoFK) REFERENCES CURSO(numcurso),
);
GO

-- Tabla UBICACION
CREATE TABLE UBICACION (
    ubicacionid INT IDENTITY(1,1) NOT NULL,
    numcursoFK INT NOT NULL,
    ubicacioncurso NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_UBICACION_ubicacionid_Positivo CHECK (ubicacionid > 0),
    CONSTRAINT PK_UBICACION PRIMARY KEY (ubicacionid), 
    CONSTRAINT FK_UBICACION_CURSO FOREIGN KEY (numcursoFK) REFERENCES CURSO(numcurso)
);
GO

´´´