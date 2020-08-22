-- Find which genres of movies are most popular with renters
-- Output: genre, rental_count

with film_rentals as (
    SELECT rental_id, inventory_id
    FROM rental
),
film_rent_count as (
    SELECT inv.film_id, COUNT(fr.rental_id) as rental_count
    FROM film_rentals fr
    INNER JOIN inventory inv
    ON fr.inventory_id = inv.inventory_id
    GROUP BY inv.film_id
),
film_genres as (
    SELECT fc.category_id, SUM(frc.film_id) as category_rental_count
    FROM film_rent_count frc
    INNER JOIN film_category fc
    ON frc.film_id = fc.film_id
    GROUP BY fc.category_id
)
SELECT * 
FROM film_genres;

SELECT count(*)
FROM rental;