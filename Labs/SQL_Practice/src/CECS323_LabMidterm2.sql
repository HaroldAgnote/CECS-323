-- 1. List the last name and the first name of the manager(s) who employ the most
-- employees, and the number of employees that that manager employs (2)

SELECT manager.LASTNAME, manager.FIRSTNAME FROM EMPLOYEES manager
        INNER JOIN
        (SELECT REPORTSTO, COUNT(REPORTSTO) as count FROM EMPLOYEES
                GROUP BY REPORTSTO) employee
        ON manager.EMPLOYEENUMBER = employee.REPORTSTO
WHERE employee.count = (SELECT MAX(counts)
                        FROM (select E.REPORTSTO, COUNT(E.REPORTSTO) as counts
                              FROM employees E
                              GROUP BY E.REPORTSTO) maximum);


-- 2. List the customer name of all customers who have never ordered any product
-- from the 'Classic Cars' Productline (28)

SELECT CUSTOMERNAME FROM CUSTOMERS
WHERE CUSTOMERNAME NOT IN
(SELECT CUSTOMERNAME FROM CUSTOMERS
            NATURAL JOIN ORDERS
            NATURAL JOIN ORDERDETAILS
            INNER JOIN PRODUCTS USING (PRODUCTCODE)
    WHERE PRODUCTLINE = 'Classic Cars');

-- 3. List the customers who share the same postal code. Make sure that no pair of
--  customers shows up more than once. Order by the first customer name, then the
-- second (35)

SELECT one.CUSTOMERNAME AS "First Customer", two.CUSTOMERNAME as "Other Customer" FROM (

        (SELECT CUSTOMERNAME,POSTALCODE FROM CUSTOMERS ) one

        INNER JOIN

        (SELECT CUSTOMERNAME, POSTALCODE FROM CUSTOMERS ) two

        USING (POSTALCODE))

WHERE one.POSTALCODE = two.POSTALCODE AND one.CUSTOMERNAME < two.CUSTOMERNAME
ORDER BY one.CUSTOMERNAME, two.CUSTOMERNAME;


-- 4. List the customers who have never placed an order in an odd numbered year.
-- Derby has a mod function that takes two arguments: the expression to find the
-- modulus of, and the modulus. So mod(7, 3) would return a value of 1. (37)

SELECT CUSTOMERNAME FROM CUSTOMERS WHERE CUSTOMERNAME NOT IN
(SELECT CUSTOMERNAME FROM CUSTOMERS
        INNER JOIN ORDERS USING (CUSTOMERNUMBER)
    WHERE MOD(YEAR(ORDERDATE),2) = 1);

-- 5. List the productLines(s) that have the fewest products in that product line,
--  and the number of products in that product line. (1)


SELECT PRODUCTLINE, COUNT(PRODUCTLINE) as count FROM PRODUCTS INNER JOIN
    (SELECT MIN(count) as minimum FROM
        (SELECT PRODUCTLINE, COUNT(PRODUCTLINE) as count FROM PRODUCTS GROUP BY PRODUCTLINE ) productCounts) small

    ON count = minimum

GROUP BY PRODUCTLINE;

