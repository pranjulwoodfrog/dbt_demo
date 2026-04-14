{{ config(materialized='table') }}

select
  concat(customer_tier, '_', product_category) as metric_key,
  customer_tier,
  product_category,
  count(*) as order_rows,
  sum(line_total) as gross_sales
from {{ ref('silver_order_enriched') }}
group by 1,2,3
