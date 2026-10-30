
USE ecommerce_analytics;

SELECT
    p.product_category_name,
    COUNT(*) AS units_sold,
    COUNT(DISTINCT oi.order_id) AS orders_containing_category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(AVG(oi.price), 2) AS average_item_price
FROM order_items AS oi
JOIN orders AS o
    ON oi.order_id = o.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;
