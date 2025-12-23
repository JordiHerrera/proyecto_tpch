select
    customer_key, 
    avg(customer_balance) as average_balance
from {{ ref('dim_customer') }}
group by 1
having count(customer_key) > 1 and average_balance < 1