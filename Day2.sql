CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);




SELECT * FROM orders;

-- with inner join we use On 
-- three query are give us same output 
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c join Orders as O where c.customer_id=o.customer_id;

-- INNER JOIN => (COMMON ELEMENT)
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c inner join Orders as O on c.customer_id=o.customer_id;
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c inner join Orders as O  using(customer_id);

-- LEFT JOIN => is use when we need the all column of left table (JOIN SE PEHLE ) *** Customers left join Orders (Customer is the Left Table)
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c LEFT JOIN Orders as O on c.customer_id=o.customer_id;

-- RIGHT JOIN => is use when we need the all column of right table ( JOIN KE BAD) ** Customers right join orders (Orders is the Right Table)
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c RIGHT JOIN Orders as O on c.customer_id=o.customer_id;

-- NATURAL JOIN => it is used when we need to print the common column if present then it print it otherwise its print some random output
--              => its act like cross join if their are  no any common column is present 
SELECT c.customer_id, c.customer_name, o.customer_id,o.order_id,o.amount FROM Customers as c NATURAL JOIN Orders as O;

SELECT  c.customer_name, sum(o.amount) FROM Customers as c inner join Orders as O  using(customer_id)  group by c.customer_name;


