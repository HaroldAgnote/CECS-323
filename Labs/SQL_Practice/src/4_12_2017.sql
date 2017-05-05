--Step 3
/*
SELECT PRODUCTNAME, "Value"
FROM PRODUCTS INNER JOIN
    (SELECT PRODUCTCODE, "Value"
        FROM (SELECT PRODUCTCODE))
*/

--Step 4

CREATE VIEW maxSales AS
    SELECT PRODUCTCODE, SUM(PRICEEACH*QUANTITYORDERED) "Value"
    FROM ORDERDETAILS
    GROUP BY PRODUCTCODE;

-- Step 5

SELECT PRODUCTNAME, "Value"
FROM PRODUCTS INNER JOIN
    (SELECT PRODUCTCODE, "Value" FROM maxSales
    WHERE "Value" =
          (SELECT max("Value") FROM maxSales)) maxv1
    USING (PRODUCTCODE);