
  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
      
    partition by timestamp_trunc(order_date, day)
    cluster by user_id

    OPTIONS()
    as (
      

with
order_items as (
  select
    order_item_id,
    order_id,
    product_id,
    user_id,
    sale_price,
    item_status
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
),
orders as (
  select
    cast(order_id as string)   as order_id,
    cast(user_id  as string)   as user_id,
    order_date,
    status as order_status
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
),
products as (
  select
    product_id,
    category,
    department,
    distribution_center_id
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
),
dc as (
  select
    distribution_center_id,
    distribution_center_name
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
)

select
  oi.order_item_id,
  o.order_id,
  o.user_id,
  o.order_date,
  o.order_status,
  oi.sale_price,
  oi.product_id,
  p.distribution_center_id,
  p.category  as product_category,
  p.department as product_department,
  dc.distribution_center_name
from order_items oi
join orders  o  on oi.order_id = o.order_id
left join products p on oi.product_id = p.product_id
left join dc       on p.distribution_center_id = dc.distribution_center_id
    );
  