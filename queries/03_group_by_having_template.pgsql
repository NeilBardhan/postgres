-- Getting all customers who have more than 5 trx

SELECT 
    c.customer_id, c.first_name, c.last_name, c.store_id, 
    count(p.rental_id) as trx_count, sum(p.amount) as total_spend
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING count(p.rental_id) > 5
ORDER BY c.first_name;

-- Getting all customers who have spent more than $50

SELECT 
    c.customer_id, c.first_name, c.last_name, c.store_id, 
    count(p.rental_id) as trx_count, sum(p.amount) as total_spend
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING sum(p.amount) > 50
ORDER BY c.first_name;