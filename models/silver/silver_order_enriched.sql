{{ config(materialized='table') }}

select
  o.order_id,
  o.customer_id,
  c.customer_name,
  c.customer_tier,
  o.product_id,
  p.product_name,
  p.product_category,
  o.quantity,
  o.unit_price,
  o.quantity * o.unit_price as line_total,
  cast(o.order_ts as date) as order_date
from {{ ref('brz_orders') }} o
left join {{ ref('brz_customers') }} c
  on o.customer_id = c.customer_id
left join {{ ref('brz_products') }} p
  on o.product_id = p.product_id
