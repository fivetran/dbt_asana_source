{% if var('using_asana_task_tags', asana_source.does_table_exist('task_tag')) %}

with base as (

    select * 
    from {{ ref('stg_asana__task_tag_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_asana__task_tag_tmp')),
                staging_columns=get_task_tag_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        tag_id,
        task_id
    from fields
)

select * 
from final

{% else %}

select
    cast(null as {{ dbt.type_string() }}) as tag_id,
    cast(null as {{ dbt.type_string() }}) as task_id
limit {{ '1' if target.type == 'redshift' else '0' }} 

{% endif %}