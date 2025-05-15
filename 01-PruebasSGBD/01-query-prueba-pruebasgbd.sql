/* 
 === BASE DE DATOS BGD2 ===
 Realizar una base de datos con dos tablas 
 praa ejemplificar el uso de squl server

*/

-- SQL-LDD
-- Construir la base de datos bdg2

CREATE DATABASE bdg2;

--Utilizar la base de datos
USE bdg2;

--Crear una tabla
-- not null(no puede estar vacio) (int tipo de dato) (identity(es donde empieza y cuanto incrementa)
CREATE TABLE categoria (
   idcategoria int not null identity(1,1),
   categorianombre nvarchar(20) not null,
   constraint pk_categoria
   primary key(idcategoria)
);


-- tabla
CREATE TABLE producto (

  idproducto int not null,
  producotnombre nvarchar(20) not null,
  precio money not null,
  existencia int not null,
  categoriaid int,
  constraint pk_producto
  primary key(idproducto),
  constraint fk_producto_categoria
  foreign key (categoriaid)
  references categoria(idcategoria)

);

--diagramas


-- SQL-LMD
INSERT INTO categoria (categorianombre)
VALUES ('lacteos');

INSERT INTO categoria (categorianombre)
VALUES ('Carnes calientes'),
       ('vinos y licores');


-- Seleccionar los datos de la tabla de datos categoria
SELECT *
FROM categoria;

SELECT categorianombre
FROM categoria;

SELECT categorianombre
FROM categoria
WHERE categorianombre = 'vinos y licores';


SELECT categorianombre, idcategoria
FROM categoria
WHERE idcategoria in (1,3);


SELECT categorianombre, idcategoria
FROM categoria
WHERE idcategoria = 1 or idcategoria = 3;

-- Modificar un registro de la base de datos
UPDATE categoria
   SET categorianombre = 'Carnes verdes'
   WHERE idcategoria = 2;

   

SELECT *
FROM categoria;


-- Eliminar un registro de loa tabla
DELETE FROM categoria
  WHERE idcategoria = 2;

-- Insertar en producto
INSERT INTO producto
VALUES(1,'SEGGSS', 3450.6, 50, 3);

INSERT INTO producto (producotnombre, existencia, precio, categoriaid, idproducto)
VALUES('DON JULIO', 454, 42.4, 3, 2),
      ('Leche nido', 444, 455.4, 5, 3);


SELECT *
FROM producto;








