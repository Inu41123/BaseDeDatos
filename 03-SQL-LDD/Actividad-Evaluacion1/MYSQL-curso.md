```sql
-- Crear la base de datos
CREATE DATABASE SistemaCitas;
USE SistemaCitas;

-- Tabla ALUMNO
CREATE TABLE ALUMNO (
    numalumno INT AUTO_INCREMENT NOT NULL, 
    nombre VARCHAR(20) NOT NULL,
    ap1 VARCHAR(20) NOT NULL,
    ap2 VARCHAR(20),
    CONSTRAINT chk_numalumno_positivo CHECK (numalumno > 0),
    CONSTRAINT PK_ALUMNO PRIMARY KEY (numalumno)
);

-- Tabla CURSO
CREATE TABLE CURSO (
    numcurso INT AUTO_INCREMENT NOT NULL,
    nombrecurso VARCHAR(20) NOT NULL,
    CONSTRAINT chk_numcurso_positivo CHECK (numcurso > 0),
    CONSTRAINT PK_CURSO PRIMARY KEY (numcurso)
);

-- Tabla PARTICIPAN
CREATE TABLE PARTICIPAN (
    numalumnoFK INT NOT NULL,
    numcursoFK INT NOT NULL,
    horas TIME NOT NULL,
    fechacurso DATE NOT NULL,
    PRIMARY KEY (numalumnoFK, numcursoFK),
    CONSTRAINT fk_participan_alumno FOREIGN KEY (numalumnoFK) REFERENCES ALUMNO(numalumno),
    CONSTRAINT fk_participan_curso FOREIGN KEY (numcursoFK) REFERENCES CURSO(numcurso)
);

-- Tabla UBICACION
CREATE TABLE UBICACION (
    ubicacionid INT AUTO_INCREMENT NOT NULL,
    numcursoFK INT NOT NULL,
    ubicacioncurso VARCHAR(20) NOT NULL,
    CONSTRAINT chk_ubicacionid_positivo CHECK (ubicacionid > 0),
    CONSTRAINT PK_UBICACION PRIMARY KEY (ubicacionid),
    CONSTRAINT fk_ubicacion_curso FOREIGN KEY (numcursoFK) REFERENCES CURSO(numcurso)
);


´´´