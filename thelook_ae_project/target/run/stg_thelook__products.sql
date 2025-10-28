

  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
  OPTIONS()
  as with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`products`
)

select
  cast(id as string)                      as product_id,
  category,
  department,
  cast(distribution_center_id as string)  as distribution_center_id
from src;

