-- Crear la base de datos bdRestricciones
CREATE DATABASE bdrestricciones;

-- Utilizar la base de datos BDDrestricciones
USE bdrestricciones;

--Crear la tabla categorias sin restricciones
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(50)
);

-- Revisar los datos de la tabla categoria
SELECT *FROM categoria;

-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (1, 'Carnea Frias');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (2, 'Linea Blanca');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (1, 'Carnea Frias');

--Eliminar todos los datos
DELETE FROM categoria;

--Eliminar toda la tabla
DROP TABLE categoria;


--Crear la tabla categorias sin restricciones
CREATE TABLE categoria(
categoriaid int not null,
nombrecategria nvarchar(50) not null,
CONSTRAINT pk_Categoria
PRIMARY KEY(categoriaid)
-- nombre de la restriccion
);

-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (1, 'Carnea Frias');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (2, 'Linea Blanca');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (3, 'Dulces');

-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (4, 'Dulces');

-- Revisar los datos de la tabla categoria
SELECT *FROM categoria;


--Eliminar todos los datos
DELETE FROM categoria;

--Eliminar toda la tabla
DROP TABLE categoria;

--Crear la tabla categorias sin restricciones
CREATE TABLE categoria(
categoriaid int not null,
nombrecategria nvarchar(50) not null,
CONSTRAINT pk_Categoria
PRIMARY KEY(categoriaid),
CONSTRAINT unico_nombrecategoria
UNIQUE(nombrecategria)
-- nombre de la restriccion
);

-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (1, 'Carnea Frias');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (2, 'Linea Blanca');


-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (3, 'Dulces');

-- Agreagar un resgitro a la tabla categoria
Insert INTO categoria
VALUES (4, 'Dulces');

--Crar tabla productor
CREATE TABLE producto(
	productoid int not null,

	nombreproducto nvarchar(50) not null,

	precio money not null,

	existencia int not null,

	CONSTRAINT pk_producto
	PRIMARY KEY(productoid),

	CONSTRAINT unico_nombreproducto
	UNIQUE(nombreproducto),

	CONSTRAINT chk_precio
	CHECK (precio >= 1 and precio <= 3000),

	CONSTRAINT chk_existencia
	CHECK (existencia >= 0)
)

INSERT INTO producto
VALUES(1, 'Don julio', 3000, 56);


INSERT INTO producto
VALUES(2, 'Don julio2', 3000, 56);


INSERT INTO producto
VALUES(3, 'Don julio3', 3000, 56);


INSERT INTO producto
VALUES(4, 'Terrible mezcal', 1, 56);


INSERT INTO producto
VALUES(5, 'Terrible mezcalito', 1, 0);

SELECT * FROM producto;

DELETE FROM producto;
DROP TABLE producto;


--Crar tabla productor
CREATE TABLE producto(
	productoid int not null,

	nombreproducto nvarchar(50) not null,

	precio money not null,

	existencia int not null,

	categoriaid int,

	CONSTRAINT pk_producto
	PRIMARY KEY(productoid),

	CONSTRAINT unico_nombreproducto
	UNIQUE(nombreproducto),

	CONSTRAINT chk_precio
	CHECK (precio >= 1 and precio <= 3000),

	CONSTRAINT chk_existencia
	CHECK (existencia >= 0)
)

SELECT * FROM categoria;

INSERT INTO producto
VALUES(1, 'Masapan', 10, 100, 5);


INSERT INTO producto
VALUES(2, 'Piruli', 3000, 56, null);


INSERT INTO producto
VALUES(3, 'Transformer', 100, 450,7);

DELETE FROM producto;
DROP TABLE producto;

--Crar tabla productor
CREATE TABLE producto(
	productoid int not null,

	nombreproducto nvarchar(50) not null,

	precio money not null,

	existencia int not null,

	categoriaid int,

	CONSTRAINT pk_producto
	PRIMARY KEY(productoid),

	CONSTRAINT unico_nombreproducto
	UNIQUE(nombreproducto),

	CONSTRAINT chk_precio
	CHECK (precio >= 1 and precio <= 3000),

	CONSTRAINT chk_existencia
	CHECK (existencia >= 0),

	CONSTRAINT fk_producto_categoria
	--priemro donde estoy y luego donde va a llegar
	FOREIGN KEY (categoriaid)
	REFERENCES categoria(categoriaid)
)

SELECT * FROM categoria;