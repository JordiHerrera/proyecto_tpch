with 

source as (

    select * from {{ source('tpch', 'supplier') }}

),

rename as (
    select
        s_suppkey as supplier_key,
        s_name as supplier_name,
        s_address as supplier_address,
        s_phone as supplier_phone,
        s_acctbal supplier_balance,
        s_comment as supplier_comment,
        s_nationkey as supplier_nation_key    
    from source
)

select * from rename