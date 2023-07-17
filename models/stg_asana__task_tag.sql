
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
        task_id,
        row_number() over (partition by task_id, tag_id  
            order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
