-- Identify the highest-priced pizza

SELECT 
    P1.name, MAX(P2.price)
FROM
    pizza_types AS P1
        LEFT JOIN
    pizzas AS P2 ON P1.pizza_type_id = P2.pizza_type_id
GROUP BY P1.name
ORDER BY MAX(P2.price) DESC
LIMIT 1;