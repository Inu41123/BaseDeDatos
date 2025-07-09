-- Crear la base de datos
CREATE DATABASE PrestamoLibros;
GO

USE PrestamoLibros;
GO

-- Tabla Lector
CREATE TABLE Lector (
    numlector INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    nummateria INT NOT NULL,
    nombrep NVARCHAR(20) NOT NULL,
    ap1 NVARCHAR(20) NOT NULL,
    ap2 NVARCHAR(20),
    CONSTRAINT CHK_Lector_numlector_Positivo CHECK (numlector > 0),
    CONSTRAINT CHK_Lector_nummateria_Positivo CHECK (nummateria > 0),
    CONSTRAINT PK_Lector PRIMARY KEY (numlector)
);
GO

-- Tabla Libro
CREATE TABLE Libro (
    numlibro INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    isbn INT NOT NULL,
    titulo NVARCHAR(50) NOT NULL,
    numlectorFK INT, -- Puede ser nulo si el libro no esta prestado
    CONSTRAINT CHK_Libro_numlibro_Positivo CHECK (numlibro > 0),
    CONSTRAINT UQ_Libro_isbn UNIQUE (isbn), -- ISBN debe ser �nico
    CONSTRAINT PK_Libro PRIMARY KEY (numlibro)
);
GO

-- Tabla Presta (Tabla de relacion para prestamos)
CREATE TABLE Presta (
    Numlibro INT NOT NULL,
    numlector INT NOT NULL,
    fechadeprestamo DATE NOT NULL,
    CONSTRAINT CHK_Presta_Numlibro_Positivo CHECK (Numlibro > 0),
    CONSTRAINT CHK_Presta_numlector_Positivo CHECK (numlector > 0),
    CONSTRAINT PK_Presta PRIMARY KEY (Numlibro, numlector), -- Clave primaria compuesta
    CONSTRAINT FK_Presta_Libro FOREIGN KEY (Numlibro) REFERENCES Libro(numlibro),
    CONSTRAINT FK_Presta_Lector FOREIGN KEY (numlector) REFERENCES Lector(numlector)
);
GO
