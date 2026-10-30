USE ecommerce_analytics;

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One order'
        WHEN total_orders = 2 THEN 'Two orders'
        ELSE 'Three or more orders'
    END AS customer_order_group,
    COUNT(*) AS total_customers
FROM customer_orders
GROUP BY customer_order_group
ORDER BY total_customers DESC;
