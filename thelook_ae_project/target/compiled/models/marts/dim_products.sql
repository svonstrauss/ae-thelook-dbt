with p as (
  select * from `gold-yen-476203-m8`.`ae_dev_thelook_dev_staging`.`stg_thelook__products`
)

select
  product_id,
  category,
  department,
  distribution_center_id
from p