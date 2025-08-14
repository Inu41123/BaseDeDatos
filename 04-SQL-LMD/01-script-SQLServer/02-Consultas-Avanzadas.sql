
/*
SELECT 
FROM Productos AS p
INNER JOIN
Categoria AS c
ON c.idcatego = p.idcatego;
*/

SELECT r.Nombre ,r.Jefe, r.Cuota, r.Ventas, r.Fecha_Contrato
FROM Representantes AS r
WHERE (r.Oficina_Rep IN (22,11,12))
	  OR
	  (r.Jefe IS NULL AND R.Fecha_Contrato >= '1988-06-01')
	  OR
	  (r.Ventas > r.Cuota AND NOT R.Ventas > 600000)
ORDER BY r.Ventas DESC;

-- JOIN
SELECT r.Nombre ,r.Jefe, r.Cuota, r.Ventas, r.Fecha_Contrato
FROM Representantes AS r
INNER JOIN
Oficinas AS o
ON o.Oficina = r.Oficina_Rep
WHERE (o.Ciudad IN ('Navara','Castellion', 'Daimiel'))
	  OR
	  (r.Jefe IS NULL AND R.Fecha_Contrato >= '1988-06-01')
	  OR
	  (r.Ventas > r.Cuota AND NOT R.Ventas > 600000)
ORDER BY r.Ventas DESC;

-- listar todos los pediddos, mostrando 
-- le numero de pedido
-- importe
-- nomre
-- limite de creditos del cliente

SELECT *
FROM Clientes;
GO

SELECT *
FROM Pedidos;

SELECT p.Num_Pedido  AS [NUMERO PEDIDO],
	   c.Empresa AS [TOTAL A PAGAR], 
	   c.Limite_Credito AS [LIMITE DE CREDITO]
FROM Pedidos AS p
INNER JOIN
Clientes AS c
ON c.Num_Cli = p.Cliente
ORDER BY p.Importe DESC;


SELECT p.Num_Pedido  AS [NUMERO PEDIDO],
	   c.Empresa AS [TOTAL A PAGAR], 
	   c.Limite_Credito AS [LIMITE DE CREDITO]
FROM Pedidos AS p
INNER JOIN
Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE c.Limite_Credito BETWEEN 25000 AND 50000
	AND c.Empresa like 'A%'
ORDER BY p.Importe DESC;

/*
CONSUTLAS AVANZADAS
*/

-- seleccinar los productos incluyendo los produtos de su categoria y el proveedor qure lo sute
USE NORTHWND

Select *
from Products;

SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, p.CategoryID, p.SupplierID
FROM Products AS P;

SELECT p.ProductID AS [Numero Producto], 
	   p.ProductName AS [NOMBRE PRDUCTO], 
	   p.UnitPrice AS [PRECIO], 
	   p.UnitsInStock AS [EXSITENCIA], 
	   p.CategoryID AS [CATEGORIA], 
	   p.SupplierID AS [PROVEDOR]
FROM Products AS P;
GO


-- los dos estan bien, pero esta mas fifi el de abajo con los as entre []
SELECT *
FROM Products AS P
INNER JOIN Categories AS c
ON c.CategoryID = p.CategoryID;
GO


SELECT 
	p.ProductID AS [numero del producto],
	p.ProductName AS [nombre del producto],
	p.UnitPrice AS [PRECIO],
	p.UnitsInStock AS [UNIDADES EN STOCK],
	c.CategoryID AS [CATEGORIA ID],
	c.CategoryName AS [CATEGORIA]
FROM Products AS [P]
INNER JOIN Categories AS [c]
ON c.CategoryID = p.CategoryID;
GO

/*
Uso de tres o mas tablas
*/


-- TRES TABLAS
SELECT *
FROM Products AS [P]

INNER JOIN Categories AS [c]
ON c.CategoryID = p.CategoryID

INNER JOIN Suppliers AS [S]
ON P.SupplierID = S.SupplierID;
GO

-- TRES TABLAS
SELECT 
	p.ProductID AS [numero del producto],
	p.ProductName AS [nombre del producto],
	p.UnitPrice AS [PRECIO],
	p.UnitsInStock AS [UNIDADES EN STOCK],
	c.CategoryID AS [CATEGORIA ID],
	c.CategoryName AS [CATEGORIA], 
	s.CompanyName AS [PROVEDOR]
FROM Products AS [P]

INNER JOIN Categories AS [c]
ON c.CategoryID = p.CategoryID

