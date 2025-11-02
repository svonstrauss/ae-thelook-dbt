

    
    

with all_values as (

    select
        order_status as value_field,
        count(*) as n_records

    from `gold-yen-476203-m8`.`thelook_dev_marts`.`fct_order_items`
    group by order_status

)

select *
from all_values
where value_field not in (
    'Cancelled','Completed','Processing','Shipped','Returned'
)


