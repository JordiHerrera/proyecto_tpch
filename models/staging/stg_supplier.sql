with 

source as (

    select * from {{ source('tpch', 'supplier') }}

)

select * from source