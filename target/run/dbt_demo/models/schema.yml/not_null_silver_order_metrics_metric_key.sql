
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select metric_key
from "demo"."analytics_silver"."silver_order_metrics"
where metric_key is null



  
  
      
    ) dbt_internal_test