with 

base_stg_linteitem as 
( 
    select * from {{ ref('stg_lineitem') }}
)

select lineitem_discount from base_stg_linteitem
where lineitem_discount < 0 or lineitem_discount > 1