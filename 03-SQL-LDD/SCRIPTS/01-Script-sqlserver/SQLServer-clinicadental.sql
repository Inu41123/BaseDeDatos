-- Crear la base de datos
CREATE DATABASE Clinicadental;
GO

USE Clinicadental;
GO

-- Tabla PACIENTE
CREATE TABLE PACIENTE (
    idpaciente VARCHAR(50) IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(20) NOT NULL,
    ap2 VARCHAR(20),
    correo VARCHAR(20),
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    colonia VARCHAR(20) NOT NULL,
    calle VARCHAR(20) NOT NULL,
    numcalle INT NOT NULL,
    CONSTRAINT UQ_Paciente_correo 
	UNIQUE (correo),
    CONSTRAINT UQ_Paciente_idpaciente 
	UNIQUE (idpaciente),
    CONSTRAINT PK_PACIENTE 
	PRIMARY KEY (idpaciente)
);
GO

-- Tabla ODONTOLOGO
CREATE TABLE ODONTOLOGO (
    idodontolog INT IDENTITY(1,1) NOT NULL,
    cedula INT NOT NULL,
    nom VARCHAR(20) NOT NULL,
    ap1 VARCHAR(20) NOT NULL,
    ap2 VARCHAR(20),
    CONSTRAINT UQ_Odontologo_cedula 
	UNIQUE (cedula),
    CONSTRAINT PK_ODONTOLOGO 
	PRIMARY KEY (idodontolog)
);
GO

-- Tabla CONSULTORIO
CREATE TABLE CONSULTORIO (
    idconsultorio INT IDENTITY(1,1) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    piso INT NOT NULL,
    numero INT NOT NULL,
    CONSTRAINT UQ_Consultorio_ubicacion_piso_numero 
	UNIQUE (ubicacion, piso, numero), 
    CONSTRAINT PK_CONSULTORIO 
	PRIMARY KEY (idconsultorio)
);
GO

-- Tabla TRATAMIENTO
CREATE TABLE TRATAMIENTO (
    idtratamiento INT IDENTITY(1,1) NOT NULL,
    status BIT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    monto MONEY NOT NULL,
    duracion DATE NOT NULL,
    CONSTRAINT CHK_Tratamiento_monto_Positivo 
	CHECK (monto > 0),
    CONSTRAINT UQ_Tratamiento_nombre 
	UNIQUE (nombre),
    CONSTRAINT PK_TRATAMIENTO 
	PRIMARY KEY (idtratamiento)
);
GO

-- Tabla CITA
CREATE TABLE CITA (
    idcita INT IDENTITY(1,1) NOT NULL, 
    fecha DATE NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    idpaciente VARCHAR(50) NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT PK_CITA 
	PRIMARY KEY (idcita),
    CONSTRAINT FK_Cita_Paciente 
	FOREIGN KEY (idpaciente) 
	REFERENCES PACIENTE(idpaciente)
);
GO

-- Tabla FACTURA
CREATE TABLE FACTURA (
    idfactura INT IDENTITY(1,1) NOT NULL,
    fecha DATE NOT NULL,
    monto MONEY NOT NULL,
    estado BIT NOT NULL,
    CONSTRAINT CHK_Factura_idfactura_Positivo 
	CHECK (idfactura > 0),
    CONSTRAINT CHK_Factura_monto_Positivo 
	CHECK (monto > 0),
    CONSTRAINT PK_FACTURA 
	PRIMARY KEY (idfactura)
);
GO

-- Tabla IMAGEN
CREATE TABLE IMAGEN (
    idimagen INT IDENTITY(1,1) NOT NULL,
    ruta VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT CHK_Imagen_idimagen_Positivo 
	CHECK (idimagen > 0),
    CONSTRAINT UQ_Imagen_ruta 
	UNIQUE (ruta),
    CONSTRAINT PK_IMAGEN 
	PRIMARY KEY (idimagen)
);
GO

-- Tabla HISTORIA
CREATE TABLE HISTORIA (
    idhistoria INT IDENTITY(1,1) NOT NULL,
    idimagenFK INT NOT NULL,
    fecha DATE NOT NULL,
    diagnostico VARCHAR(100) NOT NULL,
    observaciones VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Historia_idimagenFK 
	UNIQUE (idimagenFK),
    CONSTRAINT PK_HISTORIA 
	PRIMARY KEY (idhistoria),
    CONSTRAINT FK_Historia_Imagen 
	FOREIGN KEY (idimagenFK) 
	REFERENCES IMAGEN(idimagen)
);
GO

