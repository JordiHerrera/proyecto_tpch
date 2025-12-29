{% snapshot snapshot_customer %}

    {{
        config(
            target_schema='snapshots',
            unique_key='customer_key',
            strategy='check',
            check_cols=['customer_name', 'customer_address', 'customer_phone', 'customer_nation_key'],
            invalidate_hard_deletes=True
        )
    }}

    select
        customer_key,
        customer_name,
        customer_address,
        customer_phone,
        customer_nation_key

    from {{ ref('stg_customer') }}

{% endsnapshot %}