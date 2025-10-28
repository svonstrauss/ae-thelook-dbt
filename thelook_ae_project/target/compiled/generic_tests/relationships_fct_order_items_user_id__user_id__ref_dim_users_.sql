
    
    

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


