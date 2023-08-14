{{
  config (
      materialized='view',
      unique_key='id',
      cluster_by=['sent_date']
      )
}}

with source as (

  select * from {{ ref('emails') }}

),

renamed as (
  
  SELECT
      id::integer as id,
      customer_id::integer as customer_id,
      sent_date::timestamp as sent_date,
      subject,
      opened::boolean as opened,
      clicked::boolean as clicked
  FROM source
)
select * from renamed
