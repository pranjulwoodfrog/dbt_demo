

select
  cast(customer_id as integer) as customer_id,
  trim(customer_name) as customer_name,
  trim(customer_tier) as customer_tier
from "demo"."analytics_bronze"."bronze_customers"