INNER JOIN Suppliers AS [S]
ON P.SupplierID = S.SupplierID;
GO



/*
CREAR BASES DE DATOS
*/

/*
INVESTIGAR JOINS LEFT Y RIGHT, Y COPIAR CODIGO EN OTRA TABLA, LO HICE CON OTROS DATOS PORQUE ME HICE BOLAS EN A LA HORA DE INSERTARLOS
*/

/*CREAR BASE DE DATOS PARA EJEMPLOS DE JOIN
USAR BASE DATOS
*/

CREATE DATABASE EJEMPLOJOINS;
GO

USE EJEMPLOJOINS
GO

-- Crear tabla categorias
CREATE TABLE categorias (
    idcategorias INT PRIMARY KEY,
    nombre NVARCHAR(50)
);
GO

INSERT INTO categorias (idcategorias, nombre) VALUES
(1, 'Monstruos'),
(2, 'Hechizos'),
(3, 'Trampas'),
(4, 'Decks'),
(5, 'Accesorios');
GO


CREATE TABLE productos (
    idproductos INT PRIMARY KEY,
    nombre NVARCHAR(50),
    precio MONEY,
    idcategoria INT
);
GO

INSERT INTO productos (idproductos, nombre, precio, idcategoria) VALUES
(101, 'Mago Oscuro', 150.00, 1),
(102, 'Dragón Negro de Ojos Rojos', 200.00, 1),
(103, 'Olla de la Codicia', 80.50, 2),
(104, 'Agujero Trampa', 30.00, 3),
(105, 'Cyber Dragón', 90.00, 1),
(106, 'Deck Estructura Dragón Definitivo', 450.00, 4),
(107, 'Set de Fundas Protectoras', 50.00, 5),
(108, 'Fuerza de Espejo', 75.00, 3),
(109, 'Péndulo de las Almas', 120.00, 2),
(110, 'Soporte de Cartas de Acrílico', 60.00, 5);
GO


SELECT
    p.nombre AS nombre_producto,
    c.nombre AS nombre_categoria
FROM productos AS p
INNER JOIN categorias AS c
ON p.idcategoria = c.idcategorias;
GO

SELECT
    p.nombre AS nombre_producto,
    c.nombre AS nombre_categoria
FROM productos AS p
LEFT JOIN categorias AS c
ON p.idcategoria = c.idcategorias;

SELECT
    c.nombre AS nombre_categoria,
    p.nombre AS nombre_producto
FROM productos AS p
RIGHT JOIN categorias AS c
ON p.idcategoria = c.idcategorias;

INSERT INTO categorias (idcategorias, nombre) VALUES (6, 'Fichas/Tokens');

SELECT
    c.nombre AS nombre_categoria
FROM categorias AS c
LEFT JOIN productos AS p
ON c.idcategorias = p.idcategoria
WHERE p.idproductos IS NULL;

-- Mostrar todas las categorias que no tienen productos asignados


/*
USAR BASE DE DATOS BDEJEMPLO
*/

USE BDEJEMPLO2;
--Listar las oficinas y los nombres y puestos de sus jefes
SELECT
    O.Oficina AS [OFICINA],
    O.Ciudad AS [CUIDAD],
    R.Nombre AS [Nombre_Jefe],
    R.Puesto AS [Puesto_Jefe]
FROM Oficinas AS [O]

INNER JOIN Representantes AS [R] 
ON O.Jef = R.Num_Empl;
GO

--Listar las oficinas y los nombres y puestos de sus jefes
-- con un objetivo superiror a 600000
SELECT
    O.Oficina AS [CUIDAD],
    O.Ciudad AS [CUIDAD],
    R.Nombre AS [Nombre_Jefe],
    R.Puesto AS [Puesto_Jefe],
    O.Objetivo AS [OBJETIVO]
FROM Oficinas AS [O]

INNER JOIN Representantes AS [R]
ON O.Jef = R.Num_Empl
WHERE O.Objetivo > 600000;
GO

--Listar las oficinas y los nombres y puestos de sus jefes
-- el importe y la descripcion de los productos, este esta mal, deben de ser 28
SELECT
    O.Oficina AS [CUIDAD],
    O.Ciudad AS [CUIDAD],
    R.Nombre AS [Nombre Jefe],
    R.Puesto AS [Puesto Jefe],
    P.Importe AS [IMPORTE],
    PR.Descripcion AS [DESCRIPCION]
