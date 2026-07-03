import pandas as pd
import numpy as np

np.random.seed(42)

customers = pd.DataFrame({
    "customer_id": range(1, 1001),
    "age": np.random.randint(18, 70, 1000),
    "city": np.random.choice(
        ["New York", "Chicago", "Dallas", "Los Angeles"],
        1000
    )
})

customers.to_csv("customers.csv", index=False)

print("Customer data generated successfully!")
