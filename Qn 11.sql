-- Calculate the percentage contribution of each pizza type to total revenue

SELECT 
    P1.category AS Cat,
    (SUM(O.quantity * P2.price) / (SELECT 
            SUM(O.quantity * P2.price)
        FROM
            order_details AS O
                JOIN
            pizzas AS P2 ON O.pizza_id = P2.pizza_id) * 100) AS Rev
FROM
    pizza_types AS P1
        JOIN
    pizzas AS P2 ON P1.pizza_type_id = P2.pizza_type_id
        JOIN
    order_details AS O ON P2.pizza_id = O.pizza_id
GROUP BY Cat
ORDER BY Rev DESC;


