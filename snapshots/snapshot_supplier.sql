{% snapshot snapshot_supplier %}

    {{
        config(
            target_schema='snapshots',
            unique_key='supplier_key',
            strategy='check',
            check_cols=['supplier_name', 'supplier_address', 'supplier_phone', 'supplier_nation_key'],
            invalidate_hard_deletes=True
        )
    }}

    select
        supplier_key,
        supplier_name,
        supplier_address,
        supplier_phone,
        supplier_nation_key

    from {{ ref('stg_supplier') }}

{% endsnapshot %}