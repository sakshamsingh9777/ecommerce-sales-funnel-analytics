
USE ecommerce_analytics;

SELECT
    p.product_id,
    p.product_category_name,
    COUNT(*) AS units_sold,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(AVG(oi.price), 2) AS average_item_price
FROM order_items AS oi
JOIN orders AS o
    ON oi.order_id = o.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY
    p.product_id,
    p.product_category_name
ORDER BY product_revenue DESC
LIMIT 10;
