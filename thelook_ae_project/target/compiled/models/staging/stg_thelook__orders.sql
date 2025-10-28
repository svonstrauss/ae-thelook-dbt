with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`orders`
)

select
  cast(order_id  as string)   as order_id,
  cast(user_id   as string)   as user_id,
  cast(created_at as timestamp) as order_date,
  status,
  shipped_at,
  delivered_at,
  returned_at
from src