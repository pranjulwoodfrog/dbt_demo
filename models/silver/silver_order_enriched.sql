{{ config(materialized='table') }}

with latest_products as (
  select
    product_id,
    product_name,
    product_category
  from (
    select
      product_id,
      product_name,
      product_category,
      active_from,
      row_number() over (
        partition by product_id
        order by active_from desc
      ) as rn
    from {{ ref('brz_products') }}
  ) p
  where rn = 1
)

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
left join latest_products p
  on o.product_id = p.product_id
