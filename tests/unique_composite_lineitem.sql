SELECT
    lineitem_order_key,
    lineitem_part_key,
    lineitem_supplier_key,
    lineitem_line_number
FROM
    {{ ref('stg_lineitem') }}
    -- limit 5
GROUP BY
    1, 2, 3, 4
HAVING
    COUNT(*) > 1