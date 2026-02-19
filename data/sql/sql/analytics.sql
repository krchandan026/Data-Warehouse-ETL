-- Total Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales_fact;

-- Revenue by Category
SELECT category, SUM(quantity * price) AS revenue
FROM sales_fact
GROUP BY category
ORDER BY revenue DESC;

-- Top Customers
SELECT c.customer_name,
       SUM(s.quantity * s.price) AS total_spent
FROM sales_fact s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- Daily Sales Trend
SELECT order_date,
       SUM(quantity * price) AS daily_sales
FROM sales_fact
GROUP BY order_date
ORDER BY order_date;
