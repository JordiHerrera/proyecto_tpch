{%- macro priority_code_separator(code_column, int_column='priority_code', text_column='priority_text') -%}
    cast(substr({{code_column}}, 1, position('-', {{code_column}}) - 1) as int) as {{int_column}},
        substr({{code_column}}, position('-', {{code_column}}) + 1) as {{text_column}},
{% endmacro %}