{% if var('using_asana__task_tag', asana_source.does_table_exist('task_tag')) %}

select * 
from {{ var('task_tag') }}

{% else %}

select 
    cast(null as {{ dbt.type_string() }}) as tag_id,
    cast(null as {{ dbt.type_string() }}) as task_id
limit {{ '1' if target.type == 'redshift' else '0' }} 

{% endif %}