CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE fact_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    revenue DECIMAL(10,2)
);

CREATE TABLE fact_web_events (
    event_id INT PRIMARY KEY,
    customer_id INT,
    event_type VARCHAR(50),
    event_date DATE
);
