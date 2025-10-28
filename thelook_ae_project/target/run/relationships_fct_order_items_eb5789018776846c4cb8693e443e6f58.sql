
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



  
  
      
    ) dbt_internal_test