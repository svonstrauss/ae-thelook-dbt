
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_date
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
where order_date is null



  
  
      
    ) dbt_internal_test