-- Task 3

SELECT *
FROM customer AS c
JOIN orders AS o ON c.id = o.customer_id
WHERE c.citystatezip = 'Jamaica, NY 11435'
	AND (
		date_part('month', c.birthdate) >= 6
		AND date_part('month', c.birthdate) <= 7
	)
	AND EXISTS (
		SELECT 1
		FROM orders
		WHERE customer_id = c.id
		AND date_part('year', shipped) = 2017
	);
