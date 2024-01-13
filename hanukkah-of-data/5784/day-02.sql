SELECT
	c.*,
	regexp_extract_all(c.name, '[A-Z]') AS initials
FROM customer AS c
JOIN orders AS o ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN product AS p ON oi.sku = p.sku
WHERE
	initials = ['J', 'P']
	AND o.shipped <= '2017-12-31'
	AND o.shipped >= '2017-01-01'
	AND p.description LIKE '%Bagel%';

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
