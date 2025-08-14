-- Consultas Avanzadas

SELECT p.Num_Pedido AS [Numero Pedido],
       p.Importe AS [Total Pagar],
       c.Empresa AS [Cliente],
       c.Limite_Credito AS [Limite Credito]
FROM clientes AS c
INNER JOIN pedidos AS p
ON c.Num_Cli = p.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
      AND empresa LIKE 'A%'
ORDER BY Importe DESC;

-- Seleccionar los productos incluyendo su categoria y el proveedor
-- que lo surte

SELECT ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID,
       SupplierID
FROM Products;


SELECT ProductID AS [Número Producto],
       ProductName AS [Nombre Producto],
       UnitPrice AS [Precio],
       UnitsInStock AS [Existencia],
       CategoryID AS [Categoria],
       SupplierID AS [Proveedor]
FROM Products;

SELECT *
FROM Products
INNER JOIN Categories
ON products.CategoryID = categories.CategoryID;


SELECT *
FROM Products AS [pr]
INNER JOIN Categories AS ca
ON pr.CategoryID = ca.CategoryID;

SELECT
       pr.ProductID AS [Número Producto],
       pr.ProductName AS [Nombre Producto],
       pr.UnitPrice AS [Precio],
       pr.UnitsInStock AS [Existencia],
       ca.CategoryName AS [Categoria],
       su.CompanyName AS [Proveedor]
FROM Products AS [pr]
INNER JOIN Categories AS ca
ON pr.CategoryID = ca.CategoryID
INNER JOIN Suppliers AS [su]
ON pr.SupplierID = su.SupplierID;

SELECT *
FROM Products AS [pr]
INNER JOIN Categories AS ca
ON pr.CategoryID = ca.CategoryID
INNER JOIN Suppliers AS [su]
ON pr.SupplierID = su.SupplierID;

use pruebajoins;

SELECT * FROM Categorias;
SELECT * FROM Productos;
-- Inner join
SELECT c.Idcategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias As c
     INNER JOIN Productos AS p
     ON c.Idcategoria = p.Idcategoria;

SELECT c.Idcategoria, c.Nombre, p.Nombre, p.Precio, p.Idproducto
FROM Categorias As c
     LEFT OUTER JOIN Productos AS p
     ON c.Idcategoria = p.Idcategoria;

-- Mostrar todas las categorias que no tienen productos asignados
SELECT c.Idcategoria, c.Nombre, p.Nombre, p.Precio, p.Idproducto
FROM Categorias As c
     LEFT JOIN Productos AS p
     ON c.Idcategoria = p.Idcategoria
WHERE p.Idproducto IS NULL;


SELECT c.Idcategoria, c.Nombre, p.Nombre, p.Precio, p.Idproducto
FROM Categorias As c
     RIGHT JOIN Productos AS p
     ON c.Idcategoria = p.Idcategoria
WHERE c.Idcategoria IS NULL;


SELECT c.Idcategoria, c.Nombre, p.Nombre, p.Precio, p.Idproducto
FROM Productos As p
     FULL JOIN Categorias AS c
     ON c.Idcategoria = p.Idcategoria;

-- Listar las oficinas y los nombres y puestos de sus jefes
SELECT o.ciudad, r.nombre, r.puesto
FROM oficinas as o
INNER JOIN REPRESENTANTES AS r
ON r.Num_Empl = o.Jef;
-- Listar las oficinas y los nombres y puestos de sus jefes,
-- con un objetivo superior a 600000
SELECT o.ciudad, r.nombre, r.puesto, o.objetivo
FROM oficinas as o
INNER JOIN REPRESENTANTES AS r
ON r.Num_Empl = o.Jef
WHERE o.objetivo > 600000;


-- Listar todos los pedidos, mostrando el numero de pedido,
-- el importe y la descripción de los productos
use BDEJEMPLO2;
SELECT p.Num_Pedido AS [Número de Pedido],
       p.Importe AS [Total],
       pr.Descripcion AS [Nombre Producto]
FROM pedidos as p
INNER JOIN Productos as pr
ON pr.Id_fab =  p.Fab
AND pr.Id_producto = p.Producto;

-- Listar los pedidos superiores (importe) a 25000, incluyendo el numero de
-- pedido, importe, el nombre del representante que tomo la nota del
-- pedido y el nombre del cliente

SELECT  pe.Num_Pedido AS [Número Pedido],
        pe.Importe AS [Total],
        rp.Nombre AS [Nombre Representante],
        cli.Empresa AS [Nombre del Cliente]
FROM Pedidos AS pe
     INNER JOIN Clientes AS cli
     ON pe.Cliente = cli.Num_Cli
     INNER JOIN Representantes AS rp
     ON rp.Num_Empl = pe.Rep
WHERE pe.Importe > 25000;


-- Listar los pedidos superiores a 25000,
-- mostrando el numero de pedido,
-- el nombre del cliente que lo encargó y el nombre del representante
-- asignado al cliente


-- Listar los pedidos superiores a 25000, mostrando el numero de pedido,
-- el nombre del cliente que lo encargo, el representante del cliente y
-- la oficina en la que trabaja el representante



-- Listar los nombres de los empleados y sus jefes

SELECT sub.Nombre AS [Empleado],
       jefe.Nombre AS [Jefe]
FROM Representantes as jefe
     INNER JOIN Representantes sub
ON jefe.Num_Empl = sub.Jefe

-- Consultas de Agregado

-- Cual es la cuota media y las ventas medias de los representantes