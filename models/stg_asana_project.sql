with project as (

    select *
    from {{ var('project') }}

), fields as (

    select
      id as project_id,
      archived as is_archived,
      created_at,
      current_status, 
      due_date,
      modified_at,
      name as project_name,
      owner_id as owner_user_id,
      public as is_public,
      team_id,
      workspace_id,
      notes

    from project
    where not _fivetran_deleted
)

select *
from fields