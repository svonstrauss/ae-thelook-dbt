with p as (
  select * from {{ ref('stg_thelook__products') }}
)

select
  product_id,
  category,
  department,
  distribution_center_id
from p
