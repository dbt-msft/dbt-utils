{% macro sqlserver__limit_zero() %}
  {{ return('where 0=1') }} 
{% endmacro %}

{% macro synapse__limit_zero() -%}
  {{ return(sqlserver__limit_zero()) }}
{%- endmacro %}