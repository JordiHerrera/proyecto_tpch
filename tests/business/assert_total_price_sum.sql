select 
    order_key, 
    order_total_price, 
    sum(round((lineitem_extended_price * (1 - lineitem_discount)) * (1 + lineitem_tax), 2)) as total_test,
    abs(order_total_price - total_test) as diferencia
from {{ ref('fct_orders') }} o
join {{ ref('fct_lineitem') }} l ON o.order_key = l.lineitem_order_key
group by 1, 2
having diferencia > 0.2 -- 0.1