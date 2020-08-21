-- Finding the 5 longest running films in our films database

SELECT title, length as runtime
FROM film
ORDER BY length DESC
LIMIT 5;

-- Finding the 5 longest film titles in our films database

SELECT title, length(title) as title_len
FROM film
ORDER BY length(title) DESC
LIMIT 5;

-- Finding the top 5 customers by rental count

SELECT 
    c.customer_id, c.first_name, c.last_name,
    count(p.rental_id) as trx_count
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY count(p.rental_id) DESC
LIMIT 5;

-- Finding the top 5 customers by total spend

SELECT 
    c.customer_id, c.first_name, c.last_name,
    SUM(p.amount) as total_spend
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 5;
