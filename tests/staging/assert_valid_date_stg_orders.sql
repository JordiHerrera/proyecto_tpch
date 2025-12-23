with 

base_stg_order as 
( 
    select * from {{ ref('stg_orders') }}
)

select order_date from base_stg_order
where order_date < to_date('1992-01-01', 'YYYY-MM-DD')  -- Fecha mas antigua posible 1992, segun contexto de los datos