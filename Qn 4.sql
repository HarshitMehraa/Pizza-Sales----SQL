-- Identify the most common pizza size ordered.

SELECT 
    P.Size, COUNT(O.order_details_id) AS Total_Orders
FROM
    pizzas AS P
        JOIN
    order_details AS O ON P.pizza_id = O.pizza_id
GROUP BY P.Size
ORDER BY Total_Orders DESC
LIMIT 1;