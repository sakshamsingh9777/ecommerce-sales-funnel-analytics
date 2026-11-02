# Power BI Data Model

## 1. Overview

The E-Commerce Sales & Delivery Analytics project uses a relational data model consisting of five tables imported from the Olist Brazilian E-Commerce dataset.

The model connects customer, order, product, order-item and payment information to support sales and delivery analysis.

## 2. Tables

| Table | Description |
|---|---|
| customers | Customer details, including customer ID, city and state |
| orders | Order information, purchase dates, delivery dates and order status |
| order_items | Product-level order details, including price and freight value |
| products | Product details and product categories |
| payments | Payment methods, payment values and installment information |

## 3. Relationships

The Power BI model contains four relationships:

| One-side table | Many-side table | Cardinality |
|---|---|---|
| customers | orders | One-to-many (1:*) |
| products | order_items | One-to-many (1:*) |
| orders | order_items | One-to-many (1:*) |
| orders | payments | One-to-many (1:*) |

## 4. Relationship Structure

- One customer can have multiple orders.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- One order can have multiple payment records.

## 5. Analytical Applications

This data model supports:

- Sales and revenue analysis.
- Product category performance.
- Customer purchase behaviour.
- Payment method analysis.
- Order status analysis.
- Delivery time and delivery performance analysis.

## 6. Model Notes

- The model uses order IDs, customer IDs and product IDs to connect the tables.
- The payments-to-orders relationship appears to use bidirectional cross-filtering in the current Power BI model.
- Relationship direction and filter behaviour should be reviewed when modifying the model to avoid ambiguous filtering or unexpected totals.