

  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
  OPTIONS()
  as with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`order_items`
)

select
  cast(id as string)         as order_item_id,
  cast(order_id as string)   as order_id,
  cast(user_id as string)    as user_id,
  cast(product_id as string) as product_id,
  sale_price,
  status as item_status
from src;

