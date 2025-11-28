with 

source as (

    select * from {{ source('tpch', 'part') }}

)

select * from source