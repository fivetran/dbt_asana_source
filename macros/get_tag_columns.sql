{% macro get_tag_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.timestamp()},
    {"name": "color", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.timestamp()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "message", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "notes", "datatype": dbt.type_string()},
    {"name": "workspace_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
