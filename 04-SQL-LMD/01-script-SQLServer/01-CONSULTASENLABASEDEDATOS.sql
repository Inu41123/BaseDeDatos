/*
USAR EL LENGUAJE DE SQL-LMD - CRUD - (Insert, Delate, Update, Select)
*/
-- USAR BASE NORTHWIND
USE NORTHWND;
GO

SELECT *
FROM Categories;
GO

SELECT *
FROM Products;
GO

SELECT *
FROM Suppliers;
GO

SELECT *
FROM Customers;
GO

SELECT *
FROM Employees;
GO

SELECT *
FROM Shippers;
GO

SELECT *
FROM Orders;
GO

/*
-- NO ES BUENA PRACTICA PONER ESPASIOS ENTRE ESPASIOS, 
PERO PARA ESO SE COLOCAN LOS [], 
QUE SE PODRIA CONSIDERAR UNA BUENA PRACTICA HACER ESO AUNQUE NO TENGA ESPACIOS
*/
SELECT *
FROM [Order Details];
GO

-- Proyeccion
-- NORMAL
SELECT *
FROM Customers;
GO

-- PROYECCION
SELECT CustomeRID, CompanyName, City
FROM Customers;
GO

-- REPASAR: VER BASE CANAL DE GALLARDO, GALLARDO TI

-- Alias de columnas
SELECT CustomerID AS 'Numero Empleado'
fROM Customers;
GO

SELECT CustomerID AS 'Numero Empleado',
       CompanyName Empresa
fROM Customers;
GO

--SI no hay espasios no son necsarias las comillas, pero preferiblemnte usar los corchetes
SELECT CustomerID AS 'Numero Empleado',
       CompanyName Empresa,
	   City AS Ciudad,
	   ContactName AS [Nombre del contacto]
fROM Customers;
GO

-- Alias de tablas
SELECT *
FROM Customers AS c;
GO

-- Siempre se pone el select y despues el from
SELECT Customers.CustomerID AS [Numero Cliente],
       Customers.CompanyName AS [Empresa],
	   Customers.ContactName AS [Nombre del contacto]
FROM Customers;
GO

-- Siempre se pone el select y despues el from
-- Puedes promer el AS en el from y funcina igual
SELECT c.CustomerID AS [Numero Cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del contacto]
FROM Customers AS c;
GO

-- Puedes promer el AS en el from y funcina igual, 
-- este esta culero,  no lo uses pero sirve
/*
SELECT c.CustomerID AS [Numero Cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del contacto]
FROM Customers c;
*/

-- CAMPO CALCULADO = DERIVADO EN EL MODELO E - R
SELECT *
FROM [Order Details];

SELECT *
FROM [Order Details] AS OD;
GO

--Campo calculado, el as no es obligatorio pero es mejor ponerlo
SELECT *, (UnitPrice * Quantity) AS [TOTAL]
FROM [Order Details] AS OD;
GO

--Campo calculado, el as no es obligatorio pero es mejor ponerlo
-- EL od no es necesario, puede ser mas simple
SELECT OD.OrderID AS [Numero de orden], 
	   OD.ProductID AS [Numero Producto],
	   OD.UnitPrice AS [Precio],
	   OD.Quantity AS [Cantidad],
       (UnitPrice * Quantity) AS [TOTAL]
FROM [Order Details] AS OD;
GO

/*
OPERADORES ARITMETICOS
+
-
/
*

OPERADORES RELACIONALES
=
>
<
>=
<=
!= o tmabien <>

OPERADORES LOGICOS
AND

tt|t
ft|f
tf|f
ff|f

OR

FF|T
TF|T
FT|T
FF|T

NOT
FT
TF

*/

-- SEleccionar todos los productos que pertenzacna a la cetegoria 1
SELECT *
FROM Products AS P;

SELECT *
FROM Products AS P
WHERE P.CategoryID = 1;

SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre],
	   P.CategoryID AS [Categoria],
	   P.UnitPrice AS [Precio],
	   P.UnitsInStock AS [Stock],
	   (P.UnitPrice * P.UnitsInStock) AS [Costo del Inventario]
FROM Products AS P
WHERE P.CategoryID = 1;

