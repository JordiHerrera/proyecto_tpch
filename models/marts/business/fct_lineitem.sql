{{ config(
    materialized = 'incremental',
    unique_key = 'lineitem_key',     
    incremental_strategy = 'merge',
    on_schema_change = 'append_new_columns'
) }}
with
base_lineitem as (
    select * from {{ ref('int_lineitem') }}
    {% if is_incremental() %}
    where lineitem_commit_date > (select max(lineitem_commit_date) from {{ this }})
    {% endif %}
),

part as (
    select * from {{ ref('dim_part') }}
),

supplier as (
    select * from {{ ref('dim_supplier') }}
),

base_orders as (
    select * from {{ ref('stg_orders') }}
),

customer as (
    select * from {{ ref('dim_customer') }}
),

joined_rename as (
    select
        l.*,
        c.customer_name as lineitem_customer_name,
        c.customer_nation as lineitem_customer_nation,
        c.customer_region as lineitem_customer_region,
        o.order_total_price as lineitem_order_total_price,
        p.part_name as lineitem_part_name,
        p.part_type as lineitem_part_type,
        p.part_brand as lineitem_part_brand,
        s.supplier_name as lineitem_supplier_name,
        s.supplier_nation as lineitem_supplier_nation,
        s.supplier_region as lineitem_supplier_region
    from base_lineitem l
    inner join base_orders o on o.order_key = l.lineitem_order_key
    inner join part p on p.part_key = l.lineitem_part_key
    inner join supplier s on s.supplier_key = l.lineitem_supplier_key
    inner join customer c on c.customer_key = o.order_customer_key
),

seq_id as (
    select
        {{ 
            dbt_utils.generate_surrogate_key
            ([
                'lineitem_order_key', 
                'lineitem_part_key', 
                'lineitem_supplier_key', 
                'lineitem_line_number'
            ]) 
        }} as lineitem_key,
        *
    from joined_rename
)

select * from seq_id