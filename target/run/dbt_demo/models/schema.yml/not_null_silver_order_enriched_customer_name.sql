
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_name
from "demo"."analytics_silver"."silver_order_enriched"
where customer_name is null



  
  
      
    ) dbt_internal_test