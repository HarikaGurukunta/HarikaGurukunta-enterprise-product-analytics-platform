# Enterprise Product Analytics Platform

## Overview

This project analyzes customer behavior, product sales, web funnel activity, retention, and revenue trends using Python, SQL, and Power BI.

## Business Objective

The goal of this project is to help business teams understand customer behavior, product performance, and revenue growth opportunities through analytics dashboards and SQL reporting.

## Key Analytics

- Customer 360 Analysis
- Product Performance Analysis
- Monthly Revenue Trend
- Customer Lifetime Value (CLV)
- Funnel Analysis
- Cohort Analysis
- Retention Analysis
- Executive KPI Reporting

## Tech Stack

- Python
- Pandas
- NumPy
- SQL
- Power BI
- Data Modeling
- ETL Pipeline

## Project Structure

```text
enterprise-product-analytics-platform/
├── README.md
├── data/
│   ├── raw/
│   └── processed/
├── python/
│   ├── generate_data.py
│   └── etl_pipeline.py
├── sql/
│   ├── create_tables.sql
│   └── analytics_queries.sql
└── screenshots/
```

## Datasets

### Customers
- customer_id
- customer_name
- age
- city
- signup_date

### Products
- product_id
- product_name
- category
- price

### Orders
- order_id
- customer_id
- product_id
- order_date
- quantity
- revenue

### Web Events
- event_id
- customer_id
- event_type
- event_date

## Dashboard Pages

### Executive Overview
- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

### Revenue Analysis
- Monthly Revenue Trend
- Revenue by Category
- Top Revenue Products

### Customer 360
- Customer Segmentation
- Top Customers
- Customer Lifetime Value

### Product Performance
- Best Selling Products
- Revenue by Product Category

### Funnel Analysis
- Page View
- Product View
- Add to Cart
- Checkout
- Purchase

### Cohort & Retention
- Monthly Cohort Analysis
- Customer Retention Rate
- Repeat Customer Analysis

## Project Workflow

1. Generate synthetic datasets using Python
2. Load raw datasets into analytics environment
3. Execute ETL pipeline
4. Perform data quality validation
5. Run SQL analytics queries
6. Build Power BI dashboards
7. Publish business insights

## Author

Harika G
