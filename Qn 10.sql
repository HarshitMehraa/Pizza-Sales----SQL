-- Determine the top 3 most ordered pizza types based on revenue

SELECT 
    P1.name, SUM(O.quantity * P2.price) AS Revenue
FROM
    pizza_types AS P1
        JOIN
    pizzas AS P2 ON P1.pizza_type_id = P2.pizza_type_id
        JOIN
    order_details AS O ON P2.pizza_id = O.pizza_id
GROUP BY P1.name
ORDER BY Revenue DESC
LIMIT 3;