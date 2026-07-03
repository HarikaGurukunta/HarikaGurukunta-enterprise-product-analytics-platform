import pandas as pd
import numpy as np

np.random.seed(42)

# Customers Data
customers = pd.DataFrame({
    "customer_id": range(1, 1001),
    "customer_name": [f"Customer_{i}" for i in range(1, 1001)],
    "age": np.random.randint(18, 70, 1000),
    "city": np.random.choice(
        ["New York", "Chicago", "Dallas", "Los Angeles"],
        1000
    ),
    "signup_date": pd.date_range(
        start="2023-01-01",
        periods=1000,
        freq="D"
    )
})

# Products Data
products = pd.DataFrame({
    "product_id": range(1, 101),
    "product_name": [f"Product_{i}" for i in range(1, 101)],
    "category": np.random.choice(
        ["Electronics", "Clothing", "Home", "Beauty"],
        100
    ),
    "price": np.round(
        np.random.uniform(10, 500, 100),
        2
    )
})

# Orders Data
orders = pd.DataFrame({
    "order_id": range(1, 10001),
    "customer_id": np.random.randint(1, 1001, 10000),
    "product_id": np.random.randint(1, 101, 10000),
    "order_date": pd.to_datetime(
        np.random.choice(
            pd.date_range("2023-01-01", "2025-12-31"),
            10000
        )
    ),
    "quantity": np.random.randint(1, 5, 10000)
})

orders = orders.merge(
    products[["product_id", "price"]],
    on="product_id"
)

orders["revenue"] = orders["quantity"] * orders["price"]

# Web Events Data
web_events = pd.DataFrame({
    "event_id": range(1, 20001),
    "customer_id": np.random.randint(1, 1001, 20000),
    "event_type": np.random.choice(
        ["Page View", "Product View", "Add to Cart", "Checkout", "Purchase"],
        20000
    ),
    "event_date": pd.to_datetime(
        np.random.choice(
            pd.date_range("2023-01-01", "2025-12-31"),
            20000
        )
    )
})

# Save Files
customers.to_csv("data/raw/customers.csv", index=False)
products.to_csv("data/raw/products.csv", index=False)
orders.to_csv("data/raw/orders.csv", index=False)
web_events.to_csv("data/raw/web_events.csv", index=False)

print("Customer, product, order, and web event data generated successfully!")
