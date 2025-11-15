
   
      -- generated script to merge partitions into `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
      declare dbt_partitions_for_replacement array<timestamp>;

      
      
       -- 1. create a temp table with model data
        
  
    

    create or replace table `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items__dbt_tmp`
      
    partition by timestamp_trunc(order_date, day)
    cluster by user_id

    
    OPTIONS(
      expiration_timestamp=TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 12 hour)
    )
    as (
      

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

where orders.order_date > (select max(order_date) from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`)

    );
  
      -- 2. define partitions to update
      set (dbt_partitions_for_replacement) = (
          select as struct
              -- IGNORE NULLS: this needs to be aligned to _dbt_max_partition, which ignores null
              array_agg(distinct timestamp_trunc(order_date, day) IGNORE NULLS)
          from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items__dbt_tmp`
      );

      -- 3. run the merge statement
      

    merge into `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items` as DBT_INTERNAL_DEST
        using (
        select
        * from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items__dbt_tmp`
      ) as DBT_INTERNAL_SOURCE
        on FALSE

    when not matched by source
         and timestamp_trunc(DBT_INTERNAL_DEST.order_date, day) in unnest(dbt_partitions_for_replacement) 
        then delete

    when not matched then insert
        (`order_item_id`, `order_id`, `user_id`, `order_date`, `order_status`, `sale_price`, `product_id`, `distribution_center_id`, `product_category`, `product_department`, `distribution_center_name`)
    values
        (`order_item_id`, `order_id`, `user_id`, `order_date`, `order_status`, `sale_price`, `product_id`, `distribution_center_id`, `product_category`, `product_department`, `distribution_center_name`)

;

      -- 4. clean up the temp table
      drop table if exists `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items__dbt_tmp`

  


  

    