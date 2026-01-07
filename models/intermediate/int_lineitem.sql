with 

stage_lineitem as (
    select * from {{ ref('stg_lineitem') }}
)

select * from stage_lineitem