select
    customer_id
from {{ ref('customers') }}
group by 1
having count(1) > 1