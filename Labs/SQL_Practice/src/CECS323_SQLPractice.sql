-- CECS323 Practice SQL


-- Selects
-- 1. List all the data in the classic models database:

-- a) Product Lines (7)
SELECT * FROM PRODUCTLINES;

-- b) Product (110);
SELECT * FROM PRODUCTS;

-- c) Employees (23)
SELECT * FROM EMPLOYEES;

-- d) Offices (7)
SELECT * FROM OFFICES;

-- e) Customers (122)
SELECT * FROM CUSTOMERS;

-- f) Orders (326)
SELECT * FROM ORDERS;

-- g) Orderdetails (2996)
SELECT * FROM ORDERDETAILS;

-- h) Payments (273)
SELECT * FROM PAYMENTS;

-- 2. Select customer name from customer. Sort by customer name (122)
SELECT CUSTOMERNAME FROM CUSTOMERS
ORDER BY CUSTOMERNAME;

-- 3. List each of the different status that an order may be in (6)
SELECT DISTINCT STATUS from ORDERS;

-- 4. List firstname and lastname for each employee. Sort by lastname then firstname (23)
SELECT FIRSTNAME, LASTNAME from EMPLOYEES
ORDER BY LASTNAME, FIRSTNAME;

-- 5. List all the employee job titles (7)
SELECT DISTINCT JOBTITLE from EMPLOYEES;

-- 6. List all products along with their product scale (110)
SELECT PRODUCTNAME, PRODUCTSCALE from PRODUCTS;

-- 7. List all the territories where we have offices (4)
SELECT DISTINCT TERRITORY from OFFICES;

-- Where Clause
-- 8. select contact firstname, contact lastname and credit limit for all customers where credit
-- limit > 50000 (85)
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME, CREDITLIMIT FROM CUSTOMERS
WHERE CREDITLIMIT > 50000;

-- 9. select customers who do not have a credit limit (0.00) (24)
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME, CREDITLIMIT FROM CUSTOMERS
WHERE CREDITLIMIT = 0;

-- 10. List all offices not in the USA (4)
SELECT CITY, COUNTRY FROM OFFICES
WHERE COUNTRY != 'USA';

-- 11. List orders made between June 16, 2014 and July 7, 2014 (8)
SELECT ORDERNUMBER, ORDERDATE from ORDERS
WHERE
  month(ORDERDATE) = 6
  and day(ORDERDATE) > 16
  or
  month(ORDERDATE) = 7
  and day(ORDERDATE) < 7
  and year(ORDERDATE) = 2014;

-- 12. List products that we need to reorder (quantityinstock < 1000) (12)
SELECT PRODUCTNAME
FROM PRODUCTS
WHERE QUANTITYINSTOCK < 1000;

-- 13. List all orders that shipped after the required date (1)
SELECT ORDERNUMBER, ORDERDATE, REQUIREDDATE, SHIPPEDDATE
FROM ORDERS
WHERE SHIPPEDDATE > REQUIREDDATE;

-- 14. List all customers who have the word ‘Mini’ in their name (10)
SELECT CUSTOMERNAME FROM CUSTOMERS
WHERE CUSTOMERNAME LIKE '%Mini%';

-- 15. List all products supplied by ‘Highway 66 Mini Classics’ (9)
SELECT PRODUCTNAME FROM PRODUCTS
WHERE PRODUCTVENDOR = 'Highway 66 Mini Classics';

-- 16. List all product not supplied by ‘Highway 66 Mini Classics’ (101)
SELECT PRODUCTNAME FROM PRODUCTS
WHERE PRODUCTVENDOR != 'Highway 66 Mini Classics';

-- 17. List all employees that don't have a manager (1)
SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES
WHERE REPORTSTO IS NULL;

-- Natural Join
-- 18. Display every order along with the details of that order for order numbers 10270, 10272,
-- 10279 (23)
SELECT * FROM ORDERS
  NATURAL JOIN ORDERDETAILS
