-- Find which genres of movies are most popular with renters
-- Output: genre, rental_count

with film_rentals as (
    SELECT rental_id, inventory_id
    FROM rental
), -- This gets all the inventory/film ids that have been rented
film_rent_count as (
    SELECT inv.film_id, COUNT(fr.rental_id) as rental_count
    FROM film_rentals fr
    INNER JOIN inventory inv
    ON fr.inventory_id = inv.inventory_id
    GROUP BY inv.film_id
), -- This gets the film id for all the rented films along with the rental counts for each film id
film_genres as (
    SELECT fc.category_id, COUNT(frc.film_id) as category_rental_count
    FROM film_rent_count frc
    INNER JOIN film_category fc
    ON frc.film_id = fc.film_id
    GROUP BY fc.category_id
), -- This gets the film genre ID corresponding to each film id, while keeping the rental counts
cat_names as (
    SELECT ct.name as category_name, fg.category_rental_count as category_count
    FROM category ct
    INNER JOIN film_genres fg
    ON ct.category_id = fg.category_id
) -- This gets the name of the film categories, while keeping the rental count from the previous temp table
SELECT * 
FROM cat_names
ORDER BY category_count DESC;