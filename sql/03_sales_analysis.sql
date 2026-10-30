
USE ecommerce_analytics;

-- 1. Overall product revenue
SELECT
    ROUND(SUM(price), 2) AS total_product_revenue
FROM order_items;

-- 2. Overall freight charges
SELECT
    ROUND(SUM(freight_value), 2) AS total_freight_value
FROM order_items;

-- 3. Revenue and freight combined
SELECT
    ROUND(SUM(price + freight_value), 2) AS total_order_item_value
FROM order_items;

-- 4. Payment method analysis
SELECT
    payment_type,
    COUNT(*) AS payment_records,
    ROUND(SUM(payment_value), 2) AS total_payment_value
FROM payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;
