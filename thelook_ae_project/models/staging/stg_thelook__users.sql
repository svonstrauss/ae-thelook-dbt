with src as (
  select * from {{ source('thelook','users') }}
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
