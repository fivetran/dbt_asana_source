{% if var('using_asana__tag', asana_source.does_table_exist('tag')) %}

select * 
from {{ var('tag') }}

{% else %}

select 
    cast(null as {{ dbt.type_string() }}) as id,
    cast(null as {{ dbt.type_string() }}) as name,
    cast(null as {{ dbt.type_timestamp() }}) as created_at
limit {{ '1' if target.type == 'redshift' else '0' }} 

{% endif %}
