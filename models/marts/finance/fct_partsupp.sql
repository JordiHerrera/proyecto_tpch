{{ config(
    materialized = 'table'
) }}

with supplier as (
    select * from {{ ref ('dim_supplier')}}
),

partsupp as (
    select * from {{ ref ('stg_partsupp')}}
),

part as (
    select * from {{ ref ('dim_part')}}
),

joined as (
    select
        partsupp_part_key,
        partsupp_supplier_key,
        partsupp_available_quantity,
        partsupp_supply_cost,
        partsupp_comments,
        p.part_key,
        p.part_name,
        p.part_manufacturer,
        p.part_brand,
        p.part_type,
        p.part_retail_price,
        s.supplier_key,
        s.supplier_name,
        s.supplier_nation,
        s.supplier_region
    from partsupp ps
    inner join part p on p.part_key = ps.partsupp_part_key
    inner join supplier s on s.supplier_key = ps.partsupp_supplier_key 
),

seq_id as (
    select
        row_number() over(order by partsupp_part_key, partsupp_supplier_key) as partsupp_key,
        *
    from joined
)

select * from seq_id