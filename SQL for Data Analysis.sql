SELECT * FROM sakila.customer;
SELECT * FROM sakila.store;


# Q2 SELECT with WHERE
SELECT * FROM SAKILA.CUSTOMER
WHERE STORE_ID = 1;

# Q3 ORDER BY
SELECT First_name, last_name
from sakila.customer
order by last_name asc;

# Q4 GROUP BY with COUNT
 SELECT store_id, COUNT(customer_id) AS total_customers
 FROM sakila.customer
 GROUP BY store_id;
 
 
 # Q5 INNER JOIN (Customer + Store)
 SELECT c.customer_id, c.first_name, c.last_name, s.store_id
FROM sakila.customer c
INNER JOIN sakila.store s
ON c.store_id = s.store_id;

#	Q6 LEFT JOIN
SELECT c.first_name, s.store_id
from sakila.customer c
left join sakila.store s
on c.store_id = s.store_id;

# Q7 Subquery Example
SELECT first_name, last_name
FROM sakila.customer
WHERE store_id = (
    SELECT store_id
    FROM sakila.store
    WHERE store_id = 1
);


# Q8 Create View for Analysis
CREATE VIEW customer_store_summary AS
SELECT store_id, COUNT(customer_id) AS total_customers
FROM sakila.customer
GROUP BY store_id;

SELECT * FROM customer_store_summary;


# Q9 Top 5 customers alphabetically
SELECT first_name, last_name
FROM sakila.customer
ORDER BY first_name
LIMIT 5;

# 	Q10  Find store with maximum customers
SELECT store_id, count(customer_id) AS total_customers
from sakila.customer
group by store_id
order by total_customerS desc
LIMIT 1;

# Q11 Find customers whose last name starts with 'S'
SELECT first_name, last_name
from sakila.customer
where first_name like 's%';


# 	Q12 Find duplicate email addresses
SELECT email, COUNT(*) AS count_email
FROM sakila.customer
GROUP BY email
HAVING COUNT(*) > 1;

# Q13 Find customers from store 1 but sort by last name descending
select first_name, last_name
from sakila.customer
where store_id = 1
order by last_name desc;

# Q 14 Find customers who belong to the store with store_id = 2 using subquery.
select first_name, last_name
from sakila.customer
where store_id = (
select store_id
from sakila.store
where store_id =2
);


# Q15 Show stores having more than 3 customers.
SELECT store_id, COUNT(customer_id) AS total_customers
FROM sakila.customer
GROUP BY store_id
HAVING COUNT(customer_id) > 3;