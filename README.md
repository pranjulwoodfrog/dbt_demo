# dbt Demo (DuckDB, local)

This demo is isolated from Trino and runs fully local using DuckDB.

## Flow
- Bronze seeds: `bronze_orders`, `bronze_customers`, `bronze_products`
- Bronze models: `brz_orders`, `brz_customers`, `brz_products`
- Silver 1 (multi-join): `silver_order_enriched`
- Silver 2 (derived aggregate): `silver_order_metrics`

## Why tests fail on old branch
`silver_order_enriched` joins directly to `brz_products`, where product `101` exists twice.
That duplicates order rows and breaks `unique(order_id)`.

## Commands
```bash
cd /Users/p/woodfrog/antvia/dbt_demo
export DBT_PROFILES_DIR=/Users/p/woodfrog/antvia/dbt_demo/.dbt

../.venv/bin/dbt seed
../.venv/bin/dbt run
../.venv/bin/dbt test

# docs
../.venv/bin/dbt docs generate
../.venv/bin/dbt docs serve --port 8085
```
