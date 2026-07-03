-- Customer Lifetime Value
SELECT
    customer_id,
    SUM(revenue) AS customer_lifetime_value
FROM fact_orders
GROUP BY customer_id
ORDER BY customer_lifetime_value DESC;

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

-- Cohort Analysis
WITH customer_cohort AS (
    SELECT
        customer_id,
        MIN(DATE_TRUNC('month', order_date)) AS cohort_month
    FROM fact_orders
    GROUP BY customer_id
)
SELECT
    cohort_month,
    COUNT(DISTINCT customer_id) AS customers
FROM customer_cohort
GROUP BY cohort_month
ORDER BY cohort_month;

-- Funnel Analysis
SELECT
    event_type,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM fact_web_events
GROUP BY event_type
ORDER BY unique_customers DESC;

-- Retention Analysis
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM fact_orders
    GROUP BY customer_id
),
repeat_customers AS (
    SELECT
        o.customer_id,
        COUNT(o.order_id) AS total_orders
    FROM fact_orders o
    GROUP BY o.customer_id
)
SELECT
    COUNT(CASE WHEN total_orders > 1 THEN customer_id END) AS repeat_customers,
    COUNT(customer_id) AS total_customers,
    ROUND(
        COUNT(CASE WHEN total_orders > 1 THEN customer_id END) * 100.0
        / COUNT(customer_id),
        2
    ) AS retention_rate_percentage
FROM repeat_customers;
