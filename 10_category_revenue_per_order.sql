USE ecommerce_analytics;

SELECT
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) AS orders_containing_category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT oi.order_id),
        2
    ) AS revenue_per_category_order
FROM order_items AS oi
JOIN orders AS o
    ON oi.order_id = o.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
  AND p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT oi.order_id) >= 100
ORDER BY revenue_per_category_order DESC
LIMIT 10;