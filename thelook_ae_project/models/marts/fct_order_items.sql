{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    incremental_strategy='insert_overwrite',
    partition_by={"field":"order_date","data_type":"timestamp"},
    cluster_by=["user_id"]
) }}

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
  from {{ ref('stg_thelook__order_items') }}
),
orders as (
  -- Order header adds order_date and overall order status
  select
    cast(order_id as string) as order_id,
    cast(user_id  as string) as user_id,
    order_date,
    status as order_status
  from {{ ref('stg_thelook__orders') }}
),
products as (
  -- Product attributes and the distribution center foreign key
  select
    product_id,
    category,
    department,
    distribution_center_id
  from {{ ref('stg_thelook__products') }}
),
distribution_centers as (
  -- Distribution center reference data
  select
    distribution_center_id,
    distribution_center_name
  from {{ ref('stg_thelook__distribution_centers') }}
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
{% if is_incremental() %}
where orders.order_date > (select max(order_date) from {{ this }})
{% endif %}