-- Seleccionar todos los productos de la categoria condiments
-- Los alias solo funcionan en esa consulta
SELECT *
FROM categories AS C;
GO

SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre],
	   P.CategoryID AS [Categoria],
	   P.UnitPrice AS [Precio],
	   P.UnitsInStock AS [Stock],
	   (P.UnitPrice * P.UnitsInStock) AS [Costo del Inventario]
FROM Products AS P
WHERE P.CategoryID = 2;
GO

-- SELECCIOANR todos los productos que su precio sea mayor a 40.3
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.UnitPrice > 40.3);
GO

-- SELECCIOANR todos los productos que su precio sea mayor o igual a 40
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.UnitPrice >= 40.3);
GO

-- SELECCIOANR todos los productos que su precio sea mayor o igual a 40
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.CategoryID != 3);
--tambien puede ser WHERE (p.CategoryID <> 3);
GO

-- Seleccionar todas las ordenes que sean de brazil rio de janeiro, 
-- mostrnado solo el numero de orden, 
-- la fecha de orden
-- Pais de envio
-- Cuidad
-- Transportista

--SELECCIONAR LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR PERO TODAS AQUELLAS QUE NO TENGAN REGION DE ENVIO

--SELECCIONAR LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR PERO TODAS AQUELLAS QUE si TENGAN REGION DE ENVIO
SELECT *
FROM Orders;
GO

SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE ShipCity = 'Rio de Janeiro'
;

SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (ShipRegion IS NULL);


SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipRegion IS NOT NULL);

-- Seleccionar todas las oredenes enviadas a brazil alemania y mexico y con region
-- Simpre que se use or y and hay que poner parentesis
SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipCountry = 'Brazil' 
       or O.ShipCountry = 'Mexico' 
	   or O.ShipCountry = 'Germany')
	   and (O.ShipRegion is not null)
;
GO

-- Poner un orden alfabetico
-- El orden simpre es al final
-- Simpre que se use or y and hay que poner parentesis
-- ASC, ASENDENTE   =   DESC DESCENDENTE
SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipCountry = 'Brazil' 
       or O.ShipCountry = 'Mexico' 
	   or O.ShipCountry = 'Germany')
	   and (O.ShipRegion is null)
-- El alias se puede usar aqui el el order by, [PAIS DE ENVIO]
ORDER BY O.ShipCountry ASC, O.ShipCity DESC
;
GO

SELECT *
FROM Orders;
GO

-- SELECCIONAR TODAS LAS ORDENES DE FRANCIA,A LEMANIA Y ARGENTINA (clausula in)
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany', 'France', 'Argentina')
ORDER BY ShipCountry ASC
;
GO

-- SELECCIONAR TODOS LOS PRODUCTOS DESCONTINUADOS O CON PRECIO MAYOR A 50 Y ORDENADOS POR EL PRECIO, DEL MAYOR A MENOR
SELECT *
FROM Products;
GO

SELECT p.CategoryID AS [Numero],
	   p.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio],
	   p.Discontinued [descontinuado]
FROM Products AS p
WHERE (p.Discontinued = 1 or p.UnitPrice > 50)
ORDER BY p.UnitPrice DESC
;
GO

SELECT p.CategoryID AS [Numero],
	   p.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio],
	   p.Discontinued [descontinuado]
FROM Products AS p
WHERE (p.Discontinued = 1 AND p.UnitPrice > 50)
ORDER BY p.UnitPrice DESC
;
GO

-- Seleccionar los emepleados que fueron contratados despues de 1994
-- Nombre completo fecha de contratacion
SELECT FirstName, LastName, HireDate
FROM Employees;
GO

SELECT (FirstName + ' ' +LastName) AS [NOMBRE COMPLETO],
HIREDATE AS [Fecha de contratacion]
FROM Employees;
GO

SELECT (FirstName + ' ' +LastName) AS [NOMBRE COMPLETO],
HireDate AS [Fecha de contratacion]
FROM Employees
WHERE (HireDate > '1994-12-31');
GO	

SELECT MAX(HireDate)
FROM Employees;
GO

SELECT MIN(HireDate)
FROM Employees;
GO

