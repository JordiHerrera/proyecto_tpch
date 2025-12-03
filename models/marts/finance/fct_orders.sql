{{ config(
    materialized = 'table'
) }}

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
        c.customer_name as order_customer_name,
        c.customer_address as order_customer_address,
        c.customer_phone as order_customer_phone,
        c.customer_nation as order_customer_nation,
        c.customer_region as order_customer_region,
        c.customer_comment as order_customer_comment
    from orders o
    inner join customer c on c.customer_key = o.order_customer_key

)

select * from customer_orders