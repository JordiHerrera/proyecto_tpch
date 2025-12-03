with 

source as (

    select * from {{ source('tpch', 'partsupp') }}

),

rename as (
    select
        ps_partkey as partsupp_part_key,
        ps_suppkey as partsupp_supplier_key,
        ps_availqty as partsupp_available_quantity,
        ps_supplycost as partsupp_supply_cost,
        ps_comment as partsupp_comments
    from source
)

select * from rename