-- Customer Ranking
SELECT
customer_name,
SUM(sales) AS total_sales,
RANK() OVER (ORDER BY SUM(sales) DESC) AS customer_rank
FROM sales_data
GROUP BY customer_name;

-- Top Product per Category
SELECT *
FROM (
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales,
        RANK() OVER(
        PARTITION BY category
        ORDER BY SUM(sales) DESC
        ) AS rank_in_category
    FROM sales_data
    GROUP BY category, product_name
) t
WHERE rank_in_category = 1;

-- Running Sales Total
SELECT
date_id,
sales,
SUM(sales) OVER( ORDER BY date_id) AS running_total_sales
FROM sales_data;

-- Top Sales per Category
WITH customer_sales AS (
SELECT
customer_name,
SUM(sales) AS total_sales
FROM sales_data
GROUP BY customer_name
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC;