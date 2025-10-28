
  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_distribution_centers`
      
    
    

    OPTIONS()
    as (
      with dc as (
  select * from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
)

select
  distribution_center_id,
  distribution_center_name,
  latitude,
  longitude
from dc
    );
  