-- usando concat Y DEMAS FUNCIONES

SELECT CONCAT(FirstName, ' ' ,LastName) AS [NOMBRE COMPLETO],
HireDate AS [Fecha de contratacion], YEAR(HireDate) AS [Anio de contratacion],
MONTH(HireDate) AS [mes de contratacion],
DAY(HireDate) AS [dia de contratacion]
FROM Employees
WHERE (YEAR(HireDate) = 1993);
GO	

-- mostrar los empleados en abril
SELECT CONCAT(FirstName, ' ' ,LastName) AS [NOMBRE COMPLETO],
HireDate AS [Fecha de contratacion], YEAR(HireDate) AS [Anio de contratacion],
MONTH(HireDate) AS [mes de contratacion],
DAY(HireDate) AS [dia de contratacion]
FROM Employees
WHERE (MONTH(HireDate) = 04);
GO	

-- con get
SELECT GETDATE();

-- con get DATEÁRT
-- mostrar los empleados en abril
SELECT CONCAT(E.FirstName, ' ' ,E.LastName) AS [NOMBRE COMPLETO],
E.HireDate AS [Fecha de contratacion], DATEPART(YEAR,E.HireDate) AS [Anio de contratacion],
DATEPART(mm,E.HireDate) AS [mes de contratacion],
DATEPART(d,E.HireDate) AS [dia de contratacion],
DATEPART(quarter, E.Hiredate) AS [Trimestre]
FROM Employees AS E
WHERE (MONTH(HireDate) = 04);
GO	

-- date name
-- con get DATEÁRT
-- mostrar los empleados en abril
SELECT CONCAT(E.FirstName, ' ' ,E.LastName) AS [NOMBRE COMPLETO],
E.HireDate AS [Fecha de contratacion], DATEPART(YEAR,E.HireDate) AS [Anio de contratacion],
DATENAME(MONTH,E.HireDate) AS [mes],
DATENAME(WEEKDAY,E.HireDate) AS [dia],
DATEPART(quarter, E.Hiredate) AS [Trimestre]
FROM Employees AS E
WHERE (MONTH(HireDate) = 04);
GO	



-- Seleccionar los productos que no esatn descontinuados mostrando,
-- solamente el nombre del prdocuto y el campo descontinuado
SELECT p.ProductName AS[NOMBRE PRODUCTO],
       P.Discontinued AS [DESCONTINUADOS]
FROM Products AS p
WHERE (p.Discontinued = 0);
GO

-- Seleccionar los proveedores que no son de usa
SELECT s.CompanyName AS [empresa],
       s.ContactName AS [contacto]
FROM Suppliers AS s
WHERE (s.Country != 'USA')
GO

--seleccionar los productos caros y bajos en un stcok con precios mayores a 50
--y stock menor a 20
SELECT *
FROM Products;
GO

SELECT p.ProductName AS [NOMBRE PRODUCTO],
       p.SupplierID AS [Proveedor],
	   p.UnitsInStock AS [existencia],
	   p.UnitPrice AS [precio unitario]
FROM Products AS p
WHERE (p.UnitPrice > 50 and UnitsInStock < 20)
GO

SELECT * FROM Suppliers
WHERE SupplierID = 18;
GO

/*
Se puede realizar de otra manera pero esta seria una forma bastante buena, en el otro caso
solo espesificas por ejemplo en vez de (p.SupplierID = s.SupplierID), seria (products.SupplierID = supplier.SupplierID)
*/

SELECT p.ProductName AS [NOMBRE PRODUCTO],
       p.SupplierID AS [Proveedor],
	   p.UnitsInStock AS [existencia],
	   p.UnitPrice AS [precio unitario],
	   s.CompanyName AS [NOMBRE DEL Provedor]
FROM Products AS p,
     Suppliers AS s
WHERE (p.SupplierID = s.SupplierID) and (p.UnitPrice > 50 and UnitsInStock < 20)
GO

-- Amazon cloud system
SELECT p.ProductName AS [NOMBRE PRODUCTO],
       p.SupplierID AS [Proveedor],
	   p.UnitsInStock AS [existencia],
	   p.UnitPrice AS [precio unitario],
	   s.CompanyName AS [NOMBRE DEL Provedor]

