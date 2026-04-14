
  
    
    

    create  table
      "demo"."analytics_silver"."silver_order_metrics__dbt_tmp"
  
    as (
      

select
  concat(customer_tier, '_', product_category) as metric_key,
  customer_tier,
  product_category,
  count(*) as order_rows,
  sum(line_total) as gross_sales
from "demo"."analytics_silver"."silver_order_enriched"
group by 1,2,3
    );
  
  