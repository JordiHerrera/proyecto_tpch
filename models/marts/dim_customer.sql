with customer as (
    select * from {{ ref ('stg_customer')}}
),

nation as (
    select * from {{ ref ('stg_nation')}}
),

region as (
    select * from {{ ref ('stg_region')}}
),

customer_nat_reg as (
    select
        customer_key,
        customer_name,
        customer_address,
        customer_phone,
        customer_balance,
        customer_market_segment,
        customer_comment,
        nation_name as customer_nation,
        region_name as customer_region
    from customer c
    inner join nation n on n.nation_key = c.customer_nation_key
    inner join region r on r.region_key = n.nation_region_key
)

select * from customer_nat_reg