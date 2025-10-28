with src as (
  select * from {{ source('thelook','order_items') }}
)

select
  cast(id as string)         as order_item_id,
  cast(order_id as string)   as order_id,
  cast(user_id as string)    as user_id,
  cast(product_id as string) as product_id,
  sale_price,
  status as item_status
from src
