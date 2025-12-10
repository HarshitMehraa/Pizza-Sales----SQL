-- Group the orders by date and calculate the average number of pizzas ordered per day

WITH Total_Ordered AS (SELECT 
    DAY(O.order_date) AS Order_by_Date, SUM(O1.quantity) AS Total_Orders
FROM
    orders AS O
        JOIN
    order_details AS O1 ON O.order_id = O1.order_id
GROUP BY Order_by_Date)

SELECT ROUND(AVG(Total_Orders),0) AS Avg_Pizza_per_day FROM Total_Ordered;