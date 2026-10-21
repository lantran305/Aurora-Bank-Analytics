import os
import pandas as pd
from pathlib import Path
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# Load environment variables
load_dotenv(Path(__file__).parent / ".env")

# Connect to PostgreSQL
url = URL.create(
    "postgresql+psycopg2",
    username=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    host=os.getenv("DB_HOST"),
    port=int(os.getenv("DB_PORT")),
    database=os.getenv("DB_NAME")
)

engine = create_engine(url)

# Import Excel files
folder = Path(__file__).parent / "raw_data"

for file in folder.glob("*.csv"):
    df = pd.read_csv(file)
    table_name = file.stem.lower().replace(" ", "_")

    df.to_sql(
        table_name,
        engine,
        schema="raw",
        if_exists="fail",
        index=False
    )

    print(f"Imported {table_name}: {len(df)} rows")