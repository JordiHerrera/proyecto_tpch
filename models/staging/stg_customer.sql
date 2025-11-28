with 

source as (

    select * from {{ source('tpch', 'customer') }}

)

select * from source