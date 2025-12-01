with 

source as (

    select * from {{ source('tpch', 'orders') }}

),

priority_code as (
    select
        o_orderkey as order_key,
        o_custkey as order_customer_key,
        o_orderstatus as order_status,
        o_totalprice as order_total_price,
        o_orderdate as order_date,
        {{ priority_code_separator('o_orderpriority') }}
        o_clerk as order_clerk,
        o_shippriority as order_ship_priority,
        o_comment as order_comment
    from source
)

select * from priority_code