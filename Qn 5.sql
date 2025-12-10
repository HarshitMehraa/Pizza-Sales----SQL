-- List the top 5 most ordered pizza types along with their quantities

SELECT 
    P2.name, SUM(O.Quantity) AS Quant
FROM
    pizzas AS P1
        JOIN
    pizza_types AS P2 ON P1.pizza_type_id = P2.pizza_type_id
        JOIN
    order_details AS O ON P1.pizza_id = O.pizza_id
GROUP BY P2.name
ORDER BY Quant DESC
LIMIT 5;