USE ecommerce_analytics;

SELECT
    COUNT(*) AS delivered_orders,

    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,

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
    ) AS late_delivery_pct,

    ROUND(
        AVG(
            CASE
                WHEN order_delivered_customer_date
                     > order_estimated_delivery_date
                THEN DATEDIFF(
                    order_delivered_customer_date,
                    order_estimated_delivery_date
                )
            END
        ),
        2
    ) AS avg_days_late

FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;
