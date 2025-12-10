-- Analyze the cumulative revenue generated over time
 
WITH Sales AS (SELECT Orders.Order_date, SUM(order_details.quantity*pizzas.price) AS Rev FROM order_details
JOIN Pizzas ON order_details.pizza_id=pizzas.pizza_id JOIN orders ON orders.Order_id=order_details.order_id
GROUP BY Orders.Order_date)

SELECT Order_date, Sum(Rev) OVER (Order by Order_date) FROM Sales;

