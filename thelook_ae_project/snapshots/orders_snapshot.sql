{% snapshot orders_snapshot %}
{{
  config(
    target_database = target.database,
    target_schema   = "thelook_dev_snapshots",
    unique_key      = "order_id",
    strategy        = "check",
    check_cols      = ["status", "shipped_at", "delivered_at", "returned_at"]
  )
}}

select *
from {{ source('thelook','orders') }}

{% endsnapshot %}
