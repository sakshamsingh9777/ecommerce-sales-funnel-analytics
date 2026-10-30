# E-Commerce Sales & Customer Analytics

## Project Overview
This project explores the Brazilian E-Commerce Public Dataset by Olist using MySQL. It focuses on analysing sales performance, customer behaviour, product categories, payments, and delivery performance.

## Objectives
- Analyse overall sales and revenue.
- Identify top-performing product categories.
- Understand customer purchasing behaviour.
- Examine payment methods and order patterns.
- Evaluate delivery performance.

## Tools & Technologies
- MySQL
- MySQL Workbench
- SQL

## Dataset
Source: [Brazilian E-Commerce Public Dataset by Olist – Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## SQL Concepts Used
- SELECT, WHERE, ORDER BY
- Aggregate functions
- GROUP BY and HAVING
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Date and time analysis

## Project Structure
ecommerce-sales-funnel-analytics/
│
├── README.md
│
├── sql/
│   │
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   │
│   ├── 03_sales_analysis.sql
│   ├── 04_monthly_sales_trends.sql
│   ├── 05_monthly_revenue_growth.sql
│   │
│   ├── 06_payment_analysis.sql
│   │
│   ├── 07_product_performance.sql
│   ├── 08_product_categories.sql
│   ├── 09_category_analysis.sql
│   ├── 10_category_revenue_per_order.sql
│   │
│   ├── 11_customer_purchase_frequency.sql
│   ├── 12_top_customers_by_revenue.sql
│   ├── 13_repeat_vs_one_time_buyers.sql
│   │
│   ├── 14_delivery_performance.sql
│   ├── 15_monthly_delivery_performance.sql
│   ├── 16_late_delivery_by_state.sql
│   ├── 17_late_delivery_by_category.sql
│   └── 18_delivery_kpi_summary.sql
│
├── screenshots/
│   ├── revenue_analysis.png
│   ├── customer_analysis.png
│   └── delivery_analysis.png
│
└── docs/
    └── project_documentation.md

## Key Findings
## Project Insights

### 1. Overall Sales Performance
- Total orders analysed: **99,441**
- Total product revenue: **R$13,591,643.70**
- Average order value: **R$137.50**
- Product revenue excludes freight charges.

### 2. Customer Behaviour
- Repeat customers generated an average revenue of **R$260.05 per customer**.
- One-time buyers generated an average revenue of **R$137.96 per customer**.
- The analysis identified **2,801 repeat customers** among 93,358 unique buyers.

### 3. Product Category Performance
- The `beleza_saude` category generated **R$1,233,131.72** in product revenue.
- Product category analysis helps identify important revenue-generating segments.

### 4. Delivery Performance
- Average delivery time: **12.50 days**.
- Delivery performance was analysed using actual and estimated delivery dates.

### 5. Business Recommendations
- Encourage repeat purchases through customer retention campaigns.
- Focus marketing efforts on high-revenue product categories.
- Monitor delivery delays to improve customer experience.
- Use payment and sales trends to support business decisions.

## Author
Saksham Singh
