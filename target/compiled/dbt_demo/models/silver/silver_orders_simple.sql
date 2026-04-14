

select
  order_id,
  customer_id,
  product_id,
  quantity,
  unit_price,
  quantity * unit_price as line_total,
  cast(order_ts as date) as order_date
from "demo"."analytics_bronze"."brz_orders"
where quantity > 0