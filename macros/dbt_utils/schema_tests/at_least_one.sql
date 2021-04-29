{% macro sqlserver__test_at_least_one(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*)
from (
    select
        {# subquery aggregate columns need aliases #}
        {# thus: 'unique_values' #}
      count({{ column_name }}) as unique_values

    from {{ model }}

    having count({{ column_name }}) = 0

) validation_errors

{% endmacro %}

{% macro synapse__test_at_least_one(model) %}
    {% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}
    {% do return( tsql_utils.sqlserver__test_at_least_one(model, **kwargs)) %}
{% endmacro %}
