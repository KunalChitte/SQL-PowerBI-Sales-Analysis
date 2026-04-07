-- Sales by region
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Profitability by category
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- Top 10 cities by sales
SELECT TOP 10
    city,
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY city, state
ORDER BY total_sales DESC;

-- Most profitable products
SELECT TOP 10
product_name,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_profit DESC;