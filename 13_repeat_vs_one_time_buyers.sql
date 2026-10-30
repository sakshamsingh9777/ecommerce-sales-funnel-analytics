USE ecommerce_analytics;

WITH customer_revenue AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS delivered_orders,
        SUM(oi.price) AS total_revenue
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN delivered_orders = 1 THEN 'One-time buyer'
        ELSE 'Repeat buyer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_customer,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM customer_revenue
GROUP BY customer_type
ORDER BY avg_revenue_per_customer DESC;