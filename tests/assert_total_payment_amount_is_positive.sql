select
    customer_id, 
    sum(amount) as total_amount
from {{ ref('fct_orders') }}
group by 1
having sum(amount) < 0
