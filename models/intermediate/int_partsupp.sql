with 

stage_partsupp as (
    select * from {{ ref('stg_partsupp') }}
)

select * from stage_partsupp