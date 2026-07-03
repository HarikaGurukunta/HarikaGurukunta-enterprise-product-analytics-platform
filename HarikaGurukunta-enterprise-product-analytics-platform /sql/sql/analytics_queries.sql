-- Customer Lifetime Value
SELECT
    customer_id,
    SUM(revenue) AS customer_lifetime_value
FROM fact_orders
GROUP BY customer_id;

-- Top Customers
SELECT
    customer_id,
    SUM(revenue) AS total_revenue
FROM fact_orders
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;
