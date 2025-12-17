SELECT
    COUNT(*) AS total_Rows,
    COUNT(distinct o.*) AS distinct_rows
FROM
    {{ ref('fct_orders') }} o
having  
    total_Rows = distinct_rows