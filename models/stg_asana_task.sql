with task as (

    select *
    from {{ var('task') }}

), fields as (

    select
      id as task_id,
      assignee_id as assignee_user_id, -- I like how you added user to this name. I normally don't do that, but I do think it adds clarity. Let's adopt as a standard.
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

    from task
    
)

select *
from fields