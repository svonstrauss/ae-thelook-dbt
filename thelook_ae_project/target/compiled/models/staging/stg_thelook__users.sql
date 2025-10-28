with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`users`
)
select
  cast(id as string)            as user_id,
  first_name,
  last_name,
  email,
  gender,
  country,
  traffic_source,
  cast(created_at as timestamp) as signup_ts
from src