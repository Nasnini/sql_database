Installing Postgres
apt-get install postgresql postgresql-contrib

Activating the Database:

    In this project, we will be using PostresSQL
    1. In the database folder, toy will find the docker composition file namely, "docker-compose.yaml".
    2. Once in this folder, you will 'docker-compose up' to start up the database.

    Please note: You don't have to be in a virtual environment to launch the database but you have to have Postgres installed so it is good practice to activate before you get started

Instructions:

    PART 1: Creating a database
    Create a database called “Umuzi”.

    Create the following tables in the Umuzi database:
        Customers
        Employees
        Orders
        Payments
        Products

    Create a primary key for each table with auto-increment (make sure you correctly specify the data types, e.g. the ID field should be int).

    Create foreign keys so that every ID in the order table references an existing ID in the tables referenced (e.g., ProductID, EmployeeID, etc).

    INSERT the records in the tables below into the table you created in step 2.

    Document what information is stored in your database. Be sure to say what information is kept in what table, and which keys link the records between tables.


    PART 2: Quering the database
    1. SELECT ALL records from table Customers.

    2. SELECT records only from the name column in the Customers table.

    3. Show the name of the Customer whose CustomerID is 1.

    4. UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.

    5. DELETE the record from the Customers table for customer 2 (CustomerID = 2).

    6. Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.

    7. Return the MAXIMUM payment made on the PAYMENTS table.

    8. Select all customers from the “Customers” table, sorted by the “Country” column.

    9. Select all products with a price BETWEEN R100 and R600.

    10. Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.

    11. Select all fields from “Customers” where city is “Cape Town” OR “Durban”.

    12. Select all records from Products where the Price is GREATER than R500.

    13. Return the sum of the Amounts on the Payments table.

    14. Count the number of shipped orders in the Orders table.

    15. Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).

    16. Using INNER JOIN create a query that selects all Payments with Customer information.

    17. Select all products that have turnable front wheels.