-- Tabla APLICACIONTRATAMIENTO
CREATE TABLE APLICACIONTRATAMIENTO (
    idaplicacion INT IDENTITY(1,1) NOT NULL,
    observaciones VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    idpaciente VARCHAR(50) NOT NULL,
    idodontologFK INT NOT NULL,
    CONSTRAINT CHK_AplicacionTratamiento_idaplicacion_Positivo CHECK (idaplicacion > 0),
    CONSTRAINT CHK_AplicacionTratamiento_idpaciente_Positivo CHECK (idpaciente > 0),
    CONSTRAINT CHK_AplicacionTratamiento_idodontologFK_Positivo CHECK (idodontologFK > 0),
    CONSTRAINT PK_APLICACIONTRATAMIENTO PRIMARY KEY (idaplicacion),
    CONSTRAINT FK_AplicacionTratamiento_Paciente FOREIGN KEY (idpaciente) REFERENCES PACIENTE(idpaciente),
    CONSTRAINT FK_AplicacionTratamiento_Odontologo FOREIGN KEY (idodontologFK) REFERENCES ODONTOLOGO(idodontolog)
);
GO

-- Tabla PAGO
CREATE TABLE PAGO (
    idpago INT IDENTITY(1,1) NOT NULL, 
    idfacturaFK INT NOT NULL,
    CONSTRAINT CHK_Pago_idpago_Positivo CHECK (idpago > 0),
    CONSTRAINT CHK_Pago_idfacturaFK_Positivo CHECK (idfacturaFK > 0),
    CONSTRAINT UQ_Pago_idfacturaFK UNIQUE (idfacturaFK), -- Según tu diccionario, idfacturaFK es único
    CONSTRAINT PK_PAGO PRIMARY KEY (idpago),
    CONSTRAINT FK_Pago_Factura FOREIGN KEY (idfacturaFK) REFERENCES FACTURA(idfactura)
);
GO

-- Tabla SESION
CREATE TABLE SESION (
    idsesion INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    idcitaFK INT NOT NULL,
    idaplicacionFK INT NOT NULL,
    CONSTRAINT CHK_Sesion_idsesion_Positivo CHECK (idsesion > 0),
    CONSTRAINT CHK_Sesion_idcitaFK_Positivo CHECK (idcitaFK > 0),
    CONSTRAINT CHK_Sesion_idaplicacionFK_Positivo CHECK (idaplicacionFK > 0),
    CONSTRAINT UQ_Sesion_idcitaFK UNIQUE (idcitaFK), -- Según tu diccionario, idcitaFK es único
    CONSTRAINT UQ_Sesion_idaplicacionFK UNIQUE (idaplicacionFK), -- Según tu diccionario, idaplicacionFK es único
    CONSTRAINT PK_SESION PRIMARY KEY (idsesion),
    CONSTRAINT FK_Sesion_Cita FOREIGN KEY (idcitaFK) REFERENCES CITA(idcita),
    CONSTRAINT FK_Sesion_AplicacionTratamiento FOREIGN KEY (idaplicacionFK) REFERENCES APLICACIONTRATAMIENTO(idaplicacion)
);
GO

-- Tabla SESION_TRATAMIENTO (Renombrada de SESIONTRATAMIENT)
CREATE TABLE SESION_TRATAMIENTO (
    idsesion INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable, asumiendo que es un ID propio
    idtratamiento INT NOT NULL,
    duracion VARCHAR(50) NOT NULL, -- Asumiendo duración como string (ej. "30 minutos")
    fecha DATE NOT NULL,
    CONSTRAINT CHK_SesionTratamiento_idsesion_Positivo CHECK (idsesion > 0),
    CONSTRAINT CHK_SesionTratamiento_idtratamiento_Positivo CHECK (idtratamiento > 0),
    CONSTRAINT CHK_SesionTratamiento_fecha_PasadaOPresente CHECK (fecha <= GETDATE()),
    CONSTRAINT PK_SESION_TRATAMIENTO PRIMARY KEY (idsesion),
    CONSTRAINT FK_SesionTratamiento_Tratamiento FOREIGN KEY (idtratamiento) REFERENCES TRATAMIENTO(idtratamiento)
);
GO

-- Tabla MATERIAL
CREATE TABLE MATERIAL (
    idmate INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100),
    unidadmedida VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT CHK_Material_idmate_Positivo 
	CHECK (idmate > 0),
    CONSTRAINT CHK_Material_cantidad_NoNegativa 
	CHECK (cantidad >= 0),
    CONSTRAINT UQ_Material_nombre 
	UNIQUE (nombre),
    CONSTRAINT PK_MATERIAL 
	PRIMARY KEY (idmate)
);
GO

