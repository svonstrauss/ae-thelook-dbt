
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
where product_id is null



  
  
      
    ) dbt_internal_test