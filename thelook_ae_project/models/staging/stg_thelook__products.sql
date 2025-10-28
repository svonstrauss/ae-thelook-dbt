with src as (
  select * from {{ source('thelook','products') }}
)

select
  cast(id as string)                      as product_id,
  category,
  department,
  cast(distribution_center_id as string)  as distribution_center_id
from src
