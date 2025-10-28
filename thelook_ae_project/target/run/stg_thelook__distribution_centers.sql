

  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
  OPTIONS()
  as with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`distribution_centers`
)

select
  cast(id as string) as distribution_center_id,
  name               as distribution_center_name,
  latitude,
  longitude
from src;

