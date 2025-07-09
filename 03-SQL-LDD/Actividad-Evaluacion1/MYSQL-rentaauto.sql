-- Crear la base de datos
CREATE DATABASE RentaVehiculo;
USE RentaVehiculo;

-- Tabla Sucursal
CREATE TABLE Sucursal (
    numsucursal INT NOT NULL AUTO_INCREMENT, -- Auto-incrementable
    Nombre VARCHAR(20) NOT NULL,
    ubicacion VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_Sucursal_Nombre UNIQUE (Nombre),
    CONSTRAINT UQ_Sucursal_ubicacion UNIQUE (ubicacion),
    CONSTRAINT PK_Sucursal PRIMARY KEY (numsucursal)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    Numcliente INT NOT NULL AUTO_INCREMENT, -- Auto-incrementable
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20),
    Curb CHAR(18) NOT NULL,
    Telefono CHAR(12) NOT NULL, -- Usar CHAR para longitud fija en MySQL
    Calle VARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Ciudad VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_Cliente_Curb UNIQUE (Curb),
    CONSTRAINT chk_cliente_numero_positivo CHECK (Numero > 0),
    CONSTRAINT PK_Cliente PRIMARY KEY (Numcliente)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    Numdevehiculo INT NOT NULL AUTO_INCREMENT, -- Auto-incrementable
    Placa VARCHAR(7) NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    Anio INT NOT NULL,
    NumclienteFK INT NOT NULL,
    NumsucursalFK INT NOT NULL,
    CONSTRAINT UQ_Vehiculo_Placa UNIQUE (Placa),
    CONSTRAINT chk_vehiculo_anio_valido CHECK (Anio > 1900),
    CONSTRAINT chk_vehiculo_numclientefk_positivo CHECK (NumclienteFK > 0),
    CONSTRAINT chk_vehiculo_numsucursalfk_positivo CHECK (NumsucursalFK > 0),
    CONSTRAINT PK_Vehiculo PRIMARY KEY (Numdevehiculo),
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (NumclienteFK) REFERENCES Cliente(Numcliente),
    CONSTRAINT FK_Vehiculo_Sucursal FOREIGN KEY (NumsucursalFK) REFERENCES Sucursal(numsucursal)
);
