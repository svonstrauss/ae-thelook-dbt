-- Fails if any order_item has a negative sale_price
select order_item_id
from {{ ref('fct_order_items') }}
where sale_price < 0
