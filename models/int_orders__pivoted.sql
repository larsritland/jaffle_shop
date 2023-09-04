with
payments as
(
    select * from {{ ref('stg_payments') }}
)

{% set payment_methods = [ 'credit_card','coupon','bank_transfer', 'gift_card' ] %}

select
    order_id
    {% for payment_method in payment_methods %}

    ,sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method}}
    
    {% endfor %}
from payments
group by 1
