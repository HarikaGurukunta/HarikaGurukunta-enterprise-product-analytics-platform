-- Customer Lifetime Value (CLV)
SELECT
    customer_id,
    SUM(revenue) AS customer_lifetime_value
FROM fact_orders
GROUP BY customer_id;

-- Top 10 Customers by Revenue
SELECT
    customer_id,
    SUM(revenue) AS total_revenue
FROM fact_orders
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM fact_orders
GROUP BY month
ORDER BY month;

-- Top Products by Revenue
SELECT
    product_id,
    SUM(revenue) AS revenue
FROM fact_orders
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;
