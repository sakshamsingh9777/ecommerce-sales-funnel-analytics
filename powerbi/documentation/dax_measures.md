# Power BI — DAX Measures

This document explains the DAX measures used in the E-Commerce Sales & Delivery Analytics dashboard.

## 1. Average Order Value

```dax
Average Order Value =
DIVIDE(
    SUM('ecommerce_analytics order_items'[price]),
    DISTINCTCOUNT('ecommerce_analytics order_items'[order_id]),
    0
)
```

**Purpose:** Calculates average product revenue per unique order.

**Calculation:** Total product revenue / Distinct order count.

*Note: Freight charges are excluded.*

## 2. Average Delivery Days

```dax
Average Delivery Days =
AVERAGEX(
    FILTER(
        'ecommerce_analytics orders',
        NOT ISBLANK('ecommerce_analytics orders'[order_delivered_customer_date]) &&
        'ecommerce_analytics orders'[order_delivered_customer_date] <> "" &&
        NOT ISBLANK('ecommerce_analytics orders'[order_purchase_timestamp])
    ),
    DATEDIFF(
        'ecommerce_analytics orders'[order_purchase_timestamp],
        'ecommerce_analytics orders'[order_delivered_customer_date],
        DAY
    )
)
```

**Purpose:** Calculates the average calendar days between purchase and customer delivery.

## 3. Late Delivery Rate (%)

```dax
Late Delivery Rate (%) =
DIVIDE(
    [Late Orders],
    [Late Orders] + [On-Time Orders],
    0
)
```

**Purpose:** Calculates the percentage of classified delivered orders that arrived late.

## 4. Late Orders

```dax
Late Orders =
COUNTROWS(
    FILTER(
        'ecommerce_analytics orders',
        NOT ISBLANK('ecommerce_analytics orders'[order_delivered_customer_date]) &&
        NOT ISBLANK('ecommerce_analytics orders'[order_estimated_delivery_date]) &&
        'ecommerce_analytics orders'[order_delivered_customer_date] >
        'ecommerce_analytics orders'[order_estimated_delivery_date]
    )
)
```

**Purpose:** Counts delivered orders whose actual delivery date was later than the estimated delivery date.

## 5. On-Time Orders

```dax
On-Time Orders =
COUNTROWS(
    FILTER(
        'ecommerce_analytics orders',
        NOT ISBLANK('ecommerce_analytics orders'[order_delivered_customer_date]) &&
        NOT ISBLANK('ecommerce_analytics orders'[order_estimated_delivery_date]) &&
        'ecommerce_analytics orders'[order_delivered_customer_date] <=
        'ecommerce_analytics orders'[order_estimated_delivery_date]
    )
)
```

**Purpose:** Counts delivered orders whose actual delivery date was earlier than or equal to the estimated delivery date.

## Notes

- Delivery measures exclude orders with missing actual or estimated delivery dates.
- Results can change with report filters and slicers.
- Average Order Value uses product prices and excludes freight charges.
- Late Delivery Rate is calculated from the Late Orders and On-Time Orders measures.