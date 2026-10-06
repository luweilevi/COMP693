
import os
import sys
from pathlib import Path

import psycopg2

def execute_sql_file():
    sql_file = Path("init.sql")

    if not sql_file.exists():
        print(f"SQL file not found: {sql_file}")
        sys.exit(1)

    # Read database configuration from environment variables
    host = os.getenv("DB_HOST")
    port = os.getenv("DB_PORT", "5432")
    database = os.getenv("DB_NAME")
    username = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")

    if not all([host, database, username, password]):
        print("Missing database environment variables.")
        sys.exit(1)

    try:
        print(f"Connecting to PostgreSQL: {host}:{port}/{database}")

        with psycopg2.connect(
            host=host,
            port=port,
            dbname=database,
            user=username,
            password=password,
        ) as connection:

            print("Connected to PostgreSQL.")

            sql = sql_file.read_text(encoding="utf-8")

            with connection.cursor() as cursor:
                cursor.execute(sql)

            connection.commit()

            print(f"Successfully executed: {sql_file}")

    except psycopg2.Error as error:
        print(f"PostgreSQL error: {error}")
        sys.exit(1)

    except Exception as error:
        print(f"Unexpected error: {error}")
        sys.exit(1)


if __name__ == "__main__":
    execute_sql_file()

