# Project Documentation

## 1. Project Background
This project analyses the Brazilian E-Commerce Public Dataset by Olist to understand sales performance, customer purchasing patterns, product performance, payment behaviour, and delivery operations.

## 2. Dataset
**Source:** [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The analysis uses these core tables:
- Customers
- Orders
- Order Items
- Products
- Payments

## 3. Tools Used
- MySQL
- MySQL Workbench
- SQL
- GitHub

## 4. Analysis Modules

| Module | Analysis |
|---|---|
| Database setup | Database preparation and validation |
| Sales | Revenue and monthly sales trends |
| Payments | Payment method analysis |
| Products | Product and category performance |
| Customers | Purchase frequency and customer revenue |
| Delivery | Delivery time, delays, and delivery KPIs |

## 5. SQL Techniques
- Aggregate functions
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Subqueries
- Date functions
- Data validation

## 6. Key Performance Indicators
- Total product revenue
- Total orders
- Average order value
- Average delivery time
- Late delivery performance

## 7. Limitations
- Customer purchase frequency is based on the available order history.
- Product revenue is calculated from item prices and excludes freight.
- Delivery metrics depend on valid purchase, estimated delivery, and actual delivery timestamps.

## 8. Future Improvements
- Add customer segmentation using RFM analysis.
- Analyse repeat purchase rates over time.
- Improve delivery performance analysis by geographic region.
- Build an interactive dashboard using Power BI.
## 9. How to Run the Project

### Prerequisites
- MySQL Server 8.0 or later
- MySQL Workbench
- Brazilian E-Commerce Public Dataset by Olist

### Setup
1. Download the dataset from the Kaggle source linked in the main README.
2. Open MySQL Workbench and connect to your MySQL server.
3. Create or select the database `ecommerce_analytics`.
4. Import the required Olist CSV files into their corresponding tables.
5. Run the database setup and data validation scripts.
6. Execute the analysis scripts in the `sql/` folder.

### Analysis Scripts
The SQL scripts are organised into sales, payment, product, customer, and delivery analysis.

**Note:** The dataset must be imported with the expected table and column names before running the analysis queries.
## 10. SQL Script Guide

| Script | Purpose |
|---|---|
| 01 | Database setup |
| 02 | Data validation |
| 03 | Sales analysis |
| 04 | Monthly sales trends |
| 05 | Monthly revenue growth |
| 06 | Payment analysis |
| 07 | Product performance |
| 08 | Product categories |
| 09 | Category analysis |
| 10 | Category revenue per order |
| 11 | Customer purchase frequency |
| 12 | Top customers by revenue |
| 13 | Repeat vs. one-time buyers |
| 14 | Delivery performance |
| 15 | Monthly delivery performance |
| 16 | Late delivery by state |
| 17 | Late delivery by category |
| 18 | Delivery KPI summary |
