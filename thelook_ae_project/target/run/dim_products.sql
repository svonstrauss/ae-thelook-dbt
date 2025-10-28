
  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_products`
      
    
    

    OPTIONS()
    as (
      with p as (
  select * from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
)

select
  product_id,
  category,
  department,
  distribution_center_id
from p
    );
  