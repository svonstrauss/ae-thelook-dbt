with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`distribution_centers`
)

select
  cast(id as string) as distribution_center_id,
  name               as distribution_center_name,
  latitude,
  longitude
from src