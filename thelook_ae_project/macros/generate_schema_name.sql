{% macro generate_schema_name(custom_schema_name, node) -%}
  {# Use the custom schema verbatim; do not prefix with target.schema #}
  {{ custom_schema_name if custom_schema_name is not none else target.schema }}
{%- endmacro %}
