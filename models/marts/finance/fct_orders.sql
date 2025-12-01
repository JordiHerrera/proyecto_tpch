with
orders as (
    select * from {{ ref('stg_orders') }}
),

customer as (
    select * from {{ ref('dim_customer') }}
),

customer_orders as (
    select
        o.*,
        c.customer_name,
        c.customer_address,
        c.customer_phone,
        c.customer_nation,
        c.customer_region,
        c.customer_comment
    from orders o
    inner join customer c on c.customer_key = o.order_customer_key
)

select * from customer_orders