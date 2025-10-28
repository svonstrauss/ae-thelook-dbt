
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_users`
where user_id is null



  
  
      
    ) dbt_internal_test