

  create or replace view `gold-yen-476203-m8`.`thelook_dev_staging`.`stg_orders`
  OPTIONS()
  as 
SELECT *
FROM `bigquery-public-data`.`thelook_ecommerce`.`orders`
LIMIT 10;

