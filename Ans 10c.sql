Show databases;
SELECT 
    cat.name AS category_name,
    COUNT(r.rental_id) AS rental_count
FROM category cat
JOIN film_category fc
    ON cat.category_id = fc.category_id
JOIN inventory i
    ON fc.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY cat.name
ORDER BY rental_count DESC
LIMIT 3;

SELECT 
    s.store_id,
    COUNT(i.inventory_id) AS total_films,
    SUM(CASE 
            WHEN r.rental_id IS NULL THEN 1 
            ELSE 0 
        END) AS never_rented
FROM store s
JOIN inventory i
    ON s.store_id = i.store_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY s.store_id;











