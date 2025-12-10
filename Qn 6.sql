-- Join the necessary tables to find the total quantity of each pizza category ordered

SELECT 
    P1.category, SUM(O.quantity) AS Total_Qunat
FROM
    pizza_types AS P1
        JOIN
    pizzas AS P2 ON P1.pizza_type_id = P2.pizza_type_id
        JOIN
    order_details AS O ON P2.pizza_id = O.pizza_id
GROUP BY P1.category;