FROM Oficinas AS O

INNER JOIN Representantes AS R ON O.Jef = R.Num_Empl
INNER JOIN Pedidos AS P ON R.Num_Empl = P.Rep
INNER JOIN Productos AS PR ON P.Producto = PR.Id_producto;
GO

--Listar los pedidos superiores a 25000, incluyendo el numero de pedido, 
--importe, le nombre del representante que tomo la nota del pedido y el nombre del cliente
SELECT
    PE.Num_Pedido AS [NUMER DE PEDIDO],
    PE.Importe AS [IMPORTE],
    R.Nombre AS [Nombre Representante],
    C.Empresa AS [Nombre Cliente]
FROM Pedidos AS PE

INNER JOIN Representantes AS R ON PE.Rep = R.Num_Empl
INNER JOIN Clientes AS C ON PE.Cliente = C.Num_Cli
WHERE PE.Importe > 25000;
GO

-- Listar los pedidos superirores a 25000,
--mostrar el numero de pedidos, el nombre del cliente que lo encargo y el nombre del representante 
--asignado al cliente

SELECT
    P.Num_Pedido,
    C.Empresa AS Nombre_Cliente,
    R.Nombre AS Nombre_Representante_Asignado
FROM Pedidos AS P
INNER JOIN Clientes AS C
    ON P.Cliente = C.Num_Cli
INNER JOIN Representantes AS R
    ON C.Rep_Cli = R.Num_Empl
WHERE P.Importe > 25000;

-- Listar los pedidos superirores a 25000,
--mostrar el numero de pedidos, el nombre del cliente que lo encargo



-- Listar los nombres de os empleados y sus jefes
SELECT
    E.Nombre AS Nombre_Empleado,
    J.Nombre AS Nombre_Jefe
FROM Representantes AS E
INNER JOIN Representantes AS J
ON e.Num_Empl = J.Jefe;

-- cosultas d eagregado

-- cual es la cuaota media 


/********************************************
-- CONSULTAS AVANZADAS 2
*/
/*
RECUERDA COPIAR LAS ULTIMAS CONSULTAS AQUI
*/

--USAR LA BASE DE DATOS
USE BDEJEMPLO2;
GO


/*
CONSULTAS DE AGREGADO
*/

-- Consutlas de agregado (Max, Min, AVG, COUNT(*), COUNT(CAMPO)) [SOLO DAN UN REGISTRO]

-- ¿Cual es la rendimiento medio de la cuota de los representantes?

SELECT *
FROM Representantes;
GO

-- USO DEL AVG
SELECT AVG(cuota) AS [RENDIMIENTO MEDIO DE LAS CUOTAS]
FROM Representantes;
GO

-- ¿Cual es la couta mayor?
-- USO DEL MAX
SELECT MAX(cuota) AS [CUOTA MAYOR]
FROM Representantes;
GO


-- ¿Cual es la couta menor?
-- USO DEL MIN
SELECT MIN(cuota) AS [CUOTA MENOR]
FROM Representantes;


-- ¿Cual es la couta mayor y la couta menor?
-- USO DEL MAX
SELECT 
	MAX(cuota) AS [CUOTA MAYOR], 
	MIN(cuota) AS [CUOTA MENOR]
FROM Representantes;
GO

-- Seleccionar la fecha de pedido mas antigua
SELECT MIN(p.Fecha_Pedido) AS [FECHA DE PEDIDO]
FROM Pedidos AS p;
GO

-- Calcular el rendimiento en ventas de los representantes
SELECT
	(100 + (r.Ventas/r.Cuota)) AS [RENDIMINETO DE VENTAS]
FROM Representantes AS r
WHERE (100 + (r.Ventas/r.Cuota)) IS NOT NULL;
GO

--CALCULAR EL RENDIMIENTO MEDIO EN VENTAS
SELECT
	AVG(100 + (r.Ventas/r.Cuota)) AS [RENDIMINETO DE VENTAS]
FROM Representantes AS r
WHERE (100 + (r.Ventas/r.Cuota)) IS NOT NULL;
GO

-- EXPLICACION SUM Y AVG
/*
SUM:
COUTA
2----|
     |
4----|
     |
6----|

SUM(CUOTA) = 12
*/

-- Cuales son las cuotas y ventas totales de todos los representantes
SELECT sum(Cuota), SUM(Ventas)
FROM Representantes;

