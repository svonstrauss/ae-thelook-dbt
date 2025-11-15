
      
  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_snapshots`.`orders_snapshot`
      
    
    

    
    OPTIONS()
    as (
      
    

    select *,
        to_hex(md5(concat(coalesce(cast(order_id as string), ''), '|',coalesce(cast(
    current_timestamp()
 as string), '')))) as dbt_scd_id,
        
    current_timestamp()
 as dbt_updated_at,
        
    current_timestamp()
 as dbt_valid_from,
        
  
  coalesce(nullif(
    current_timestamp()
, 
    current_timestamp()
), null)
  as dbt_valid_to
from (
        


select *
from `bigquery-public-data`.`thelook_ecommerce`.`orders`


    ) sbq



    );
  
  