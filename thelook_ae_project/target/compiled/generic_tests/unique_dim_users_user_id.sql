
    
    

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