FROM 
    Products AS p
INNER JOIN
    Suppliers AS s
ON p.SupplierID = s.SupplierID

WHERE (p.SupplierID = s.SupplierID) 
      and 
	  (p.UnitPrice > 50 and UnitsInStock < 20)
GO

-- CLEINTES DE MEXICO Y ESPAÑA y que tengan region
SELECT 
      c.CompanyName AS [Cliente],
      c.City AS [CUIDAD],
	  c.Country AS [PAIS],
	  c.Region AS [REGION]

FROM Customers AS c
WHERE  (c.Region is not null) AND
       (c.Country = 'Mexico' or c.Country = 'Spain')
GO

-- Prodcutos que no estan descontinuados y tienen inventario
SELECT *
FROM Products;

SELECT p.ProductName AS [NOMBRE PRODUCTO],
       p.UnitsInStock AS EXISTENCIA,
	   P.UnitPrice AS [PRECIO],
	   (P.UnitPrice * p.UnitsInStock) AS [PRECIO EN EL INVENTARIO],
       P.Discontinued AS [DESCONTINUADOS]
FROM Products AS p
WHERE 
     (p.Discontinued = 1)
	 AND
	 (P.UnitsInStock > 0);
GO

-- sleccionar los provedores que no son de estados unidos no de reino unidp
SELECT s.CompanyName AS [empresa],
       s.ContactName AS [contacto],
	   s.City AS [PAIS]
FROM Suppliers AS s
WHERE (s.Country != 'USA') AND (s.Country != 'UK')
GO


-- sleccionar los provedores que no son de estados unidos no de reino unidp
SELECT s.CompanyName AS [empresa],
       s.ContactName AS [contacto],
	   s.City AS [PAIS]
FROM Suppliers AS s
WHERE NOT(s.Country = 'USA' or s.Country = 'Reino Unido')
GO


/*
ORDER BY
*/

-- SELECCIONAR TODOS LOS PROVEEDORES MOSTRANDO EL NOMBRE DEL PROVEEDOR, EL PAIS, LA CUIDAD, ORDENADA POR PAIS DE MENOR A MAYOR
SELECT *
FROM Suppliers;

SELECT s.CompanyName AS [empresa],
       s.Country AS [PAIS],
	   s.City AS [Ciudad],
       s.ContactName AS [contacto],
	   s.City AS [PAIS]
FROM Suppliers AS s
ORDER BY s.Country ASC;
GO


SELECT s.CompanyName AS [empresa],
       s.Country AS [PAIS],
	   s.City AS [Ciudad],
       s.ContactName AS [contacto],
	   s.City AS [PAIS]
FROM Suppliers AS s
ORDER BY s.Country DESC;
GO

/*
Seleccionar todos los proveedroes mostrando el nombre deñ proveedor el pais y la ciudad 
ordenada por pais de mayor a menor t dentro del a¿oais por cuidad de mayor a menor
*/

SELECT s.CompanyName AS [empresa],
       s.Country AS [PAIS],
	   s.City AS [Ciudad],
       s.ContactName AS [contacto],
	   s.City AS [PAIS]
FROM Suppliers AS s
ORDER BY s.Country DESC, s.City DESC;
GO


-- Repaso usando declare
DECLARE @fecha date = getdate();

-- Año
--otro ejemplos
SELECT DATEPART(year, getdate());
SELECT DATEPART(year, '2024-07-23');
-- ejemplo

SELECT DATEPART(YEAR, @fecha);

SELECT DATEPART(YEAR, @fecha);
SELECT DATEPART(yy, @fecha);
SELECT DATEPART(yyyy, @fecha);


-- Trimenste quareter
SELECT DATEPART(QUARTER, @fecha);
SELECT DATEPART(q, @fecha);

-- seleccionar todas aqueyas ordenes que se realziaron en 1998
-- revision del maximo
SELECT COUNT(OrderDate)
FROM Orders
GO

SELECT MAX(year(OrderDate))
FROM Orders;


