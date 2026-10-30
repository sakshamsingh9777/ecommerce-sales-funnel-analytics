USE ecommerce_analytics;

SELECT
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS delivered_orders,

    COUNT(DISTINCT CASE
        WHEN o.order_delivered_customer_date
             > o.order_estimated_delivery_date
        THEN o.order_id
    END) AS late_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN o.order_delivered_customer_date
                 > o.order_estimated_delivery_date
            THEN o.order_id
        END)
        / COUNT(DISTINCT o.order_id),
        2
    ) AS late_delivery_pct

FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
  AND p.product_category_name IS NOT NULL

GROUP BY p.product_category_name

HAVING COUNT(DISTINCT o.order_id) >= 100

ORDER BY late_delivery_pct DESC
LIMIT 15;