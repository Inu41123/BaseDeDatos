```sql
-- Crear la base de datos
CREATE DATABASE Empleados;
USE Empleados;

-- Tabla Department creada primero pero sin la FK a Employee
CREATE TABLE Department (
    numberdept INT NOT NULL,
    namedept VARCHAR(30) NOT NULL,
    ssnFK INT NOT NULL, -- Gerente del departamento
    startdate DATE NOT NULL,
    CONSTRAINT chk_department_numberdept_positivo CHECK (numberdept > 0),
    CONSTRAINT UQ_Department_namedept UNIQUE (namedept),
    CONSTRAINT PK_Department PRIMARY KEY (numberdept)
);

-- Tabla Employee con FK a Department pero sin FK circular a supervisor
CREATE TABLE Employee (
    snn INT NOT NULL, -- No es auto-incrementable, es un número de seguro social
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    address INT NOT NULL,
    birthdate DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL, -- Usar DECIMAL para MONEY
    sex VARCHAR(20) NOT NULL,
    numberdeptoFK INT NOT NULL,
    supervisorFK INT,
    CONSTRAINT chk_employee_snn_positivo CHECK (snn > 0),
    CONSTRAINT chk_employee_address_positivo CHECK (address > 0),
    CONSTRAINT chk_employee_salary_positivo CHECK (salary > 0),
    CONSTRAINT chk_employee_sex_valido CHECK (sex IN ('M', 'F')),
    CONSTRAINT PK_Employee PRIMARY KEY (snn),
    CONSTRAINT FK_Employee_Department FOREIGN KEY (numberdeptoFK) REFERENCES Department(numberdept)
);

-- Ahora agregamos las FK circulares que no pudimos crear antes
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Supervisor FOREIGN KEY (supervisorFK) REFERENCES Employee(snn);

-- Tabla Department_Location (Clave compuesta)
CREATE TABLE Department_Location (
    numberdeptFK INT NOT NULL,
    location VARCHAR(30) NOT NULL,
    CONSTRAINT chk_departmentlocation_numberdeptFK_positivo CHECK (numberdeptFK > 0),
    CONSTRAINT PK_Department_Location PRIMARY KEY (numberdeptFK, location),
    CONSTRAINT FK_DepartmentLocation_Department FOREIGN KEY (numberdeptFK) REFERENCES Department(numberdept)
);

-- Tabla Project
CREATE TABLE Project (
    NumberProject INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    location VARCHAR(30) NOT NULL,
    numberdeptFK INT NOT NULL,
    CONSTRAINT chk_project_numberproject_positivo CHECK (NumberProject > 0),
    CONSTRAINT chk_project_numberdeptFK_positivo CHECK (numberdeptFK > 0),
    CONSTRAINT UQ_Project_name UNIQUE (name),
    CONSTRAINT PK_Project PRIMARY KEY (NumberProject),
    CONSTRAINT FK_Project_Department FOREIGN KEY (numberdeptFK) REFERENCES Department(numberdept)
);

-- Tabla Work_On (Clave compuesta)
CREATE TABLE Work_On (
    ssnFK INT NOT NULL,
    numberprojectFK INT NOT NULL,
    hours INT NOT NULL,
    CONSTRAINT chk_workon_ssnFK_positivo CHECK (ssnFK > 0),
    CONSTRAINT chk_workon_numberprojectFK_positivo CHECK (numberprojectFK > 0),
    CONSTRAINT chk_workon_hours_rango CHECK (hours BETWEEN 1 AND 60),
    CONSTRAINT PK_Work_On PRIMARY KEY (ssnFK, numberprojectFK),
    CONSTRAINT FK_WorkOn_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn),
    CONSTRAINT FK_WorkOn_Project FOREIGN KEY (numberprojectFK) REFERENCES Project(NumberProject)
);

-- Tabla Dependent (Clave compuesta)
CREATE TABLE Dependent (
    ssnFK INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    relationship VARCHAR(30) NOT NULL,
    sex VARCHAR(20) NOT NULL,
    birthdate DATE NOT NULL,
    CONSTRAINT chk_dependent_ssnFK_positivo CHECK (ssnFK > 0),
    CONSTRAINT chk_dependent_relationship_valida CHECK (relationship IN ('Hijo', 'Cónyuge', 'Padre', 'Otro')),
    CONSTRAINT chk_dependent_sex_valido CHECK (sex IN ('M', 'F')),
    CONSTRAINT PK_Dependent PRIMARY KEY (ssnFK, name),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (ssnFK) REFERENCES Employee(snn)
);

´´´