WHERE ORDERNUMBER = 10270 or ORDERNUMBER = 10272 or ORDERNUMBER = 10279;

-- Hint: this can be done two ways. Try both of them. Which is easier if you have a large number of
-- selection criteria?
-- 19. List of productlines and vendors that supply the products in that productline. (65)
SELECT DISTINCT PRODUCTLINE, PRODUCTVENDOR FROM PRODUCTLINES
  NATURAL JOIN PRODUCTS;

-- Inner Join
-- 20. select customers that live in the same state as one of our offices (26)
SELECT CUSTOMERNAME, STATE FROM CUSTOMERS
  INNER JOIN OFFICES USING (STATE);

-- 21. select customers that live in the same state as their employee representative works (26)
SELECT CUSTOMERNAME FROM CUSTOMERS
  INNER JOIN EMPLOYEES ON CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEES.EMPLOYEENUMBER
  INNER JOIN OFFICES ON EMPLOYEES.OFFICECODE = OFFICES.OFFICECODE
WHERE CUSTOMERS.STATE = OFFICES.STATE;

-- Multi-join
-- 22. select customerName, orderDate, quantityOrdered, productLine, productName for all
-- orders made and shipped in 2015 (444)
SELECT CUSTOMERNAME, ORDERDATE, QUANTITYORDERED, PRODUCTLINE, PRODUCTNAME FROM CUSTOMERS
  INNER JOIN ORDERS USING (CUSTOMERNUMBER)
  INNER JOIN ORDERDETAILS USING (ORDERNUMBER)
  INNER JOIN PRODUCTS USING (PRODUCTCODE)
  INNER JOIN PRODUCTLINES USING (PRODUCTLINE)
WHERE year(ORDERDATE) = 2015 and year(SHIPPEDDATE) = 2015;

-- Outer Join
-- 23. List products that didn't sell (1)
SELECT PRODUCTNAME FROM PRODUCTS
  LEFT JOIN ORDERDETAILS ON PRODUCTS.PRODUCTCODE = ORDERDETAILS.PRODUCTCODE
WHERE ORDERDETAILS.PRODUCTCODE IS NULL;

-- 24. List all customers and their sales rep even if they don’t have a sales rep (122)
SELECT CUSTOMERNAME FROM CUSTOMERS
  LEFT JOIN EMPLOYEES ON CUSTOMERS.SALESREPEMPLOYEENUMBER = EMPLOYEES.EMPLOYEENUMBER;

-- Aggregate Functions
-- 25. Find the total of all payments made by each customer (98)
-- 26. Find the largest payment made by a customer (1)
-- 27. Find the average payment made by a customer (1)
-- 28. What is the total number of products per product line (7)
-- 29. What is the number of orders per status (6)
-- 30. List all offices and the number of employees working in each office (7)


-- Having
-- 31. List the total number of products per product line where number of products > 3 (6)
-- 32. List the product lines and vendors for product lines which are supported by < 5 vendors
-- (3)


-- Computations
-- 33. What product that makes us the most money (qty*price) (1)
-- 34. What is the profit per product (MSRP-buyprice) (110)


-- Set Operations
-- 35. List all customers who didn't order in 2015 (78)
-- 36. List all people that we deal with (employees and customer contacts). Display first name,
-- last name, company name (or employee) (145)


-- Subqueries
-- 37. List the products in the product line with the most number of products (38)
-- 38. Find the first name and last name of all customer contacts whose customer is located in
-- the same state as the San Francisco office. (11)
-- 39. What is the customer and sales person of the highest priced order? (1)


-- Recursion
-- 40. What is the manager who manages the greatest number of employees (2)
-- 41. Select all employees who work for the manager that manages the greatest number of
-- employee (12)
-- 42. List all employees that have the same last name. Make sure each combination is listed
-- only once (5)