-- Crear la base de datos
CREATE DATABASE SistemaMedico;
GO

USE SistemaMedico;
GO

-- Tabla Paciente
CREATE TABLE Paciente (
    idpaciente INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    nombre NVARCHAR(20) NOT NULL,
    ap1 NVARCHAR(20) NOT NULL,
    ap2 NVARCHAR(20),
    especialidad NVARCHAR(20),
    CONSTRAINT CHK_Paciente_idpaciente_Positivo 
    CHECK (idpaciente > 0),
    CONSTRAINT PK_Paciente 
    PRIMARY KEY (idpaciente)
);
GO

-- Tabla Medico
CREATE TABLE Medico (
    idmedico INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    nombre NVARCHAR(20) NOT NULL,
    apellido NVARCHAR(20) NOT NULL,
    especialidad NVARCHAR(20) NOT NULL,
    numcolegiado NVARCHAR(10) NOT NULL,
    CONSTRAINT CHK_Medico_idmedico_Positivo 
    CHECK (idmedico > 0),
    CONSTRAINT UQ_Medico_numcolegiado 
    UNIQUE (numcolegiado),
    CONSTRAINT PK_Medico 
    PRIMARY KEY (idmedico)
);
GO

-- Tabla Cita
CREATE TABLE Cita (
    idcita INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    fecha_hora DATETIME NOT NULL,
    idpaciente INT NOT NULL,
    idmedico INT NOT NULL,
    estado CHAR(1) NOT NULL,
    CONSTRAINT CHK_Cita_idcita_Positivo 
    CHECK (idcita > 0),
    CONSTRAINT CHK_Cita_idpaciente_Positivo 
    CHECK (idpaciente > 0),
    CONSTRAINT CHK_Cita_idmedico_Positivo 
    CHECK (idmedico > 0),
    CONSTRAINT CHK_Cita_estado_Valido 
    CHECK (estado IN ('P', 'C')),
    CONSTRAINT PK_Cita 
    PRIMARY KEY (idcita),
    CONSTRAINT FK_Cita_Paciente 
    FOREIGN KEY (idpaciente) 
    REFERENCES Paciente(idpaciente),
    CONSTRAINT FK_Cita_Medico 
    FOREIGN KEY (idmedico) 
    REFERENCES Medico(idmedico)
);
GO

-- Tabla Diagnostico
CREATE TABLE Diagnostico (
    iddiagnostico INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    idcita INT NOT NULL,
    descripcion TEXT NOT NULL,
    tratamiento TEXT,
    CONSTRAINT CHK_Diagnostico_iddiagnostico_Positivo 
    CHECK (iddiagnostico > 0),
    CONSTRAINT CHK_Diagnostico_idcita_Positivo 
    CHECK (idcita > 0),
    CONSTRAINT PK_Diagnostico 
    PRIMARY KEY (iddiagnostico),
    CONSTRAINT FK_Diagnostico_Cita 
    FOREIGN KEY (idcita) 
    REFERENCES Cita(idcita)
);
GO

-- Tabla Receta
CREATE TABLE Receta (
    idreceta INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    iddiagnostico INT NOT NULL,
    medicamento NVARCHAR(50) NOT NULL,
    dosis NVARCHAR(30) NOT NULL,
    duracion NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_Receta_idreceta_Positivo 
    CHECK (idreceta > 0),
    CONSTRAINT CHK_Receta_iddiagnostico_Positivo 
    CHECK (iddiagnostico > 0),
    CONSTRAINT PK_Receta 
    PRIMARY KEY (idreceta),
    CONSTRAINT FK_Receta_Diagnostico 
    FOREIGN KEY (iddiagnostico) 
    REFERENCES Diagnostico(iddiagnostico)
);
GO

-- Tabla Historia_Clinica
CREATE TABLE Historia_Clinica (
    idhistoria INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    idpaciente INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    alergias TEXT,
    antecedentes TEXT,
    CONSTRAINT CHK_HistoriaClinica_idhistoria_Positivo 
    CHECK (idhistoria > 0),
    CONSTRAINT CHK_HistoriaClinica_idpaciente_Positivo 
    CHECK (idpaciente > 0),
    CONSTRAINT PK_Historia_Clinica 
    PRIMARY KEY (idhistoria),
    CONSTRAINT FK_HistoriaClinica_Paciente 
    FOREIGN KEY (idpaciente) 
    REFERENCES Paciente(idpaciente)
);
GO
