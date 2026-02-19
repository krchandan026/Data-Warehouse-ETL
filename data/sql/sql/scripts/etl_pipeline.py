import pandas as pd
import sqlite3

# Load raw data
df = pd.read_csv("data/sales_raw.csv")

# Clean data
df.drop_duplicates(inplace=True)
df.fillna(0, inplace=True)

# Split tables
customers = df[["customer_id", "customer_name"]].drop_duplicates()
sales = df.drop(columns=["customer_name"])

# Connect to database
conn = sqlite3.connect("warehouse.db")

# Load tables
customers.to_sql("customers", conn, if_exists="replace", index=False)
sales.to_sql("sales_fact", conn, if_exists="replace", index=False)

conn.commit()
conn.close()

print("ETL pipeline completed successfully")
