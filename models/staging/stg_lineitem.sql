with 

source as (

    select * from {{ source('tpch', 'lineitem') }}

),

rename as (
    select
        l_orderkey as lineitem_order_key,
        l_partkey as lineitem_part_key,
        l_suppkey as lineitem_supplier_key,
        l_linenumber as lineitem_line_number,

        l_quantity as lineitem_quantity,
        l_extendedprice as lineitem_extended_price,
        l_discount as lineitem_discount,
        l_tax as lineitem_tax,
        l_returnflag as lineitem_return_flag,
        l_linestatus as lineitem_line_status,
        l_shipdate as lineitem_ship_date,
        l_commitdate as lineitem_commit_date,
        l_receiptdate as lineitem_receipt_date,
        l_shipinstruct as lieitem_ship_instruct,
        l_shipmode as lineitem_ship_mode,
        l_comment as lineitem_comment
    from source
)

select * from rename