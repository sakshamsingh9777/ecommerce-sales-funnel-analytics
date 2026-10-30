USE ecommerce_analytics;

SELECT
    DATE_FORMAT(
        order_purchase_timestamp,
        '%Y-%m'
    ) AS purchase_month,

    COUNT(*) AS delivered_orders,

    SUM(
        CASE
            WHEN order_delivered_customer_date
                 > order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS late_orders,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_delivered_customer_date
                     > order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS late_delivery_pct

FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL

GROUP BY DATE_FORMAT(
    order_purchase_timestamp,
    '%Y-%m'
)
ORDER BY purchase_month;
