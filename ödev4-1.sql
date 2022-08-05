SELECT COUNT(*) FROM film
WHERE length > (SELECT AVG(length) FROM film);


SELECT COUNT(*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film );


(SELECT * FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film ))
INTERSECT
(SELECT * FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film ));

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id = ANY (SELECT DISTINCT(customer_id) FROM payment)
GROUP BY customer_id
ORDER BY SUM(amount) DESC;
