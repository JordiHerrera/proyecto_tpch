{% test positive_value(model, column)%}
    select {{ column }}
    from {{ model }} p
    where p.partsupp_retail_price < 0
{% endtest %}