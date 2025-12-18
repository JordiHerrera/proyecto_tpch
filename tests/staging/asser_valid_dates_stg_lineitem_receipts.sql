with 

base_stg_linteitem as 
( 
    select * from {{ ref('stg_lineitem') }}
)

select * from base_stg_linteitem
where lineitem_receipt_date < to_date('1992-01-01', 'YYYY-MM-DD')  -- Fecha mas antigua posible 1992, segun contexto de los datos