with dc as (
  select * from {{ ref('stg_thelook__distribution_centers') }}
)

select
  distribution_center_id,
  distribution_center_name,
  latitude,
  longitude
from dc
