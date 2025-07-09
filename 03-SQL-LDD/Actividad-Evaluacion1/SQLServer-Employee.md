```sql
-- Crear la base de datos
CREATE DATABASE Empleados;
GO

USE Empleados;
GO

-- Tabla Department creada primero pero sin la FK a Employee
CREATE TABLE Department (
    numberdept INT NOT NULL,
    namedept NVARCHAR(30) NOT NULL,
    ssnFK INT NOT NULL, -- Gerente del departamento
    startdate DATE NOT NULL,
    CONSTRAINT CHK_Department_numberdept_Positivo CHECK (numberdept > 0),
    CONSTRAINT UQ_Department_namedept UNIQUE (namedept),
    CONSTRAINT PK_Department PRIMARY KEY (numberdept)
);
GO

-- Tabla Employee con FK a Department
CREATE TABLE Employee (
    snn INT NOT NULL,
    firstname NVARCHAR(20) NOT NULL,
    lastname NVARCHAR(20) NOT NULL,
    address INT NOT NULL,
    birthdate DATE NOT NULL,
    salary MONEY NOT NULL,
    sex NVARCHAR(20) NOT NULL,
    numberdeptoFK INT NOT NULL,
    supervisorFK INT,
    CONSTRAINT CHK_Employee_snn_Positivo CHECK (snn > 0),
    CONSTRAINT CHK_Employee_address_Positivo CHECK (address > 0),
    CONSTRAINT CHK_Employee_salary_Positivo CHECK (salary > 0),
    CONSTRAINT CHK_Employee_sex_Valido CHECK (sex IN ('M', 'F')),
    CONSTRAINT PK_Employee PRIMARY KEY (snn),
    CONSTRAINT FK_Employee_Department FOREIGN KEY (numberdeptoFK) REFERENCES Department(numberdept)
);
GO

--las FK circulares que no se podian crear ante
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn);
GO

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Supervisor FOREIGN KEY (supervisorFK) REFERENCES Employee(snn);
GO

-- Tabla Department_Location (Clave compuesta)
CREATE TABLE Department_Location (
    numberdeptFK INT NOT NULL,
    location NVARCHAR(30) NOT NULL,
    CONSTRAINT CHK_DepartmentLocation_numberdeptFK_Positivo CHECK (numberdeptFK > 0),
    CONSTRAINT PK_Department_Location PRIMARY KEY (numberdeptFK, location),
    CONSTRAINT FK_DepartmentLocation_Department FOREIGN KEY (numberdeptFK) REFERENCES Department(numberdept)
);
GO

-- Tabla Project
CREATE TABLE Project (
    NumberProject INT NOT NULL,
    name NVARCHAR(30) NOT NULL,
    location NVARCHAR(30) NOT NULL,
    numberdeptFK INT NOT NULL,
    CONSTRAINT CHK_Project_NumberProject_Positivo CHECK (NumberProject > 0),
    CONSTRAINT CHK_Project_numberdeptFK_Positivo CHECK (numberdeptFK > 0),
    CONSTRAINT UQ_Project_name UNIQUE (name),
    CONSTRAINT PK_Project PRIMARY KEY (NumberProject),
    CONSTRAINT FK_Project_Department FOREIGN KEY (numberdeptFK) REFERENCES Department(numberdept)
);
GO

-- Tabla Work_On (Clave compuesta)
CREATE TABLE Work_On (
    ssnFK INT NOT NULL,
    numberprojectFK INT NOT NULL,
    hours INT NOT NULL,
    CONSTRAINT CHK_WorkOn_ssnFK_Positivo CHECK (ssnFK > 0),
    CONSTRAINT CHK_WorkOn_numberprojectFK_Positivo CHECK (numberprojectFK > 0),
    CONSTRAINT PK_Work_On PRIMARY KEY (ssnFK, numberprojectFK),
    CONSTRAINT FK_WorkOn_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn),
    CONSTRAINT FK_WorkOn_Project FOREIGN KEY (numberprojectFK) REFERENCES Project(NumberProject)
);
GO

-- Tabla Dependent (Clave compuesta)
CREATE TABLE Dependent (
    ssnFK INT NOT NULL,
    name NVARCHAR(50) NOT NULL,
    relationship NVARCHAR(30) NOT NULL,
    sex NVARCHAR(20) NOT NULL,
    birthdate DATE NOT NULL,
    CONSTRAINT CHK_Dependent_ssnFK_Positivo CHECK (ssnFK > 0),
    CONSTRAINT CHK_Dependent_relationship_Valida CHECK (relationship IN ('Hijo', 'C�nyuge', 'Padre', 'Otro')),
    CONSTRAINT CHK_Dependent_sex_Valido CHECK (sex IN ('M', 'F')),
    CONSTRAINT PK_Dependent PRIMARY KEY (ssnFK, name),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn)
);
GO
´´´