-- select form
SELECT 
	p.OrderID AS [ID],
	p.ShipCity AS [CUIDAD],
	P.ShipCountry AS [PAIS],
	P.OrderDate AS [fecha de orden],
	DATEPART (yyyy, p.OrderDate) AS [AÑO]
FROM Orders AS p
WHERE (YEAR(OrderDate) = 1998);
GO



-- seleccionar todas las ordenes que se hicieron que se hicieron en el trimestre del año
SELECT 
	p.OrderID AS [ID],
	p.ShipCity AS [CUIDAD],
	P.ShipCountry AS [PAIS],
	P.OrderDate AS [fecha de orden],
	DATEPART (q, p.OrderDate) AS [cuatrimestre]
FROM Orders AS p
WHERE DATEPART(q,OrderDate) = 3;
GO

-- sin el datepart
SELECT 
	p.OrderID AS [ID],
	p.ShipCity AS [CUIDAD],
	P.ShipCountry AS [PAIS],
	P.OrderDate AS [fecha de orden],
	DATEPART (q, p.OrderDate) AS [cuatrimestre],
	DATEPART (YYYY, p.OrderDate) AS [Año],
	DATENAME(MONTH, p.OrderDate) AS [NOMBRE DEL MES],
	DATEPART(MONTH, p.OrderDate) AS [NUMERO  DEL MES],
	DATENAME(WEEKDAY, p.OrderDate) AS [NOMBRE DEL DIA]
FROM Orders AS p
WHERE DATEPART(q,OrderDate) = 3;
/*
lo mismo pero mas largo
WHERE MONTH(p.OrderDate) = 7 
	  OR MONTH(p.OrderDate) = 8 
	  OR MONTH(p.OrderDate) = 9;
*/
GO

-- Seleccionar los paises de nuestro clientes
-- USAR EL DISTINCT
SELECT DISTINCT C.Country
FROM Customers AS C
ORDER BY Country

-- ejemplo2 convinacion, busca todos los distintos de la convinacion
SELECT DISTINCT C.Country, C.City
FROM Customers AS C
ORDER BY Country

--Seleccionar todos los paises y cuidades unicas de los proveedores, suppliers
SELECT 
DISTINCT s.Country, s.City
FROM Suppliers AS s

-- Mostrar las fechas distintas de compra
SELECT Distinct OrderDate
FROM Orders AS o

-- mostrar las categoias distintas de los productos
SELECT 
	DISTINCT P.CategoryID
FROM Products AS p

SELECT 
	DISTINCT P.ProductName, p.CategoryID
FROM Products AS p
GO


/*
Seleccionar todas las ordenes con mas de 30 dias desde la fecha requerida hasta la fehca de pedido
Seleccionar todos los pedidos cuyo precio unitario teng aun impuesto del 20% sea mayor a 30
*/

SELECT
	OrderDate, RequiredDate, 
	DATEDIFF(day, OrderDate, RequiredDate) AS [DIAS],
	DATEDIFF(year, OrderDate, RequiredDate) AS [Año]
FROM Orders AS o;
GO

-- SI ES DATETIME ES NECESARIO HACE UN CAST
SELECT
	o.OrderDate, RequiredDate,
	DATEDIFF(day, o.OrderDate, RequiredDate) AS [DIAS]
FROM Orders AS o
WHERE DATEDIFF(day, o.OrderDate, RequiredDate) > 30;
GO

-- EL OTRO
SELECT *
FROM Products AS p
WHERE (p.UnitPrice * 1.20) > 30;
GO

-- Seleccionar todas las ordenes cuyo total es mayor a 100
SELECT *, (o.UnitPrice * o.Quantity) AS Total
FROM [Order Details Extended] AS o
WHERE (o.UnitPrice * o.Quantity > 100);
GO

-- test seleciconar todos los productos con un precio entre 20 y 50 unidades monetarias
SELECT *
FROM Products AS p
WHERE p.UnitPrice >=20 AND p.UnitPrice <=30;

SELECT *
FROM Products AS p
WHERE p.UnitPrice BETWEEN 20 AND 30;


/*
--utilizar la base datos BDEJMEPLO
*/
USE BDEJEMPLO2;

--listar los diferente spuestos de los representantes
SELECT *
FROM Representantes; 

