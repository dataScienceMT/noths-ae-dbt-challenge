{{
  config (
      materialized='table',
      unique_key='id',
      )
}}

SELECT
    id,
    created_at,
    updated_at,
    order_id,
    product_id,
    quantity
FROM {{ ref('order_items') }}
