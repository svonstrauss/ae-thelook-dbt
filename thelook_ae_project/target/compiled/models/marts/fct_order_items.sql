

-- Fact table at the order item grain. Supports revenue and item-level analysis by user, product, and fulfillment.

with
order_items as (
  -- Staging provides clean ids and consistent types
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
  -- Order header adds order_date and overall order status
  select
    cast(order_id as string) as order_id,
    cast(user_id  as string) as user_id,
    order_date,
    status as order_status
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
),
products as (
  -- Product attributes and the distribution center foreign key
  select
    product_id,
    category,
    department,
    distribution_center_id
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
),
distribution_centers as (
  -- Distribution center reference data
  select
    distribution_center_id,
    distribution_center_name
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
)

select
  order_items.order_item_id,
  orders.order_id,
  orders.user_id,
  orders.order_date,
  orders.order_status,
  order_items.sale_price,
  order_items.product_id,
  products.distribution_center_id,
  products.category as product_category,
  products.department as product_department,
  distribution_centers.distribution_center_name
from order_items
join orders on order_items.order_id = orders.order_id
left join products on order_items.product_id = products.product_id
left join distribution_centers on products.distribution_center_id = distribution_centers.distribution_center_id

where orders.order_date > (
  select coalesce(max(order_date), cast('1970-01-01' as timestamp))
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
)
