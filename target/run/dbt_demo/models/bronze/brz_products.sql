
  
    
    

    create  table
      "demo"."analytics_bronze"."brz_products__dbt_tmp"
  
    as (
      

select
  cast(product_id as integer) as product_id,
  trim(product_name) as product_name,
  trim(product_category) as product_category,
  cast(active_from as date) as active_from
from "demo"."analytics_bronze"."bronze_products"
    );
  
  