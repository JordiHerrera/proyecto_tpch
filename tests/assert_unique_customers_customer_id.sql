select
    count(*) as total_rows,
    count(distinct order_key) as distinct_rows
from {{ ref('fct_orders') }}
having count(*) > count(distinct order_key)