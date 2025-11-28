with 

source as (

    select * from {{ source('tpch', 'partsupp') }}

)

select * from source