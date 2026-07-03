import pandas as pd

print("Starting ETL Pipeline...")

# Load data
customers = pd.read_csv("data/raw/customers.csv")
products = pd.read_csv("data/raw/products.csv")
orders = pd.read_csv("data/raw/orders.csv")
web_events = pd.read_csv("data/raw/web_events.csv")

# Data Quality Checks
print("Customers Shape:", customers.shape)
print("Products Shape:", products.shape)
print("Orders Shape:", orders.shape)
print("Web Events Shape:", web_events.shape)

# Remove duplicates
customers = customers.drop_duplicates()
products = products.drop_duplicates()
orders = orders.drop_duplicates()
web_events = web_events.drop_duplicates()

# Handle null values
customers = customers.fillna("Unknown")
products = products.fillna("Unknown")
orders = orders.fillna(0)
web_events = web_events.fillna("Unknown")

# Save processed data
customers.to_csv("data/processed/customers_clean.csv", index=False)
products.to_csv("data/processed/products_clean.csv", index=False)
orders.to_csv("data/processed/orders_clean.csv", index=False)
web_events.to_csv("data/processed/web_events_clean.csv", index=False)

print("ETL Pipeline Completed Successfully!")
