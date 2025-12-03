with 

source as (

    select * from {{ source('tpch', 'customer') }}

),

rename as (
    select
        c_custkey as customer_key,
        c_name as customer_name,
        c_address as customer_address,
        c_phone as customer_phone,
        c_acctbal as customer_balance,
        c_mktsegment as customer_market_segment,
        c_comment as customer_comment,
        c_nationkey as customer_nation_key
    from source
)

select * from rename