-- Crear la base de datos
CREATE DATABASE SistemaMedico;
USE SistemaMedico;

-- Tabla Paciente
CREATE TABLE Paciente (
    idpaciente INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(20) NOT NULL,
    ap1 VARCHAR(20) NOT NULL,
    ap2 VARCHAR(20),
    especialidad VARCHAR(20),
    CONSTRAINT PK_Paciente 
    PRIMARY KEY (idpaciente)
);

-- Tabla Medico
CREATE TABLE Medico (
    idmedico INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    especialidad VARCHAR(20) NOT NULL,
    numcolegiado VARCHAR(10) NOT NULL,
    CONSTRAINT UQ_Medico_numcolegiado 
    UNIQUE (numcolegiado),
    CONSTRAINT PK_Medico 
    PRIMARY KEY (idmedico)
);

-- Tabla Cita
CREATE TABLE Cita (
    idcita INT NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    idpaciente INT NOT NULL,
    idmedico INT NOT NULL,
    estado CHAR(1) NOT NULL,
    CONSTRAINT chk_cita_idpaciente_positivo 
    CHECK (idpaciente > 0),
    CONSTRAINT chk_cita_idmedico_positivo 
    CHECK (idmedico > 0),
    CONSTRAINT chk_cita_estado_valido 
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

-- Tabla Diagnostico
CREATE TABLE Diagnostico (
    iddiagnostico INT NOT NULL AUTO_INCREMENT, 
    idcita INT NOT NULL,
    descripcion TEXT NOT NULL,
    tratamiento TEXT,
    CONSTRAINT chk_diagnostico_idcita_positivo 
    CHECK (idcita > 0),
    CONSTRAINT PK_Diagnostico 
    PRIMARY KEY (iddiagnostico),
    CONSTRAINT FK_Diagnostico_Cita 
    FOREIGN KEY (idcita) 
    REFERENCES Cita(idcita)
);

-- Tabla Receta
CREATE TABLE Receta (
    idreceta INT NOT NULL AUTO_INCREMENT,
    iddiagnostico INT NOT NULL,
    medicamento VARCHAR(50) NOT NULL,
    dosis VARCHAR(30) NOT NULL,
    duracion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_receta_iddiagnostico_positivo 
    CHECK (iddiagnostico > 0),
    CONSTRAINT PK_Receta 
    PRIMARY KEY (idreceta),
    CONSTRAINT FK_Receta_Diagnostico 
    FOREIGN KEY (iddiagnostico) 
    REFERENCES Diagnostico(iddiagnostico)
);

-- Tabla Historia_Clinica
CREATE TABLE Historia_Clinica (
    idhistoria INT NOT NULL AUTO_INCREMENT, 
    idpaciente INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    alergias TEXT,
    antecedentes TEXT,
    CONSTRAINT chk_historiaclinica_idpaciente_positivo 
    CHECK (idpaciente > 0),
    CONSTRAINT PK_Historia_Clinica 
    PRIMARY KEY (idhistoria),
    CONSTRAINT FK_HistoriaClinica_Paciente 
    FOREIGN KEY (idpaciente) 
    REFERENCES Paciente(idpaciente)
);
