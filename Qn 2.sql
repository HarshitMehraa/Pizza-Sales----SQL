-- Calculate the total revenue generated from pizza sales

SELECT 
    SUM(O.quantity * P.price) AS Total_Revenue
FROM
    order_details AS O
        LEFT JOIN
    pizzas AS P ON O.pizza_id = P.pizza_id;