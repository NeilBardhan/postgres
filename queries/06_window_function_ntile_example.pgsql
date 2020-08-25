-- Get top 5% of customers by spending
SELECT *
FROM (  
        SELECT customer_id,
        amount,
        NTILE(20) OVER ntile_window AS quartile
        FROM payment
        WINDOW ntile_window AS
                (PARTITION BY customer_id ORDER BY amount DESC)
        ORDER BY customer_id, amount DESC
    ) sub
WHERE sub.quartile = 1;