with u as (
  select * from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__users`
),
o as (
  select user_id, min(order_date) as first_order_date, count(*) as orders_count
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
  group by 1
)
select
  u.user_id,
  u.first_name, u.last_name, u.email, u.gender, u.country, u.traffic_source,
  o.first_order_date,
  o.orders_count,
  case when coalesce(o.orders_count,0)=0 then 'No Orders'
       when o.orders_count=1 then 'New'
       else 'Returning' end as customer_type
from u
left join o using (user_id)