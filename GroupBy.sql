use sakila;
select * from payment;

SELECT customer_id, count(amount) as 'Total transaction ' from payment group by customer_id;

-- Q number of transaction for each customer where amount > 3
SELECT customer_id, count(amount) as 'Total transaction ' from payment where amount>3 group by customer_id ; 

-- Q u need to find the total number of transaction for each amount in the month of may
-- MONTH(payment_date)  extract (month payment_date)
SELECT amount, count(amount) as 'Total Transaction'   from payment  where MONTH(payment_date)=5 group by amount ; 

-- Q u need to find out the maximum amount spend, avg amount spend  and the total amount spend for each staff
SELECT staff_id, max(amount) as 'MAX AMOUNT',avg(amount) as 'AVG AMOUNT ',sum(amount) as 'TOTAL AMOUNT' from payment group by staff_id;

-- Q u need to find out the maximum amount spend, avg amount spend  and the total amount spend for each staff only for the customer id 1,3,7,11
SELECT staff_id, max(amount) as 'MAX AMOUNT',avg(amount) as 'AVG AMOUNT ',sum(amount) as 'TOTAL AMOUNT' from payment where customer_id in(1,3,7,11) group by staff_id;

-- Q find the total amount spend and the number of customer who have done the payment in each month where the amount spend should be greater than 1 doller
SELECT month(payment_Date),count(customer_id),sum(amount) from payment  where amount>1 group by month(payment_Date);

SELECT year(payment_Date),month(payment_date), count(customer_id) from payment group by year(payment_date),month(payment_date);


-- what are data model 
-- what is cardinality
-- what are the type of relationship in dbms