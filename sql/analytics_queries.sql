-- Revenue by Product Category
SELECT
    p.category,
    SUM(o.revenue) AS total_revenue
FROM fact_orders o
JOIN dim_products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Monthly Order Volume
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(order_id) AS total_orders
FROM fact_orders
GROUP BY month
ORDER BY month;
