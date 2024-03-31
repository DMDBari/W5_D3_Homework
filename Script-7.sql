-- Question 1 --
SELECT first_name, last_name, district 
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district LIKE 'Texas';

-- Question 2 --
SELECT first_name, last_name, amount
FROM customer c 
JOIN payment p
ON c.customer_id = p.customer_id
WHERE amount > 7;

-- Question 3 --
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

-- Question 4 --
SELECT first_name, last_name, c.address_id, a.city_id, c2.country_id, country
FROM customer c 
JOIN address a
ON c.address_id = a.address_id
JOIN city c2 
ON c2.city_id = a.city_id
JOIN country c3 
ON c3.country_id = c2.country_id
WHERE country LIKE 'Argentina';

-- Question 5 --
SELECT c.category_id, "name", count(*) 
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY "name", c.category_id 
ORDER BY count(*) DESC;

-- Question 6 --
SELECT * 
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	ORDER BY count(*) DESC
	LIMIT 1
);

-- Question 7 --
SELECT a.actor_id, first_name, last_name, count(*)
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY count(*)
LIMIT 1;

-- Question 8 --
SELECT c.country_id, country, count(*)
FROM country c 
JOIN city c2 
ON c.country_id = c2.country_id
GROUP BY c.country_id
ORDER BY count(*) DESC
LIMIT 3;

-- Question 9 --
SELECT a.actor_id, first_name, last_name, count(*)
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(*) <= 25 AND COUNT(*) >= 20;
