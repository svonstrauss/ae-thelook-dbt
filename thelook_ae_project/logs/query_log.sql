-- created_at: 2025-10-26T05:18:06.134095+00:00
-- finished_at: 2025-10-26T05:18:08.482058+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","connection_name":""} */

    select distinct schema_name from `gold-yen-476203-m8`.INFORMATION_SCHEMA.SCHEMATA;
  ;
-- created_at: 2025-10-26T05:18:08.518523+00:00
-- finished_at: 2025-10-26T05:18:10.685485+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.stg_thelook__users
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `gold-yen-476203-m8`.`thelook_dev_staging`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2025-10-26T05:18:08.519979+00:00
-- finished_at: 2025-10-26T05:18:10.718897+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.stg_thelook__orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `gold-yen-476203-m8`.`thelook_dev_staging`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2025-10-26T05:18:10.691936+00:00
-- finished_at: 2025-10-26T05:18:12.203608+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.stg_thelook__users
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"model.thelook_ae_project.stg_thelook__users"} */


  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__users`
  OPTIONS()
  as with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`users`
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
from src;

;
-- created_at: 2025-10-26T05:18:10.723124+00:00
-- finished_at: 2025-10-26T05:18:12.203608+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.stg_thelook__orders
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"model.thelook_ae_project.stg_thelook__orders"} */


  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
  OPTIONS()
  as with src as (
  select * from `bigquery-public-data`.`thelook_ecommerce`.`orders`
)

select
  cast(order_id  as string)   as order_id,
  cast(user_id   as string)   as user_id,
  cast(created_at as timestamp) as order_date,
  status,
  shipped_at,
  delivered_at,
  returned_at
from src;

;
-- created_at: 2025-10-26T05:18:12.207409+00:00
-- finished_at: 2025-10-26T05:18:14.272608+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.fct_order_items
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `gold-yen-476203-m8`.`thelook_dev_marts`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2025-10-26T05:18:14.495445+00:00
-- finished_at: 2025-10-26T05:18:50.913561+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.fct_order_items
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"model.thelook_ae_project.fct_order_items"} */

  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
      
    partition by timestamp_trunc(order_date, day)
    cluster by user_id

    OPTIONS()
    as (
      

with
order_items as (
  select
    cast(id as string)         as order_item_id,
    cast(order_id as string)   as order_id,
    cast(product_id as string) as product_id,
    sale_price
  from `bigquery-public-data`.`thelook_ecommerce`.`order_items`
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
    cast(id as string) as product_id,
    category,
    department,
    cast(distribution_center_id as string) as distribution_center_id
  from `bigquery-public-data`.`thelook_ecommerce`.`products`
),
dc as (
  select
    cast(id as string) as distribution_center_id,
    name as distribution_center_name
  from `bigquery-public-data`.`thelook_ecommerce`.`distribution_centers`
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
    );
  ;
-- created_at: 2025-10-26T05:18:50.920373+00:00
-- finished_at: 2025-10-26T05:19:01.362874+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: model.thelook_ae_project.dim_users
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"model.thelook_ae_project.dim_users"} */

  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_users`
      
    
    

    OPTIONS()
    as (
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
    );
  ;
