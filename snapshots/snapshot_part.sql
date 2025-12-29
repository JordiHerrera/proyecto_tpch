{% snapshot snapshot_part %}

    {{
        config(
            target_schema='snapshots',
            unique_key='part_key',
            strategy='check',
            check_cols=['part_name', 'part_manufacturer', 'part_brand', 'part_type', 'part_size'],
            invalidate_hard_deletes=True
        )
    }}

    select
        part_key,
        part_name,
        part_manufacturer,
        part_brand,
        part_type,
        part_size

    from {{ ref('stg_part') }}

{% endsnapshot %}