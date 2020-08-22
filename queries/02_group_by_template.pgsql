-- Count of films by MPAA rating

SELECT rating, count(title) as film_count
FROM film
GROUP BY rating;

-- Average running length of movies by rating

SELECT rating, ROUND(avg(length), 2) as avg_runtime
FROM film
GROUP BY rating
ORDER BY avg(length) DESC;