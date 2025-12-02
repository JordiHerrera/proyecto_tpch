{{ config(
    materialized = 'table'
) }}

with supplier as (
    select * from {{ ref ('stg_supplier')}}
),

nation as (
    select * from {{ ref ('stg_nation')}}
),

region as (
    select * from {{ ref ('stg_region')}}
),

sup_nat_reg as (
    select
        s.supplier_key,
        s.supplier_name,
        s.supplier_address,
        s.supplier_phone,
        s.supplier_balance,
        s.supplier_comment,
        n.nation_name as supplier_nation,
        r.region_name as supplier_region
    from supplier s
    inner join nation n on n.nation_key = s.supplier_nation_key
    inner join region r on r.region_key = n.nation_region_key
)

select * from sup_nat_reg