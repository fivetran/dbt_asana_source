{% macro get_task_follower_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.timestamp()},
    {"name": "task_id", "datatype": dbt.type_string()},
    {"name": "user_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
