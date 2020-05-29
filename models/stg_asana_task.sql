with task as (

    select *
    from {{ var('task') }}

), fields as (

    select
      id as task_id,
      assignee_id,
      assignee_status,
      completed as is_completed,
      completed_at,
      completed_by_id as completed_by_user_id,
      created_at,
      due_on as due_date,
      due_at as due_date_time,
      modified_at,
      name as task_name,
      parent_id as parent_task_id,
      start_on as start_date,
      coalesce(notes, '') != '' as has_notes -- does this belong in staging?

    from task
    
)

select *
from fields