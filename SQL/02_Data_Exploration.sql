-- View The Data
SELECT TOP 20 *
FROM Sales_Data;

-- Total Rows Count
SELECT COUNT(*) AS total_rows
FROM Sales_Data;

-- Data Range
SELECT 
    MIN(date_id) AS first_order,
    MAX(date_id) AS last_order
FROM Sales_Data;

-- Distinct Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM Sales_Data;

-- Distict Products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM Sales_Data;

-- Core Business KPIs
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS avg_discount
FROM Sales_Data;

-- Sales by Category
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- Top 10 products by sales
SELECT TOP 10
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC;

-- Top 10 customers by sales
SELECT TOP 10
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
GROUP BY customer_name
ORDER BY total_sales DESC;

-- Monthly sales trend
SELECT 
    year,
    month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY year, month
ORDER BY year, month;