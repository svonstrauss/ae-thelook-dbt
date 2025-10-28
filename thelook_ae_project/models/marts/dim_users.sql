-- Customer dimension with user attributes and lifecycle signals like first order date and order count

with users as (
  select * from {{ ref('stg_thelook__users') }}
),
orders_by_user as (
  select
    user_id,
    min(order_date) as first_order_date,
    count(*)        as orders_count
  from {{ ref('fct_order_items') }}
  group by user_id
)
select
  users.user_id,
  users.first_name,
  users.last_name,
  users.email,
  users.gender,
  users.country,
  users.traffic_source,
  orders_by_user.first_order_date,
  orders_by_user.orders_count,
  case
    when coalesce(orders_by_user.orders_count, 0) = 0 then 'No Orders'
    when orders_by_user.orders_count = 1 then 'New'
    else 'Returning'
  end as customer_type
from users
left join orders_by_user on users.user_id = orders_by_user.user_id
