select
    order_id, 
    amount
from {{ ref('orders') }}
having order_id > 1 and amount <= 0