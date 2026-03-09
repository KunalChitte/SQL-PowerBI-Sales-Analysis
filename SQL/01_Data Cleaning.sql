-- Check for NULL values
SELECT *
FROM sales_data
WHERE
    order_id IS NULL
    OR customer_name IS NULL
    OR product_name IS NULL
    OR sales IS NULL
    OR profit IS NULL;

-- Check duplicate orders
    SELECT
    order_id,
    COUNT(*) AS Count
FROM sales_data
GROUP BY order_id
HAVING COUNT(*) > 1;