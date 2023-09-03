with
source as
(
    select * from {{ source('jaffle_shop', 'customers') }}
),
transformed as
(
    select
        ID as customer_id,
        first_name as customer_first_name,
        last_name as customer_last_name
    from source
        
)
select * from transformed