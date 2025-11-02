
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- Fails if any order_item has a negative sale_price
select order_item_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
where sale_price < 0
  
  
      
    ) dbt_internal_test