
with base as (

    select * 
    from {{ ref('stg_asana__task_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_asana__task_tmp')),
                staging_columns=get_task_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as task_id,
        assignee_id as assignee_user_id,
        assignee_status,
        completed as is_completed,
        completed_at,
        completed_by_id as completed_by_user_id,
        created_at,
        coalesce(due_on, due_at) as due_date,
        modified_at,
        name as task_name,
        parent_id as parent_task_id,
        start_on as start_date,
        notes as task_description,
        workspace_id
    from fields
)

select * 
from final