SELECT Puesto
FROM Representantes;

--ESTE ES EL CORRECTO
SELECT DISTINCT Puesto
FROM Representantes;

/*
CAMBIO A NOTRWING
*/

--usadr ntorhwing
USE NORTHWND;
GO

SELECT *
FROM Customers;
GO

SELECT Country
FROM Customers;
GO

--Seleccionar paises sin repetirse
SELECT DISTINCT Country
FROM Customers;
GO

/*
Solamente puede existir un disctinct
pero puede ver mas de un campo
*/

SELECT c.Country, c.City
FROM Customers AS c
ORDER BY c.Country;
GO

/*
Al poner los dos, se lo aplica a ambos y agarra la convinacion distinta de los dos, si fueran 3 de los tres
*/
SELECT DISTINCT c.Country, c.City
FROM Customers AS c
ORDER BY c.Country;
GO


/*
--utilizar la base datos BDEJMEPLO
*/
USE BDEJEMPLO2;
GO
/*
--Listar los 5 pedidos con importe mas alto
*/
SELECT *
FROM Pedidos AS p;
GO

SELECT p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p;

-- usando top
SELECT TOP 5 p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p;

SELECT TOP 3 p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p;

--SOLUCION
-- EL SEIS ES LO MISMO QUE IMPORTE DEBIDO A QUE ES LA POSISION EN LA TABLA DE IMPORTE
SELECT TOP 5 p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p
ORDER BY 6 DESC;
GO

--MYSQL
/*
no se llama top, se llama limit y va al final
--SOLUCION
SELECT p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p
ORDER BY p.pedido DESC
LIMIT 5;
*/

-- nomas se puede en order by poner un campo con los []
SELECT TOP 5 p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe AS [TOTAL]
FROM Pedidos AS p
ORDER BY [TOTAL] DESC;
GO

SELECT TOP 5 p.Num_Pedido, p.Fecha_Pedido, p.Fab, p.Producto, p.Cantidad, p.Importe
FROM Pedidos AS p
ORDER BY 6 DESC;
GO

-- TEST DE ENCAGE DE PATRONES
-- SELECCIONAR TODOS LOS CLIENTES QUE COMIENCEN CON A

SELECT *
FROM clientes
WHERE Empresa Like 'A%';
GO

-- AQUI EL PORCENTAJE ES NO ME INTERESA, SOLO ME INTESAN LAS LETRAS
SELECT *
FROM clientes
WHERE Empresa Like 'A%S';
GO

SELECT *
FROM clientes
WHERE Empresa Like '%L';

-- yo quiero que contenga la palabra en cuqluier lugar
SELECT *
FROM clientes
WHERE Empresa Like '%er%';


-- ESTRUCTURA, PUEDE IR CUALQUIER LETRA SEGUIDA DE UNA A
SELECT *
FROM clientes
WHERE Empresa Like '_A%';

-- yo quiero ver en un rango de palabras
SELECT *
FROM clientes
WHERE Empresa Like '[A-D]';

-- yo quiero que contenga culqueir letra
SELECT *
FROM clientes
WHERE Empresa Like '[abcx]%';

-- que inicie

SELECT *
FROM clientes
WHERE Empresa Like '[^abcx]%';

--que comienzce con culquier letra pero que le siga
SELECT *
FROM clientes
WHERE Empresa Like '_organ';

INSERT INTO Clientes
VALUES
(2126, 'Morgan', 108, 678),
(2127, 'Porgan', 108, 778)


-- ayer todos los representantes que o bien:
-- a) trabjan eN Daimiel, Navarra o Castellon, o bien
-- b) No tienen jefe y estan contratados desde junio de 1988; o
-- c) c) superan su cuota pero tienen ventas de 600000 o menos

SELECT *
FROM Representantes;
GO

SELECT *
FROM Clientes;
GO

SELECT r.Nombre ,r.Jefe, r.Cuota, r.Ventas, r.Fecha_Contrato
FROM Representantes AS r
WHERE r.Nombre Like '[abcx]%';

-- la tabla izquierda es la primera que aparece
SELECT *
FROM Representantes;
GO

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

