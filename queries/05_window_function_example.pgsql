-- Get top 2 trx by spending per customer

SELECT sub.* FROM
(
    SELECT customer_id, amount,
        DENSE_RANK() OVER 
        (PARTITION BY customer_id ORDER BY amount DESC)
        AS rank
    FROM payment
) sub
where sub.rank < 3;