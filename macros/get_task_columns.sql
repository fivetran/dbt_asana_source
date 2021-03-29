{% macro get_task_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "assignee_id", "datatype": dbt_utils.type_string()},
    {"name": "assignee_status", "datatype": dbt_utils.type_string()},
    {"name": "completed", "datatype": "boolean"},
    {"name": "completed_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "completed_by_id", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "due_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "due_on", "datatype": dbt_utils.type_timestamp()},
    {"name": "hearted", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "modified_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "notes", "datatype": dbt_utils.type_string()},
    {"name": "num_hearts", "datatype": dbt_utils.type_int()},
    {"name": "parent_id", "datatype": dbt_utils.type_string()},
    {"name": "start_on", "datatype": dbt_utils.type_timestamp()},
    {"name": "workspace_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
