/* Lab 13.1 Northwind*/
/*1. Select all the records from the "Customers" table*/
select * from Customers
/*2. Get distinct countries from the Customers table*/
select distinct Country from Customers
/*3. Get all the records from the table Customers where the Customer’s ID starts with “BL”*/
select * from Customers where CustomerID like 'BL%'
/*4. Get the first 100 records of the orders table*/
SELECT TOP (100) * FROM [Northwind].[dbo].[Orders]
/*5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023*/
select * from Customers where PostalCode = '1010' or PostalCode = '3012' or PostalCode = '12209' or PostalCode = '05023'
/*6. Get all orders where the ShipRegion is not equal to NULL.*/
select * from Orders where ShipRegion <> 'NULL'
/*7. Get all customers ordered by the country, then by the city.*/
select * from Customers order by Country, City
/*8. Add a new customer to the customers table. You can use whatever values*/
insert into Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) 
values ('UMBRL', 'Umbrella Corportion', 'Spencer Oswell', 'Co-Founder', '545 S Birdneck RD STE 202B', 'Virginia Beach',NULL, '23451', 'Vietnam', '757-227-4610', NULL);
/*9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the
ShipCountry is equal to France.*/
Update Orders Set ShipRegion='EuroZone' where ShipCountry='France'
/*10. Delete all orders from OrderDetails that have quantity of 1.*/
Delete from [Order Details] where Quantity=1
/*11. Calculate the average, max, and min of the quantity at the orderdetails table*/
select AVG(Quantity) as 'Avg Qty', Max(Quantity) as 'Max Qty', Min(Quantity)as 'Min Qty' from [Order Details]
/*12. Calculate the average, max, and min of the quantity at the orderdetails table, grouped by
the orderid.*/
select OrderID, AVG(Quantity) as 'Avg Qty', Max(Quantity) as 'Max Qty', Min(Quantity)as 'Min Qty' from [Order Details] group by OrderID
/*13. Find the CustomerID that placed order 10290 (Orders table)*/
select CustomerID from Orders where OrderID='10290'
/*14. Do an inner join, left join, right join on orders and customers tables  SKIP*/
/*15. Use a join to get the ship city and ship country of all the orders which are associated with
an employee who is in London.*/
select ShipCity, ShipCountry from Orders join Employees on Orders.EmployeeID = Employees.EmployeeID where Employees.City ='London'
/*16. Use a join to get the ship name of all orders that include a discontinued product. (See
Orders, OrderDetails, and Products. 1 means discontinued.)  Help tool https://www.sqlshack.com/learn-sql-join-multiple-tables/ */
select ShipName from Orders 
join [Order Details] on Orders.OrderID = [Order Details].OrderID
join products on [Order Details].ProductID = Products.ProductID
where Products.Discontinued = 1;
/*17. Get employees’ firstname for all employees who report to no one.*/
select FirstName from Employees where ReportsTo is NULL
/*18. Get employees’ firstname for all employees who report to Andrew.
https://www.sqlitetutorial.net/sqlite-self-join/#:~:text=The%20self%2Djoin%20is%20a,JOIN%20or%20INNER%20JOIN%20clause.&text=Because%20you%20cannot%20refer%20to,when%20you%20use%20self%2Djoin.*/
select e.FirstName as Employee 
from Employees e
inner join Employees m on m.employeeID = e.reportsTo
where m.firstname = 'Andrew'