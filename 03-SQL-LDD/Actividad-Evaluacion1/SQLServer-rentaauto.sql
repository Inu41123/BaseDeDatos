-- Crear la base de datos
CREATE DATABASE RentaVehiculo;
GO

USE RentaVehiculo;
GO

-- Tabla Sucursal
CREATE TABLE Sucursal (
    numsucursal INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    Nombre NVARCHAR(20) NOT NULL,
    ubicacion NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_Sucursal_numsucursal_Positivo CHECK (numsucursal > 0),
    CONSTRAINT UQ_Sucursal_Nombre UNIQUE (Nombre),
    CONSTRAINT UQ_Sucursal_ubicacion UNIQUE (ubicacion),
    CONSTRAINT PK_Sucursal PRIMARY KEY (numsucursal)
);
GO

-- Tabla Cliente
CREATE TABLE Cliente (
    Numcliente INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20),
    Curb CHAR(18) NOT NULL,
    Telefono NCHAR(12) NOT NULL,
    Calle NVARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Ciudad NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_Cliente_Numcliente_Positivo CHECK (Numcliente > 0),
    CONSTRAINT UQ_Cliente_Curb UNIQUE (Curb),
    CONSTRAINT CHK_Cliente_Numero_Positivo CHECK (Numero > 0),
    CONSTRAINT PK_Cliente PRIMARY KEY (Numcliente)
);
GO

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    Numdevehiculo INT IDENTITY(1,1) NOT NULL, -- Auto-incrementable
    Placa NVARCHAR(7) NOT NULL,
    Marca NVARCHAR(20) NOT NULL,
    Modelo NVARCHAR(20) NOT NULL,
    Anio INT NOT NULL,
    NumclienteFK INT NOT NULL,
    NumsucursalFK INT NOT NULL,
    CONSTRAINT CHK_Vehiculo_Numdevehiculo_Positivo CHECK (Numdevehiculo > 0),
    CONSTRAINT UQ_Vehiculo_Placa UNIQUE (Placa),
    CONSTRAINT CHK_Vehiculo_Anio_Valido CHECK (Anio > 1900),
    CONSTRAINT CHK_Vehiculo_NumclienteFK_Positivo CHECK (NumclienteFK > 0),
    CONSTRAINT CHK_Vehiculo_NumsucursalFK_Positivo CHECK (NumsucursalFK > 0),
    CONSTRAINT PK_Vehiculo PRIMARY KEY (Numdevehiculo),
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (NumclienteFK) REFERENCES Cliente(Numcliente),
    CONSTRAINT FK_Vehiculo_Sucursal FOREIGN KEY (NumsucursalFK) REFERENCES Sucursal(numsucursal)
);
GO
