{{ config(materialized='table') }}

select
  cast(order_id as integer) as order_id,
  cast(customer_id as integer) as customer_id,
  cast(product_id as integer) as product_id,
  cast(quantity as integer) as quantity,
  cast(unit_price as decimal(12,2)) as unit_price,
  cast(order_ts as timestamp) as order_ts
from {{ ref('bronze_orders') }}
