-- Determine the top 3 most ordered pizza types based on revenue for each pizza category

WITH SS AS (WITH Sale AS (SELECT 
    P1.category, P1.name, SUM(O.quantity * P2.price) AS Total_Rev
FROM
    pizza_types AS P1
        JOIN
    pizzas AS P2 ON P1.pizza_type_id = P2.pizza_type_id
        JOIN
    order_details AS O ON O.pizza_id = P2.pizza_id
GROUP BY P1.category, P1.name
ORDER BY Total_Rev DESC)

SELECT category, name, Total_Rev,
dense_rank () OVER (partition by category ORDER BY Total_Rev DESC) as Max_3
From Sale)

SELECT * FROM SS where Max_3<=3;