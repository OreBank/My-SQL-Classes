-- MSSQL CLASS 1 
-- SELECT FROM STATEMENTS RECAP
SELECT * FROM [Production].[Product];
SELECT Name, Color, Size FROM Production.Product;
SELECT NAME AS PNAME, COLOR AS PCOLOR, SIZE AS PSIZE FROM [Production].[Product];

-- REMOVING DUPLICATES ( DISTINCT)
SELECT COLOR FROM PRODUCTION.Product;
SELECT DISTINCT COLOR FROM Production.Product;

-- SORTING ( ORDER BY)
SELECT ProductID, Name, Color FROM [Production].[Product]
order by Name;

-- Limiting Sorted results (TOP  N)
select top 15 Name, ListPrice from Production.Product
order by ListPrice desc;

-- using filters (wHERE)
-- OR
-- WE WANT THOSE WHOSE FIRST NAME STARTS WITH A AND THOSE WHOSE FIRST NAME STARTS WITH Z
-- USING AND 
SELECT FirstName, LastName FROM [Person].[Person]
WHERE FirstName LIKE 'A%' AND FirstName LIKE 'Z%';

-- USING OR
SELECT FirstName, LastName FROM [Person].[Person]
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'Z%'
ORDER BY FirstName DESC;

-- WE WANT THOSE WHOSE FIRST NAME STARTS WITH A AND THOSE WHOSE LAST NAME STARTS WITH Z
-- USING OR
SELECT FirstName, LastName FROM [Person].[Person]
WHERE FirstName LIKE 'A%' OR LastName LIKE 'Z%';

-- USING and
SELECT FirstName, LastName FROM [Person].[Person] 
WHERE FirstName LIKE 'A%' AND LastName LIKE 'Z%';

-- USING IN
SELECT FirstName, LastName FROM [Person].[Person]
WHERE FirstName IN ('Aaron');

SELECT FirstName, LastName FROM [Person].[Person]
WHERE FirstName IN ('Aaron') AND LastName LIKE 'Z%';

--select name, listprice from production.Product
select top 23 Name, ListPrice from Production.Product
order by ListPrice desc;


/* DAY 2 SEPT COHORT
	MSSQL SERVER CLASS

	JOINS
	*/
-- INNER JOIN
-- GET ME THE NAMES OF OUR EMPLOYEES

SELECT * FROM [HumanResources].[Employee];

SELECT * FROM [Person].[Person];
--- JOINING
-- NAMES OF EMPLOYEES
SELECT FirstName, LastName, JOBTITLE, LOGINID
FROM Person.Person AS PP INNER JOIN HumanResources.Employee AS HRE
ON PP.BusinessEntityID = HRE.BusinessEntityID;

SELECT P.ProductID, Name, COLOR , SalesOrderID, UnitPrice
FROM [Production].[Product] AS P INNER JOIN [Sales].[SalesOrderDetail] AS SOD
ON P.ProductID = SOD.ProductID



-- LEFT JOIN
-- QUERRY TO DISPLAY ALL PRODUCT AND SALES ORDER ID EVEN IF THE PRODUCT HAS NEVER BEEN ORDERED

SELECT FirstName, LastName, JOBTITLE, LOGINID
FROM Person.Person AS PP LEFT OUTER JOIN HumanResources.Employee AS HRE
ON PP.BusinessEntityID = HRE.BusinessEntityID;

SELECT FirstName, LastName, JOBTITLE, LOGINID
FROM Person.Person AS PP RIGHT OUTER JOIN HumanResources.Employee AS HRE
ON PP.BusinessEntityID = HRE.BusinessEntityID;

SELECT P.ProductID, Name, COLOR , SalesOrderID, UnitPrice
FROM [Production].[Product] AS P LEFT OUTER JOIN [Sales].[SalesOrderDetail] AS SOD
ON P.ProductID = SOD.ProductID

-- CLASSWORK
/*Write a query that returns all the rows from the Sales.SalesPerson table joined to the 
Sales.SalesOrderHeader table along with the SalesOrderID column even if no orders match. 
Include the SalesPersonID and SalesYTD columns in the results.
*/
SELECT * FROM [Sales].[SalesPerson];
SELECT * FROM Sales.SalesOrderHeader;

SELECT BusinessEntityID, SalesYTD,SSP.TerritoryID, SalesOrderID,  SOH.TERRITORYID
FROM Sales.SalesPerson AS SSP LEFT OUTER JOIN SALES.SalesOrderHeader AS SOH
ON SSP. TerritoryID = SOH.TerritoryID;

SELECT BusinessEntityID, SalesYTD, SSP.TerritoryID, SalesPersonID, SalesOrderID,  SOH.TERRITORYID
FROM Sales.SalesPerson AS SSP LEFT OUTER JOIN SALES.SalesOrderHeader AS SOH
ON SSP. BusinessEntityID = SOH.SalesPersonID;

-- SELF JOIN

SELECT PER.FirstName, PER.LASTNAME, PP.PersonType 
FROM Person.Person AS PER  LEFT OUTER JOIN PERSON.Person AS PP
ON PER.BusinessEntityID = PP.BusinessEntityID;


CREATE TABLE SSWWL (
STUDENTID INT PRIMARY KEY IDENTITY (1,1), 
CLASS VARCHAR (10),
SCORE INT
);

SELECT * FROM SSWWL;


-- creating a taable 
 create table semester1 (
 student_id int identity(1,1) not null ,
 student_name varchar(100) not null,
 course varchar(100) not null,
 score float not null,
 );

  create table semester2 (
 student_id int identity(1,1) not null ,
 student_name varchar(100) not null,
 course varchar(100) not null,
 score float not null,
 );

select * from semester1;
select * from semester2;

-- SET OPERATORS
-- UNIONS 
-- UNION ALL
SELECT * FROM semester1
UNION ALL
SELECT * FROM semester2

SELECT STUDENT_ID, STUDENT_NAME FROM semester1
UNION ALL
SELECT STUDENT_ID, STUDENT_NAME FROM semester2

-- UNION 
SELECT * FROM semester1
UNION 
SELECT * FROM semester2;

SELECT STUDENT_ID, STUDENT_NAME FROM semester1
UNION 
SELECT STUDENT_ID, STUDENT_NAME FROM semester2;

-- INTERSECT
SELECT STUDENT_ID, STUDENT_NAME FROM semester1
INTERSECT 
SELECT STUDENT_ID, STUDENT_NAME FROM semester2;

-- EXCEPT
SELECT STUDENT_ID, STUDENT_NAME FROM semester1
EXCEPT
SELECT STUDENT_ID, STUDENT_NAME FROM semester2;

-- AGGREGATE FUNCTION
-- COUNT
SELECT * FROM SALES.SalesOrderDetail;
SELECT COUNT(*) FROM SALES.SalesOrderDetail;

-- MAX
SELECT MAX(UNITPRICE) FROM SALES.SalesOrderDetail;

-- Min
SELECT Min(UNITPRICE) FROM SALES.SalesOrderDetail;

-- variance (var)
select var(unitprice) from sales.SalesOrderDetail;

-- Group BY
select SalesOrderID, sum(UnitPrice) as total_price
from sales.SalesOrderDetail
group by SalesOrderID;

-- Having
select SalesOrderID, sum(UnitPrice) as total_price
from sales.SalesOrderDetail
group by SalesOrderID
having sum(unitprice) > 20000;


-- database definition language
-- drop
drop table semester2;
select * from semester2;