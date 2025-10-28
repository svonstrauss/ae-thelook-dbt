with src as (
  select * from {{ source('thelook','distribution_centers') }}
)

select
  cast(id as string) as distribution_center_id,
  name               as distribution_center_name,
  latitude,
  longitude
from src
