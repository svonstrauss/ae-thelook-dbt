-- created_at: 2025-10-28T04:46:35.557146+00:00
-- finished_at: 2025-10-28T04:46:37.765470+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_dim_distribution_centers_distribution_center_id.a521a5ae02
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_dim_distribution_centers_distribution_center_id.a521a5ae02"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select distribution_center_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_distribution_centers`
where distribution_center_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.553032+00:00
-- finished_at: 2025-10-28T04:46:37.790586+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__users_user_id.bb8270fbdb
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__users_user_id.bb8270fbdb"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__users`
where user_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.561059+00:00
-- finished_at: 2025-10-28T04:46:37.821354+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_dim_distribution_centers_distribution_center_id.c14a2f0b53
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_dim_distribution_centers_distribution_center_id.c14a2f0b53"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select distribution_center_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_distribution_centers`
  where distribution_center_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.564890+00:00
-- finished_at: 2025-10-28T04:46:37.829910+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_stg_thelook__distribution_centers_distribution_center_id.4e187b38e6
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_stg_thelook__distribution_centers_distribution_center_id.4e187b38e6"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select distribution_center_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
  where distribution_center_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.550974+00:00
-- finished_at: 2025-10-28T04:46:37.831708+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_dim_products_product_id.c8b38aacfa
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_dim_products_product_id.c8b38aacfa"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_products`
where product_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.576052+00:00
-- finished_at: 2025-10-28T04:46:37.841634+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_dim_users_user_id.ea02541819
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_dim_users_user_id.ea02541819"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_users`
where user_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.568076+00:00
-- finished_at: 2025-10-28T04:46:37.848322+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__distribu_b5156ddb4b678298358e7f51c14ae700.d4dd883419
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__distribu_b5156ddb4b678298358e7f51c14ae700.d4dd883419"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select distribution_center_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__distribution_centers`
where distribution_center_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.555628+00:00
-- finished_at: 2025-10-28T04:46:37.884108+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__order_items_product_id.a0bbfbc4d6
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__order_items_product_id.a0bbfbc4d6"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
where product_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.560150+00:00
-- finished_at: 2025-10-28T04:46:37.886419+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_dim_users_user_id.07b663c72f
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_dim_users_user_id.07b663c72f"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select user_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_users`
  where user_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.573238+00:00
-- finished_at: 2025-10-28T04:46:37.886419+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_stg_thelook__products_product_id.7d29f9d88a
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_stg_thelook__products_product_id.7d29f9d88a"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select product_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
  where product_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.570575+00:00
-- finished_at: 2025-10-28T04:46:37.890426+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__products_product_id.3563120558
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__products_product_id.3563120558"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__products`
where product_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.553946+00:00
-- finished_at: 2025-10-28T04:46:37.908593+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__orders_order_date.a145b253b2
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__orders_order_date.a145b253b2"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_date
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
where order_date is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.558964+00:00
-- finished_at: 2025-10-28T04:46:37.928993+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_stg_thelook__users_user_id.ec0a00c3e0
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_stg_thelook__users_user_id.ec0a00c3e0"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select user_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__users`
  where user_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.563409+00:00
-- finished_at: 2025-10-28T04:46:37.935553+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__order_items_order_item_id.b1dccf6db3
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__order_items_order_item_id.b1dccf6db3"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_item_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
where order_item_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.577731+00:00
-- finished_at: 2025-10-28T04:46:37.937594+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__orders_user_id.9508be6109
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__orders_user_id.9508be6109"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
where user_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.565776+00:00
-- finished_at: 2025-10-28T04:46:37.937602+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_stg_thelook__orders_order_id.7f9ac893ad
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_stg_thelook__orders_order_id.7f9ac893ad"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select order_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
  where order_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.562416+00:00
-- finished_at: 2025-10-28T04:46:37.984584+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__order_items_order_id.96b754545f
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__order_items_order_id.96b754545f"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
where order_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.567149+00:00
-- finished_at: 2025-10-28T04:46:37.994117+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__orders_order_id.603ede9521
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__orders_order_id.603ede9521"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__orders`
where order_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.572381+00:00
-- finished_at: 2025-10-28T04:46:38.200070+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_dim_products_product_id.2ee5af5ba3
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_dim_products_product_id.2ee5af5ba3"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select product_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_products`
  where product_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.571412+00:00
-- finished_at: 2025-10-28T04:46:38.488873+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_stg_thelook__order_items_user_id.ee5aabcc3b
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_stg_thelook__order_items_user_id.ee5aabcc3b"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
where user_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.576796+00:00
-- finished_at: 2025-10-28T04:46:38.659772+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_stg_thelook__order_items_order_item_id.82181a8df5
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_stg_thelook__order_items_order_item_id.82181a8df5"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select order_item_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_thelook__order_items`
  where order_item_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.549848+00:00
-- finished_at: 2025-10-28T04:46:42.107645+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_fct_order_items_product_id.00dd05a99d
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_fct_order_items_product_id.00dd05a99d"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
where product_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.568916+00:00
-- finished_at: 2025-10-28T04:46:42.264703+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_fct_order_items_order_item_id.fa533d6f77
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_fct_order_items_order_item_id.fa533d6f77"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_item_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
where order_item_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.575189+00:00
-- finished_at: 2025-10-28T04:46:42.679740+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.not_null_fct_order_items_user_id.9941afe8cb
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.not_null_fct_order_items_user_id.9941afe8cb"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
where user_id is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.580492+00:00
-- finished_at: 2025-10-28T04:46:42.773440+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.relationships_fct_order_items_eb5789018776846c4cb8693e443e6f58.c113f53f2a
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.relationships_fct_order_items_eb5789018776846c4cb8693e443e6f58.c113f53f2a"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select distribution_center_id as from_field
    from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
    where distribution_center_id is not null
),

parent as (
    select distribution_center_id as to_field
    from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_distribution_centers`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.581362+00:00
-- finished_at: 2025-10-28T04:46:42.793239+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.relationships_fct_order_items_user_id__user_id__ref_dim_users_.c73dc0940f
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.relationships_fct_order_items_user_id__user_id__ref_dim_users_.c73dc0940f"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select user_id as from_field
    from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
    where user_id is not null
),

parent as (
    select user_id as to_field
    from `gold-yen-476203-m8`.`thelook_dev_marts`.`dim_users`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2025-10-28T04:46:35.578602+00:00
-- finished_at: 2025-10-28T04:46:43.149960+00:00
-- outcome: success
-- dialect: bigquery
-- node_id: test.thelook_ae_project.unique_fct_order_items_order_item_id.d873f083e7
-- query_id: not available
-- desc: execute adapter call
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"thelook_ae","target_name":"dev","node_id":"test.thelook_ae_project.unique_fct_order_items_order_item_id.d873f083e7"} */

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select order_item_id as unique_field
  from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
  where order_item_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;
