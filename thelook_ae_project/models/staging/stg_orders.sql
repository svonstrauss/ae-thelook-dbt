{{ config(materialized='view') }}
SELECT *
FROM {{ source('thelook','orders') }}
LIMIT 10
