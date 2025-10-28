{{ config(
    materialized='table',
    partition_by={"field":"order_date","data_type":"timestamp"},
    cluster_by=["user_id"]
) }}

with
order_items as (
  select
    cast(id as string)         as order_item_id,
    cast(order_id as string)   as order_id,
    cast(product_id as string) as product_id,
    sale_price
  from {{ source('thelook','order_items') }}
),
orders as (
  select
    cast(order_id as string)   as order_id,
    cast(user_id  as string)   as user_id,
    order_date,
    status as order_status
  from {{ ref('stg_thelook__orders') }}
),
products as (
  select
    cast(id as string) as product_id,
    category,
    department,
    cast(distribution_center_id as string) as distribution_center_id
  from {{ source('thelook','products') }}
),
dc as (
  select
    cast(id as string) as distribution_center_id,
    name as distribution_center_name
  from {{ source('thelook','distribution_centers') }}
)

select
  oi.order_item_id,
  o.order_id,
  o.user_id,
  o.order_date,
  o.order_status,
  oi.sale_price,
  oi.product_id,
  p.category  as product_category,
  p.department as product_department,
  dc.distribution_center_name
from order_items oi
join orders  o  on oi.order_id = o.order_id
left join products p on oi.product_id = p.product_id
left join dc       on p.distribution_center_id = dc.distribution_center_id
