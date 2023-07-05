{% macro get_section_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.timestamp()},
    {"name": "created_at", "datatype": dbt.timestamp()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "project_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