-- Tabla ESPECIALIDAD
CREATE TABLE ESPECIALIDAD (
    idespecialidad INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT CHK_Especialidad_idespecialidad_Positivo 
	CHECK (idespecialidad > 0),
    CONSTRAINT UQ_Especialidad_nombre 
	UNIQUE (nombre),
    CONSTRAINT PK_ESPECIALIDAD 
	PRIMARY KEY (idespecialidad)
);
GO

-- Tablas de relación (muchos a muchos)
-- Tabla USA (Relación entre ODONTOLOGO y CONSULTORIO)
CREATE TABLE USA (
    idconsultorio INT NOT NULL,
    idodontolog INT NOT NULL,
    horario VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT CHK_USA_idconsultorio_Positivo CHECK (idconsultorio > 0),
    CONSTRAINT CHK_USA_idodontolog_Positivo CHECK (idodontolog > 0),
    CONSTRAINT PK_USA PRIMARY KEY (idconsultorio, idodontolog),
    CONSTRAINT FK_USA_Consultorio FOREIGN KEY (idconsultorio) REFERENCES CONSULTORIO(idconsultorio),
    CONSTRAINT FK_USA_Odontologo FOREIGN KEY (idodontolog) REFERENCES ODONTOLOGO(idodontolog)
);
GO

-- Tabla TIENE (Relación entre ODONTOLOGO y ESPECIALIDAD)
CREATE TABLE TIENE (
    idespecialidad INT NOT NULL,
    idodontolog INT NOT NULL,
    CONSTRAINT CHK_TIENE_idespecialidad_Positivo CHECK (idespecialidad > 0),
    CONSTRAINT CHK_TIENE_idodontolog_Positivo CHECK (idodontolog > 0),
    CONSTRAINT PK_TIENE PRIMARY KEY (idespecialidad, idodontolog),
    CONSTRAINT FK_TIENE_Especialidad FOREIGN KEY (idespecialidad) REFERENCES ESPECIALIDAD(idespecialidad),
    CONSTRAINT FK_TIENE_Odontologo FOREIGN KEY (idodontolog) REFERENCES ODONTOLOGO(idodontolog)
);
GO

-- Tabla NECESITA (Relación entre TRATAMIENTO y MATERIAL)
CREATE TABLE NECESITA (
    idtratamiento INT NOT NULL,
    idmaterial INT NOT NULL,
    CONSTRAINT CHK_NECESITA_idtratamiento_Positivo 
	CHECK (idtratamiento > 0),
    CONSTRAINT CHK_NECESITA_idmaterial_Positivo 
	CHECK (idmaterial > 0),
    CONSTRAINT PK_NECESITA 
	PRIMARY KEY (idtratamiento, idmaterial),
    CONSTRAINT FK_NECESITA_Tratamiento 
	FOREIGN KEY (idtratamiento) 
	REFERENCES TRATAMIENTO(idtratamiento),
    CONSTRAINT FK_NECESITA_Material 
	FOREIGN KEY (idmaterial) 
	REFERENCES MATERIAL(idmate)
);
GO

-- Tabla ESTA (Relación entre PACIENTE y HISTORIA)
CREATE TABLE ESTA (
    idhistoriaFK INT NOT NULL,
    idaplicacionFK INT NOT NULL,
    CONSTRAINT CHK_ESTA_idhistoriaFK_Positivo 
	CHECK (idhistoriaFK > 0),
    CONSTRAINT CHK_ESTA_idaplicacionFK_Positivo 
	CHECK (idaplicacionFK > 0),
    CONSTRAINT PK_ESTA 
	PRIMARY KEY (idhistoriaFK, idaplicacionFK),
    CONSTRAINT FK_ESTA_Historia 
	FOREIGN KEY (idhistoriaFK) 
	REFERENCES HISTORIA(idhistoria),
    CONSTRAINT FK_ESTA_AplicacionTratamiento 
	FOREIGN KEY (idaplicacionFK) 
	REFERENCES APLICACIONTRATAMIENTO(idaplicacion)
);
GO

-- Tabla UTILIZA (Relación entre MATERIAL y SESION)
CREATE TABLE UTILIZA (
    idmateFK INT NOT NULL,
    idsesionFK INT NOT NULL,
    CONSTRAINT CHK_UTILIZA_idmateFK_Positivo 
	CHECK (idmateFK > 0),
    CONSTRAINT CHK_UTILIZA_idsesionFK_Positivo 
	CHECK (idsesionFK > 0),
    CONSTRAINT PK_UTILIZA 
	PRIMARY KEY (idmateFK, idsesionFK),
    CONSTRAINT FK_UTILIZA_Material 
	FOREIGN KEY (idmateFK) 
	REFERENCES MATERIAL(idmate),
    CONSTRAINT FK_UTILIZA_Sesion 
	FOREIGN KEY (idsesionFK) 
	REFERENCES SESION(idsesion)
);
GO
