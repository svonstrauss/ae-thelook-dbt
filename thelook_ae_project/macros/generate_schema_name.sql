{% macro generate_schema_name(custom_schema_name, node) -%}
  {#
    Force dbt to use the schema defined on the model (e.g., thelook_dev_staging,
    thelook_dev_marts) without prefixing it with the base dataset from the profile.
    This keeps environments explicit and ensures models land exactly where the
    README and docs say they will.
  #}
  {{ custom_schema_name if custom_schema_name is not none else target.schema }}
{%- endmacro %}