-- Cual es el importe total de pedidos de bruno artega
SELECT SUM(p.Importe)
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl = p.Rep
WHERE r.Nombre = 'Bruno Arteaga';

/*Este da error porque no hace match
SELECT r.nombre, SUM(p.Importe)
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl = p.Rep
WHERE r.Nombre = 'Bruno Arteaga';
*/

-- version correcta nomas unos
SELECT r.nombre, SUM(p.Importe)
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl = p.Rep
WHERE r.Nombre = 'Bruno Arteaga'
GROUP BY r.Nombre;
GO

-- version correcta Todos
SELECT r.nombre, SUM(p.Importe)
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl = p.Rep
GROUP BY r.Nombre;
GO

/*
USO DEL COUNT
*/

/*
para este existen 2, el COUNT(*) y el COUNT(CAMPO)
Con asterisco cuenta filas y el que tiene campo cuenta registros verticales, al su vez este ignora los null
*/

SELECT *
FROM Representantes;

--cuantos representante exeden su cuota
-- este primero muesta la diferencia entre ambos, mostrando como uno cuenta el null y el otro no
SELECT COUNT(*), COUNT(Cuota)
FROM Representantes;
GO

-- este ya seria la respuesta y la solucion
SELECT COUNT(*), COUNT(Cuota)
FROM Representantes
WHERE Ventas>Cuota;
GO
-- es buen momento mencionarlo, pero lo que se ejecuta primero es el from, luego el where y finalmente el select

-- Cuantos pedidos de mas de 25000 hay
SELECT 
	COUNT(*) AS [PEDIDOS]
FROM Pedidos AS p
WHERE Importe > 25000;
GO

/*
Mayor que (>): Este símbolo indica que el número a la izquierda es mayor que el número a la derecha. 
Por ejemplo, en la expresión 5 > 3, se lee como "5 es mayor que 3". La abertura del símbolo apunta hacia el número mayor.

Menor que (<): Este símbolo indica que el número a la izquierda es menor que el número a la derecha. 
Por ejemplo, en la expresión 2 < 4, se lee como "2 es menor que 4". La punta del símbolo apunta hacia el número menor.
*/

-- Cuantos puestos tienen los representantes
SELECT * FROM
Representantes

SELECT
	(COUNT(DISTINCT r.puesto))
FROM Representantes AS r;

-- ¿Cual es el importe medio de los pedidos de cada uno de los representantes?
-- Con sum, en principio este esta mal en el contexto
SELECT 
	r.Nombre,
	SUM(Importe) AS [IMPORTE MEDIO]
FROM Pedidos AS p
INNER JOIN 
Representantes AS r
ON P.Rep = R.Num_Empl
GROUP BY r.Nombre
ORDER BY Nombre;
GO

-- Este seria el correcto
SELECT 
	r.Nombre,
	AVG(Importe) AS [IMPORTE MEDIO]
FROM Pedidos AS p
INNER JOIN 
Representantes AS r
ON P.Rep = R.Num_Empl
GROUP BY r.Nombre
ORDER BY Nombre;
GO

--variante
SELECT 
	r.Nombre,
	AVG(Importe) AS [IMPORTE MEDIO]
FROM Pedidos AS p
INNER JOIN 
Representantes AS r
ON P.Rep = R.Num_Empl
WHERE r.Nombre IN ('Tomás Saz', 'María Jiménez', 'Pablo Cruz')
GROUP BY r.Nombre
ORDER BY Nombre;
GO

CREATE OR ALTER PROCEDURE sp_pruebaconsulta
@fechaInicial date,
@fechaFinal date
AS
BEGIN
SELECT 
	r.Nombre,
	AVG(Importe) AS [IMPORTE MEDIO]
FROM Pedidos AS p
INNER JOIN 
Representantes AS r
ON P.Rep = R.Num_Empl
WHERE Fecha_Pedido BETWEEN @fechaInicial AND @fechaFinal
GROUP BY r.Nombre
ORDER BY Nombre;
END
GO

EXEC sp_pruebaconsulta '1989-01-01', '1989-04-06' 

select * from Pedidos

-- cual es el rango de las cuotas de las cuotas asignadas de cada oficina(ciudad)
SELECT
  O.Ciudad,
  MIN(R.Cuota) AS Cuota_Minima,
  MAX(R.Cuota) AS Cuota_Maxima
FROM Oficinas AS O
JOIN Representantes AS R
  ON O.Oficina = R.Oficina_Rep
GROUP BY
  O.Ciudad;