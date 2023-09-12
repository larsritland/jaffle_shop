with

fullfilled_orders as
(
    select
        id as order_id
    from {{ ref('raw_orders') }}
    where status not in ('returned', 'return_pending')
),

payments as
(
    select
        order_id,
        amount
    from {{ ref('raw_payments') }}
),

final as (
    select 
        sum(payments.amount) as total_revenue
    from payments join fullfilled_orders on payments.order_id = fullfilled_orders.order_id
)

select * from final