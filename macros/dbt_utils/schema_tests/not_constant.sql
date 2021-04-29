
{% macro sqlserver__test_not_constant(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*)

from (

    select
          count(distinct {{ column_name }}) as filler_column

    from {{ model }}

    having count(distinct {{ column_name }}) = 1

    ) validation_errors


{% endmacro %}

{% macro synapse__test_not_constant(model) %}
    {% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}
    {% do return( tsql_utils.sqlserver__test_not_constant(model, **kwargs)) %}
{% endmacro %}
