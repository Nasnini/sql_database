--Part 1: Data Definition

/* Creating the Umuzi database */

CREATE DATABASE Umuzi;

/*  Note that I could only declare CHARACTER instead of VARCHAR
    as my data type for many column names
*/

/*Creatign the table into Umuzi Database */
CREATE TABLE customers (
    customerid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    gender character varying NOT NULL,
    address character varying(200) NOT NULL,
    phone character varying NOT NULL,
    email character varying(100) NOT NULL,
    city character varying(20),
    country character varying(50),
    PRIMARY KEY (customerid)
); 

CREATE TABLE employees (
    employeeid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    jobtitle character varying(20) NOT NULL,
    PRIMARY KEY (employeeid)
);

CREATE TYPE status
AS ENUM(
    'Shipped',
    'Not shipped'
)

CREATE TABLE orders (
    orderid integer NOT NULL,
    productid integer NOT NULL,
    paymentid integer NOT NULL,
    fulfilledbyemployeeid integer NOT NULL,
    daterequired date NOT NULL,
    dateshipped date,
    status STATUS,
    PRIMARY KEY (orderid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    FOREIGN KEY(paymentid) REFERENCES payments(paymentid)
);

CREATE TABLE payments (
    customerid integer NOT NULL,
    paymentid integer NOT NULL,
    paymentdate date NOT NULL,
    amount real NOT NULL,
    PRIMARY KEY (paymentid),
    FOREIGN KEY(customerid) REFERENCES customers(customerid)
);

CREATE TABLE products(
    productname integer NOT NULL, 
    description character, 
    buyprice real NOT NUll,
    PRIMARY KEY (productid)
);

/* Populating the customer table */
INSERT INTO customers (firstname, lastname, gender, address, phone, email, city, country)
VALUES(   
    'Thando', 'Sithole', 'Female', '240' 'Sect 1', '0794445584', 'thando@gmail.com', 'Cape Town', 'South Africa'),
	('Leon', 'Glen', 'Male', '81 Everton Rd, Gillits', '0820832830', 'Leon@gmail.com', 'Durban', 'South Africa'),
	('Charl','Muller', 'Male', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com', 'Berlin', 'Germany'),
	('Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'Js234@yahoo.com', 'Frankfurt', 'Germany'),
	('Lerato', 'Mabitso', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa'
    );

	
/* Populating the employee table*/
INSERT INTO employees (firstname, lastname, email, jobtitle)
VALUES(
    'Kani', 'Matthew',	'mat@gmail.com', 'Manager'),
    ('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
    ('Gideon', 'Maduka', 'm@gmail.com', 'Accountant'
    );

/* Populating the payments table*/
INSERT INTO payments (customerid, paymentdate, amount)
VALUES(
    1, '2018-01-09', 150.75),
    (5, '2018-03-09', 150.75),
    (4, '2018-03-09', 700.599976
    );

/* Populating the orders table*/
INSERT INTO orders (productid, paymentid, fulfilledbyemployeeid, daterequired, dateshipped, status)
VALUES(
    1,	1,	2,	'2018-05-09', DEFAULT, 'Not Shipped'),
	1,	2,	2,	'2018-04-09',	'2018-03-09', 'Shipped'),
	3,	3,	3,	'2018-06-09', DEFAULT,'Not Shipped'
    );

/* Populating the products table*/
INSERT INTO products(productname, description, buyprice)
	('Harley Davidson Chopper', 'This replica features working kickstand', 'front suspension', 'gear-shifting lever', 150.75),
	('Classic Car',	'Turnable front wheels', 'steering function', 550.75),
	('Sports car', 'Turnable front wheels', 'steering function', 700.599976
    );

-- PART 2 - Queries

    --1. SELECT ALL records from table Customers.
    SELECT * 
    FROM customers;

    --2. SELECT records only from the name column in the Customers table.
    SELECT firstname 
    FROM customers;

    --3. Show the name of the Customer whose CustomerID is 1.
    SELECT * 
    FROM customers 
    WHERE customerid = '1';

    --4. UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.
    UPDATE customers 
    SET firstname = 'Lerato', 
    lastname = 'Mabitso' 
    WHERE customerid=1;

    --5. DELETE the record from the Customers table for customer 2 (CustomerID = 2).
    DELETE FROM customers 
    WHERE customerid=2;

    --6. Select all unique statuses from the Orders table and get a count of the number of orders for each unique 	status.
    SELECT DISTINCT status, 
    COUNT(DISTINCT status) 
    FROM orders 
    GROUP BY status;

    --7. Return the MAXIMUM payment made on the PAYMENTS table.
    SELECT MAX(amount) FROM payments;

    --8. Select all customers from the “Customers” table, sorted by the “Country” column.
    SELECT * FROM Customers ORDER BY Country ASC;

    --9. Select all products with a price BETWEEN R100 and R600.
    SELECT buyprice BETWEEN '100' AND '600' FROM products;

    --10. Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.
    SELECT * FROM customers WHERE country = 'Germany' AND city='Berlin';

    --11. Select all fields from “Customers” where city is “Cape Town” OR “Durban”.
    SELECT * FROM customers 
    WHERE city='Cape Town' or city='Durban';

    --12. Select all records from Products where the Price is GREATER than R500.
    SELECT * FROM products 
    WHERE buyprice > 500;

    --13. Return the sum of the Amounts on the Payments table.
    SELECT SUM(amount)
    FROM payments;

    --14. Count the number of shipped orders in the Orders table.
    SELECT COUNT(status)
    FROM orders
    WHERE status = 'Shipped';

    --15. Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to 		the Dollar).
    select AVG(buyprice*12) from products;

    --16. Using INNER JOIN create a query that selects all Payments with Customer information.
    SELECT customers.customerid, payments.paymentid
    FROM customers
    INNER JOIN payments
    ON customers.customerid = customers.customerid;

    -- 17. Select all products that have turnable front wheels.
    SELECT * FROM products
    WHERE description LIKE '%Turnable front wheels%';
