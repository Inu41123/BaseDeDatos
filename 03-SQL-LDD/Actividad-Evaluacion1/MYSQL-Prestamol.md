```SQL

-- Crear la base de datos
CREATE DATABASE PrestamoLibros;
USE PrestamoLibros;

-- Tabla Lector
CREATE TABLE Lector (
    numlector INT NOT NULL AUTO_INCREMENT, -- Auto-incrementable
    nummateria INT NOT NULL,
    nombrep VARCHAR(20) NOT NULL,
    ap1 VARCHAR(20) NOT NULL,
    ap2 VARCHAR(20),
    CONSTRAINT chk_lector_nummateria_positivo CHECK (nummateria > 0),
    CONSTRAINT PK_Lector PRIMARY KEY (numlector)
);

-- Tabla Libro
CREATE TABLE Libro (
    numlibro INT NOT NULL AUTO_INCREMENT, -- Auto-incrementable
    isbn INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    numlectorFK INT, -- Puede ser nulo si el libro no está prestado
    CONSTRAINT UQ_Libro_isbn UNIQUE (isbn), -- ISBN debe ser único
    CONSTRAINT PK_Libro PRIMARY KEY (numlibro)
);

-- Tabla Presta (Tabla de relación para préstamos)
CREATE TABLE Presta (
    Numlibro INT NOT NULL,
    numlector INT NOT NULL,
    fechadeprestamo DATE NOT NULL,
    CONSTRAINT chk_presta_numlibro_positivo CHECK (Numlibro > 0),
    CONSTRAINT chk_presta_numlector_positivo CHECK (numlector > 0),
    PRIMARY KEY (Numlibro, numlector), -- Clave primaria compuesta
    CONSTRAINT fk_presta_libro FOREIGN KEY (Numlibro) REFERENCES Libro(numlibro),
    CONSTRAINT fk_presta_lector FOREIGN KEY (numlector) REFERENCES Lector(numlector)
);


´´´